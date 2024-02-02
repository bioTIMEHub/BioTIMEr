#' runResampling BioTIME
#' Uses the output of `gridding` and applies the `rarefysamples` function.
#' @export
#' @param df `data.frame` to be resampled (in the format of the output of the
#'  \code{\link{gridding}} function).
#' @param ab set to "A" for abundance and "B" for biomass.
#' @param resamps Number of repetitions
#' @returns `data.frame` containing rarefied studies
#' @importFrom dplyr %>%
#' @examples
#' \dontrun{
#'   library(BioTIMEr)
#'   df<-gridding(subBTmeta, subBTquery)
#'   runResampling(df, ab = "A")
#' }
#'

runResampling <- function(df, ab, resamps = 1L) {
  checkmate::assert_choice(x = ab, choices = c("A", "B"))
  checkmate::assert_names(
    x = colnames(df), what = "colnames",
    must.include = c("YEAR", "SAMPLE_DESC", "Species"))

  base::switch(
    ab,
    A = {
      rfIDs <- unique(df$assemblageID)
      TSrf <- sapply(
        X = rfIDs,
        FUN = function(i) {
          temp_data <- df[df$assemblageID == i, ]
          rarefysamples(Year = temp_data$YEAR, SampleID = temp_data$SAMPLE_DESC,
                        Species = temp_data$Species, currency = temp_data$ABUNDANCE,
                        resamps = resamps)},
        USE.NAMES = TRUE, simplify = FALSE)

      dplyr::bind_rows(TSrf) %>%
        dplyr::filter(!is.na(YEAR)) %>%
        dplyr::mutate(rfID = rep(rfIDs, times = sapply(TSrf, nrow))) %>%
        tidyr::separate(rfID, into =  c("STUDY_ID", "cell"),
                        sep = "_", remove = FALSE) %>%
        # dplyr::mutate(STUDY_ID = as.integer(STUDY_ID)) %>%
        dplyr::select(-repeats, YEAR, Species, currency, rfID, STUDY_ID) %>%
        dplyr::rename(Abundance = currency, assemblageID = rfID) %>%
        return()
    }, # end of ab == A
    B = {
      rfIDs <- unique(df$assemblageID)
      TSrf <- sapply(
        X = rfIDs,
        FUN = function(i) {
          temp_data <- df[df$assemblageID == i, ]
          rarefysamples(Year = temp_data$YEAR, SampleID = temp_data$SAMPLE_DESC,
                        Species = temp_data$Species, currency = temp_data$BIOMASS,
                        resamps = resamps)},
        USE.NAMES = TRUE, simplify = FALSE)

      dplyr::bind_rows(TSrf) %>%
        dplyr::filter(!is.na(YEAR)) %>%
        dplyr::mutate(rfID = rep(rfIDs, times = sapply(TSrf, nrow))) %>%
        tidyr::separate(rfID, into =  c("STUDY_ID", "cell"),
                        sep = "_", remove = FALSE) %>%
        # dplyr::mutate(STUDY_ID = as.integer(STUDY_ID)) %>%
        dplyr::select(-repeats, YEAR, Species, currency, rfID, STUDY_ID) %>%
        dplyr::rename(Biomass = currency, assemblageID = rfID) %>%
        return()
    })  # end of ab == B
}


#' Rarefy BioTIME data
#' Applies sample-based rarefaction to standardise the number of samples per year
#'    within a cell-level time-series.
#' @param Year Integer representing year of record
#' @param SampleID Description of unique sampling event, this is used to resample
#' @param Species Highest resolution of taxonomic description available
#' @param currency Set to either (numeric) abundance or biomass
#' @param resamps Number of times the function randomly draws among the samples.
#' @returns Returns a single long form data frame containing the total currency
#'    of interest (sum) for each species in each year.
#' @noRd
#' @details
#'    Sample-based rarefaction prevents temporal variation in sampling effort
#'    from affecting diversity estimates [REF]. `rarefysamples` is a function
#'    used to count the number of samples taken in each year, identify the
#'    minimum number of samples, and then use this minimum to randomly
#'    resample each year down to that number of samples, after which standard
#'    biodiversity metrics (e.g. \code{\link{getAlpha}}, \code{\link{getBeta}})
#'    can be calculated. Here sampling effort is defined as the number of
#'    samples (SampleID) taken in each year. `currency` is a numerical column
#'    with the variable (abundance or biomass) to be retained during the
#'    sample-based rarefaction, while `resamps` can be used to define multiple
#'    iterations (see examples). To apply directly to the output from the
#'    \code{\link{gridding}} function use \code{\link{runResampling}}.
#'
#' @examples
#' \dontrun{
#'   library(dplyr)
#'   library(BioTIMEr)
#'   df <- gridding(subBTmeta, subBTquery) %>%
#'     filter(assemblageID == "10_358678")
#'   rarefysamples(Year = df$YEAR, SampleID = df$SAMPLE_DESC,
#'     Species = df$Species, currency = df$ABUNDANCE,
#'     resamps = 3)
#'}
#'

rarefysamples <- function(Year, SampleID, Species, currency, resamps) {
  # Checking arguments
  checkmate::assertSetEqual(x = length(Year),
                            y = c(length(SampleID), length(Species),
                                  length(currency)))
  checkmate::assert_number(x = resamps, lower = 1,
                           na.ok = FALSE, null.ok = FALSE)

  # Computing minimal effort per year in this assemblageID
  minsample <- min(tapply(SampleID, Year, function(x) length(unique(x))))

  rareftab_list <- lapply( # beginning loop on repetitions
    X = seq_len(resamps),
    FUN = function(i) {
      selected_indices <- unlist(lapply( # beginning sub loop on years
        X = unique(Year),
        FUN = function(y) {
          samps <- unique(SampleID[Year == y])
          sam <- sample(samps, minsample, replace = TRUE)
          return(which(SampleID %in% sam & Year == y))
        })) # end of loop on years

      tYear      <- Year[selected_indices]
      tSpecies   <- Species[selected_indices]
      tcurrency  <- currency[selected_indices]

      raref <- stats::aggregate(x = tcurrency,
                                by = list(tYear, tSpecies),
                                FUN = sum)
      raref$repeats <- i
      return(raref)

    }) # end of loop on repetitions

  rareftab <- do.call(rbind, rareftab_list)
  return(stats::setNames(rareftab, c("YEAR", "Species", "currency", "repeats")))

} # end of function
