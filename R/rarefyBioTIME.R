#' Rarefy BioTIME data to an equal number of samples per year
#'
#' Takes the output of \code{\link{gridding}} and applies sample-based rarefaction to
#' standardise the number of samples per year within each cell-level time series
#' (i.e. assemblageID).
#' @inheritParams gridding
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
#' @param summarise (\code{logical}). \code{TRUE} by default. If \code{FALSE},
#' the function returns abundance and/or biomass summed at the
#'
#' @returns Returns a single long form \code{data.frame} containing the total currency
#' or currencies of interest (sum) for each species in each year within each
#' rarefied time series (i.e. \code{assemblageID}). An extra integer column called
#' \code{resamp} indicates the specific iteration.
#'
#' @details
#' Sample-based rarefaction prevents temporal variation in sampling effort from
#' affecting diversity estimates (see Gotelli N.J., Colwell R.K. 2001 Quantifying
#' biodiversity: procedures and pitfalls in the measurement and comparison of species
#' richness. Ecology Letters 4(4), 379-391) by selecting an equal number of samples
#' across all years in a time series.
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
#' @export
#'
#' @examples
#' \donttest{
#'   library(BioTIMEr)
#'   set.seed(42)
#'   x <- gridding(BTsubset_meta, BTsubset_data)
#'   resampling(x, measure = "BIOMASS", summarise = TRUE)
#'   resampling(x, measure = "ABUNDANCE")
#'   resampling(x, measure = c("ABUNDANCE","BIOMASS"))
#'   # Without summarising the species abundances are summed at the SAMPLE_DESC level
#'   resampling(x, measure = "BIOMASS", summarise = FALSE, conservative = FALSE)
#' }
#'

resampling <- function(
  x,
  measure,
  resamps = 1L,
  conservative = FALSE,
  summarise = TRUE,
  verbose = TRUE
) {
  data.table::setDT(x)
  checkmate::assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c("YEAR", "SAMPLE_DESC", "Species", measure)
  )
  base::stopifnot(
    "measure must be > 0" = all(x[, measure, with = FALSE] > 0, na.rm = TRUE)
  )
  checkmate::assert_number(
    x = resamps,
    lower = 1L,
    na.ok = FALSE,
    null.ok = FALSE
  )
  checkmate::assert_integer(x = x$YEAR, lower = 1300L, null.ok = FALSE)
  checkmate::assert_logical(
    x = conservative,
    len = 1L,
    null.ok = FALSE,
    any.missing = FALSE
  )
  checkmate::assert_logical(
    x = summarise,
    len = 1L,
    null.ok = FALSE,
    any.missing = FALSE
  )

  if (anyNA(x[, measure, with = FALSE])) {
    if (conservative) {
      x <- dtplyr::lazy_dt(x = x, immutable = FALSE, key_by = "SAMPLE_DESC") |>
        dplyr::semi_join(
          y = x |>
            dplyr::summarise(
              dplyr::across(dplyr::all_of(measure), .fns = anyNA),
              .by = "SAMPLE_DESC"
            ) |>
            dplyr::filter(rowSums(dplyr::pick(dplyr::all_of(measure))) == 0L),
          by = "SAMPLE_DESC"
        ) |>
        data.table::as.data.table()

      if (nrow(x) == 0L) {
        stop(paste("Only NA values in column(s)", measure))
      } else {
        warning(
          paste0(
            "NA values found and whole samples removed since `conservative` is TRUE.\n",
            "Only a subset of `x` is used."
          ),
          call. = FALSE
        )
      }
    } else {
      # x <- x |>
      #   dplyr::filter(
      #     !apply(
      #       X = dplyr::select(x, dplyr::all_of(measure)),
      #       MARGIN = 1,
      #       FUN = anyNA
      #     )
      #   )
      x <- stats::na.omit(x, cols = measure)

      if (nrow(x) == 0L) {
        stop(paste("Only NA values in column(s)", measure))
      } else {
        warning(
          paste0(
            "NA values found and removed.\n",
            "Only a subset of `x` is used."
          ),
          call. = FALSE
        )
      }
    }
  }

  if (
    tapply(x$YEAR, x$STUDY_ID, function(y) dplyr::n_distinct(y) == 1L) |>
      any()
    # x[j = .(V1 = data.table::uniqueN(x$YEAR) == 1L), keyby = "STUDY_ID"][
    #   j = any(V1)
    # ]
  ) {
    x <- dtplyr::lazy_dt(x = x, immutable = FALSE, key_by = "STUDY_ID") |>
      dplyr::anti_join(
        y = x |>
          dplyr::summarise(
            count = dplyr::n_distinct(.data$YEAR),
            .by = "STUDY_ID"
          ) |>
          dplyr::filter(.data$count == 1L),
        by = "STUDY_ID"
      ) |>
      data.table::as.data.table()

    if (isTRUE(verbose)) {
      warning("Some 1-year-long studies were removed.")
    }
  }

  rfIDs <- unique(x$assemblageID)
  # rfIDs <- x[j = unique(assemblageID)]
  TSrf <- lapply(
    X = rfIDs,
    FUN = function(i) {
      x[x$assemblageID == i, ] |>
        rarefysamples(
          measure = measure,
          resamps = resamps,
          summarise = summarise
        )
    }
  )
  names(TSrf) <- rfIDs

  return({
    # dplyr::bind_rows(TSrf, .id = "rfID") |>
    data.table::rbindlist(TSrf, idcol = "rfID") |>
      dtplyr::lazy_dt(immutable = FALSE) |>
      tidyr::separate(
        col = "rfID",
        into = c("STUDY_ID", "cell"),
        sep = "_",
        remove = FALSE
      ) |>
      dplyr::mutate(STUDY_ID = as.integer(.data$STUDY_ID)) |>
      dplyr::select(
        assemblageID = "rfID",
        "resamp",
        "STUDY_ID",
        "YEAR",
        "Species",
        dplyr::any_of(c("SAMPLE_DESC", "minsamp")),
        dplyr::all_of(measure)
      ) |>
      dplyr::as_tibble()
  })
}


#' Rarefy BioTIME data
#' Applies sample-based rarefaction to standardise the number of samples per year
#'    within a cell-level time series.
#' @inheritParams resampling
#' @returns Returns a single long form data frame containing the total currency
#'    of interest (sum) for each species in each year.
#' @keywords internal

rarefysamples <- function(x, measure, resamps, summarise) {
  # Computing minimal effort per year in this assemblageID
  # minsample <- tapply(x$SAMPLE_DESC, x$YEAR, function(x) {
  #   dplyr::n_distinct(x)
  # }) |>
  #   min()
  # minsample <- x[j = data.table::uniqueN(SAMPLE_DESC), keyby = "YEAR"][j = min(V1)]
  minsample <- x[j = data.table::uniqueN(SAMPLE_DESC), keyby = "YEAR"] |> min()

  rareftab_list <- lapply(
    # beginning loop on repetitions
    X = seq_len(resamps),
    FUN = function(i) {
      selected_indices <- lapply(
        # beginning sub loop on years
        X = unique(x$YEAR),
        FUN = function(y) {
          sam <- x$SAMPLE_DESC[x$YEAR == y] |>
            unique() |>
            sample(minsample, replace = FALSE)
          return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
        }
      ) |>
        unlist() # end of loop on years

      if (summarise) {
        # raref <- stats::aggregate(
        #   x = x[selected_indices, measure, drop = FALSE],
        #   by = list(
        #     YEAR = x$YEAR[selected_indices],
        #     Species = x$Species[selected_indices]
        #   ),
        #   FUN = sum
        # )
        raref <- x |>
          dtplyr::lazy_dt() |>
          dplyr::slice(selected_indices) |>
          dplyr::summarise(
            dplyr::across(.cols = measure, .fns = sum),
            .by = c("YEAR", "Species")
          ) |>
          data.table::as.data.table()
      } else {
        # Does it really make a difference?
        # raref <- stats::aggregate(
        #   x = x[selected_indices, measure, drop = FALSE],
        #   by = list(
        #     SAMPLE_DESC = x$SAMPLE_DESC[selected_indices],
        #     YEAR = x$YEAR[selected_indices],
        #     Species = x$Species[selected_indices]
        #   ),
        #   FUN = sum
        # )
        # raref$minsamp = minsample
        raref <- x |>
          dtplyr::lazy_dt(immutable = FALSE) |>
          dplyr::slice(selected_indices) |>
          dplyr::summarise(
            dplyr::across(.cols = measure, .fns = sum),
            .by = c("SAMPLE_DESC", "YEAR", "Species")
          ) |>
          dplyr::mutate(minsamp = minsample) |>
          data.table::as.data.table()
        # raref <- x[
        #   i = selected_indices,
        #   j = sum(..measure),
        #   by = .("SAMPLE_DESC", "YEAR", "Species")
        # ][j = minsamp = minsample]
      }
      return(raref)
    }
  ) # end of loop on repetitions
  return(data.table::rbindlist(rareftab_list, idcol = "resamp"))
} # end of function
