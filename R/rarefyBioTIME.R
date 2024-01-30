#' runResampling BioTIME
#'
#' @export
#' @param df dataframe to be resampled (in the format of the output of the
#'  \code{\link{gridding}} function
#' @param ab set to "A" for abundance and "B" for biomass
#' @param resamps Not implemented at the moment.
#'    Number of repetitions passed to \code{\link{rarefysamples}}. 1 by default.
#' @returns data.frame containing rarefied studies
#' @importFrom dplyr %>%
#' @examples
#' \dontrun{
#' library(BioTIMEr)
#' df<-gridding(subBTmeta, subBTquery)
#' runResampling(df, ab = "A")
#' }
#'

runResampling <- function(df, ab, resamps = 1L) {
  checkmate::assert_choice(x = ab, choices = c("A", "B"))
  checkmate::assert_names(
    x = colnames(df),
    must.include = c("YEAR", "SAMPLE_DESC", "Species"),
    what = "colnames")

  if (resamps != 1L)
    message("You entered a resamps value different from 1, this option is not implemented at the moment.
runResampling will run with only one repetition.
Use rarefysamples directly if more repetitions are needed.")

  base::switch(
    ab,
    A = {
      rfIDs <- unique(df$rarefyID)
      TSrf <- sapply(
        X = rfIDs,
        FUN = function(i) {
          temp_data <- df[df$rarefyID == i, ]
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
        dplyr::rename(Abundance = currency, rarefyID = rfID) %>%
        return()
    }, # end of switch
    B = {
      rfIDs <- unique(df$rarefyID)
      TSrf <- sapply(
        X = rfIDs,
        FUN = function(i) {
          temp_data <- df[df$rarefyID == i, ]
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
        dplyr::rename(Biomass = currency, rarefyID = rfID) %>%
        return()
    }) # end of base::switch
}


#' rarefy BioTIME
#' @export
#' @param Year Integer representing year of record
#' @param SampleID Description of unique sampling event, this is used to resample
#' @param Species Highest resolution of taxonomic description available
#' @param currency Set to either Numerical abundance or biomass
#' @param resamps Number of repetitions
#' @returns A data.frame with rarefied abundances/biomasses
#' @examples
#' \dontrun{
#'   library(dplyr)
#'   library(BioTIMEr)
#'   data("subBTmeta")
#'   data("subBTquery")
#'   df <- gridding(subBTmeta, subBTquery) %>%
#'     filter(rarefyID == "431_128327318")
#'   rarefysamples(Year = df$YEAR, SampleID = df$SAMPLE_DESC,
#'     Species = df$Species, currency = df$ABUNDANCE,
#'     resamps = 3L)
#'}
#'

rarefysamples <- function(Year, SampleID, Species, currency, resamps) {
  # Checking arguments
  checkmate::assertSetEqual(x = length(Year),
                            y = c(length(SampleID), length(Species),
                                  length(currency)))

  # Computing minimal effort per year in this rarefyID
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
