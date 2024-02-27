#' runResampling BioTIME
#' Uses the output of `gridding` and applies the `rarefysamples` function.
#' @export
#' @param df `data.frame` to be resampled (in the format of the output of the
#'  \code{\link{gridding}} function).
#' @param ab (character) Enter the names of the columns of interest:
#' "ABUNDANCE", "BIOMASS" or c("ABUNDANCE","BIOMASS"). The column cannot have 0s.
#' @param resamps (integer) Number of repetitions, 1 by default.
#' @param conservative (logical) If `TRUE`, whenever a NA is found for abundance
#' or biomass, the whole sample is removed instead of the missing observations
#' only. `FALSE` by default.
#' @returns `data.frame` containing rarefied studies
#' @importFrom dplyr %>%
#' @examples
#' \dontrun{
#'   library(BioTIMEr)
#'   set.seed(42)
#'   df <- gridding(subBTmeta, subBTquery)
#'   runResampling(df, ab = "BIOMASS")
#'   runResampling(df, ab = "ABUNDANCE")
#'   runResampling(df, ab = c("ABUNDANCE","BIOMASS"))
#' }
#'

runResampling <- function(df, ab, resamps = 1L, conservative = FALSE) {
  checkmate::assert_names(
    x = colnames(df), what = "colnames",
    must.include = c("YEAR", "SAMPLE_DESC", "Species", ab))
  base::stopifnot("ab must be > 0" = all(df[, ab] > 0, na.rm = TRUE))
  checkmate::assert_number(x = resamps, lower = 1L,
                           na.ok = FALSE, null.ok = FALSE)
  checkmate::assert_integer(x = df$YEAR, lower = 1300L, null.ok = FALSE)
  checkmate::assert_logical(x = conservative, len = 1L,
                            null.ok = FALSE, any.missing = FALSE)



  if (anyNA(df[, ab])) {
    if (conservative) {
      df <- stats::aggregate(x = df[, ab, drop = FALSE],
                              by = list(SAMPLE_DESC = df$SAMPLE_DESC),
                              function(j) anyNA(j)) %>%
        dplyr::mutate(na_values = rowSums(dplyr::select(., dplyr::all_of(ab)))) %>%
        dplyr::filter(na_values == 0L) %>%
        dplyr::semi_join(x = df, y = ., by = "SAMPLE_DESC")

      warning(paste0("NA values found and whole samples removed since `conservative` is TRUE.\n",
                     "Only a subset of `df` is used."))
    } else {
      df <- dplyr::filter(df, !apply(
        X = dplyr::select(df, dplyr::all_of(ab)),
        MARGIN = 1,
        FUN = anyNA))
      warning(paste0("NA values found and removed.\n",
                     "Only a subset of `df` is used."))
    }
  }

  rfIDs <- unique(df$assemblageID)
  TSrf <- sapply(
    X = rfIDs,
    FUN = function(i) {
      temp_data <- df[df$assemblageID == i, ]
      rarefysamples(df = temp_data,
                    ab = ab,
                    resamps = resamps)},
    USE.NAMES = TRUE, simplify = FALSE)

  dplyr::bind_rows(TSrf) %>%
    dplyr::mutate(rfID = rep(rfIDs, times = sapply(TSrf, nrow))) %>%
    tidyr::separate(rfID, into =  c("STUDY_ID", "cell"),
                    sep = "_", remove = FALSE) %>%
    dplyr::mutate(STUDY_ID = as.integer(STUDY_ID)) %>%
    dplyr::select(resamp, assemblageID = rfID, STUDY_ID, YEAR, Species,
                  dplyr::all_of(ab)) %>%
    return()
}



#' Rarefy BioTIME data
#' Applies sample-based rarefaction to standardise the number of samples per year
#'    within a cell-level time-series.
#' @inheritParams runResampling
#' @returns Returns a single long form data frame containing the total currency
#'    of interest (sum) for each species in each year.
#' @keywords internal
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

rarefysamples <- function(df, ab, resamps) {
  # Computing minimal effort per year in this assemblageID
  minsample <- min(tapply(df$SAMPLE_DESC,
                          df$YEAR,
                          function(x) length(unique(x))))

  rareftab_list <- lapply( # beginning loop on repetitions
    X = seq_len(resamps),
    FUN = function(i) {
      selected_indices <- unlist(lapply( # beginning sub loop on years
        X = unique(df$YEAR),
        FUN = function(y) {
          samps <- unique(df$SAMPLE_DESC[df$YEAR == y])
          sam <- sample(samps, minsample, replace = TRUE)
          return(which(df$SAMPLE_DESC %in% sam & df$YEAR == y))
        })) # end of loop on years

      tYear    <- df[selected_indices, "YEAR"]
      tSpecies <- df[selected_indices, "Species"]
      tcurrency <- df[selected_indices, ab, drop = FALSE]

      raref <- stats::aggregate(x = tcurrency,
                                by = list(YEAR = tYear, Species = tSpecies),
                                FUN = sum)
      raref$resamp <- i
      return(raref)

    }) # end of loop on repetitions

  rareftab <- dplyr::bind_rows(rareftab_list)
  return(rareftab)

} # end of function
