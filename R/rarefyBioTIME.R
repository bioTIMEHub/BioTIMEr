#' Rarefy BioTIME data to an equal number of samples per year
#'
#' Takes the output of \code{\link{gridding}} and applies sample-based rarefaction to
#' standardise the number of samples per year within each cell-level time series
#' (i.e. assemblageID).
#' @export
#' @param x (\code{data.frame}) BioTIME gridded data to be resampled (in the format of
#' the output of the \code{\link{gridding}} function).
#' @param measure (\code{character}) currency to be retained during the sample-based
#' rarefaction. Can be either defined by a single column name or a vector of
#' two or more column names.
#' @param resamps (\code{integer}) number of repetitions. Default is 1.
#' @param conservative (\code{logical}). \code{FALSE} by default. If \code{TRUE},
#' whenever a \code{NA}
#' is found in the measure field(s), the whole sample is removed instead of the
#' missing observations only.
#'
#' @returns Returns a single long form \code{data.frame} containing the total currency
#' or currencies of interest (sum) for each species in each year within each
#' rarefied time series (i.e. \code{assemblageID}). An extra integer column called
#' \code{resamp} indicates the specific iteration.
#'
#' @details
#' Sample-based rarefaction prevents temporal variation in sampling effort from
#' affecting diversity estimates (see Gotelli N.J., Colwell R.K. 2001 Quantifying biodiversity: procedures and pitfalls in the measurement and comparison of species richness. Ecology Letters 4(4), 379-391) by selecting an equal number of samples across all years in a time series.
#' \code{resampling} counts the number of unique samples taken in each year (sampling effort),
#' identifies the minimum number of samples across all years, and then uses this minimum to
#' randomly resample each year down to that number. Thus, standardising the
#' sampling effort between years,
#' standard biodiversity metrics can be calculated based on an equal number of
#' samples (e.g. using \code{\link{getAlphaMetrics}}, \code{\link{getAlphaMetrics}}).
#'  \code{measure} is a \code{character}
#' input specifying the chosen currency to be used during the sample-based
#' rarefaction. It can be a single column name or a vector of two or more column
#' names - e.g. for BioTIME, \code{measure="ABUNDANCE"}, \code{measure="BIOMASS"}
#' or \code{measure = c("ABUNDANCE", "BIOMASS")}.
#'
#' By default, any observations with \code{NA} within the currency field(s) are
#' removed. You can choose to remove the full sample where such observations are
#' present by setting \code{conservative} to \code{TRUE}. \code{resamps} can be used to define
#' multiple iterations, effectively creating multiple alternative datasets
#' as in each iteration different samples will be randomly selected for the
#' years where number of samples > minimum.
#' Note that the function always returns a single data frame, i.e. if \code{resamps} > 1,
#' the returned data frame is the result of individual data frames concatenated
#' together, one from each iteration identified by a numerical
#' unique identifier 1:resamps.
#'
#' @importFrom dplyr %>%
#' @examples
#' \donttest{
#'   library(BioTIMEr)
#'   set.seed(42)
#'   x <- gridding(BTsubset_meta, BTsubset_data)
#'   resampling(x, measure = "BIOMASS")
#'   resampling(x, measure = "ABUNDANCE")
#'   resampling(x, measure = c("ABUNDANCE","BIOMASS"))
#' }
#'

resampling <- function(x, measure, resamps = 1L, conservative = FALSE) {
  checkmate::assert_names(
    x = colnames(x), what = "colnames",
    must.include = c("YEAR", "SAMPLE_DESC", "Species", measure))
  base::stopifnot("measure must be > 0" = all(x[, measure] > 0, na.rm = TRUE))
  checkmate::assert_number(x = resamps, lower = 1L,
                           na.ok = FALSE, null.ok = FALSE)
  checkmate::assert_integer(x = x$YEAR, lower = 1300L, null.ok = FALSE)
  checkmate::assert_logical(x = conservative, len = 1L,
                            null.ok = FALSE, any.missing = FALSE)



  if (anyNA(x[, measure])) {
    if (conservative) {
      x <- stats::aggregate(x = x[, measure, drop = FALSE],
                              by = list(SAMPLE_DESC = x$SAMPLE_DESC),
                              function(j) anyNA(j)) %>%
        dplyr::mutate(na_values = rowSums(dplyr::select(., dplyr::all_of(measure)))) %>%
        dplyr::filter(.data$na_values == 0L) %>%
        dplyr::semi_join(x = x, y = ., by = "SAMPLE_DESC")

      warning(paste0("NA values found and whole samples removed since `conservative` is TRUE.\n",
                     "Only a subset of `x` is used."))
    } else {
      x <- dplyr::filter(x, !apply(
        X = dplyr::select(x, dplyr::all_of(measure)),
        MARGIN = 1,
        FUN = anyNA))
      warning(paste0("NA values found and removed.\n",
                     "Only a subset of `x` is used."))
    }
  }

  rfIDs <- unique(x$assemblageID)
  TSrf <- sapply(
    X = rfIDs,
    FUN = function(i) {
      temp_data <- x[x$assemblageID == i, ]
      rarefysamples(x = temp_data,
                    measure = measure,
                    resamps = resamps)},
    USE.NAMES = TRUE, simplify = FALSE)

  dplyr::bind_rows(TSrf) %>%
    dplyr::mutate(rfID = rep(rfIDs, times = sapply(TSrf, nrow))) %>%
    tidyr::separate("rfID", into =  c("STUDY_ID", "cell"),
                    sep = "_", remove = FALSE) %>%
    dplyr::mutate(STUDY_ID = as.integer(.data$STUDY_ID)) %>%
    dplyr::select("resamp", assemblageID = "rfID", "STUDY_ID", "YEAR", "Species",
                  dplyr::all_of(measure)) %>%
    return()
}



#' Rarefy BioTIME data
#' Applies sample-based rarefaction to standardise the number of samples per year
#'    within a cell-level time series.
#' @inheritParams resampling
#' @returns Returns a single long form data frame containing the total currency
#'    of interest (sum) for each species in each year.
#' @keywords internal

rarefysamples <- function(x, measure, resamps) {
  # Computing minimal effort per year in this assemblageID
  minsample <- min(tapply(x$SAMPLE_DESC,
                          x$YEAR,
                          function(x) length(unique(x))))

  rareftab_list <- lapply( # beginning loop on repetitions
    X = seq_len(resamps),
    FUN = function(i) {
      selected_indices <- unlist(lapply( # beginning sub loop on years
        X = unique(x$YEAR),
        FUN = function(y) {
          samps <- unique(x$SAMPLE_DESC[x$YEAR == y])
          sam <- sample(samps, minsample, replace = FALSE)
          return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
        })) # end of loop on years

      tYear    <- x[selected_indices, "YEAR"]
      tSpecies <- x[selected_indices, "Species"]
      tcurrency <- x[selected_indices, measure, drop = FALSE]

      raref <- stats::aggregate(x = tcurrency,
                                by = list(YEAR = tYear, Species = tSpecies),
                                FUN = sum)
      raref$resamp <- i
      return(raref)

    }) # end of loop on repetitions

  rareftab <- dplyr::bind_rows(rareftab_list)
  return(rareftab)

} # end of function
