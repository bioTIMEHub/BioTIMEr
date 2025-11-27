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
#' the function returns abundance and/or biomass summed at the SAMPLE_DESC level
#' git pull(i.e., per sample), rather than per species per year.
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
#'   resampling(x, measure = "ABUNDANCE", verbose = FALSE)
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
  UseMethod("resampling")
}

#' @export
resampling.default <- function(
  x,
  measure,
  resamps = 1L,
  conservative = FALSE,
  summarise = TRUE,
  verbose = TRUE
) {
  gridded <- data.table::copy(x)
  data.table::setDT(gridded)

  res <- resampling_internal(
    x = gridded,
    measure = measure,
    resamps = resamps,
    conservative = conservative,
    summarise = summarise,
    verbose = verbose
  )

  data.table::setDF(res)

  return(res)
}

#' @export
resampling.tbl_df <- function(
  x,
  measure,
  resamps = 1L,
  conservative = FALSE,
  summarise = TRUE,
  verbose = TRUE
) {
  gridded <- data.table::copy(x)
  data.table::setDT(gridded)

  res <- resampling_internal(
    x = gridded,
    measure = measure,
    resamps = resamps,
    conservative = conservative,
    summarise = summarise,
    verbose = verbose
  ) |>
    dplyr::as_tibble()
  return(res)
}

#' @export
resampling.data.table <- function(
  x,
  measure,
  resamps = 1L,
  conservative = FALSE,
  summarise = TRUE,
  verbose = TRUE
) {
  resampling_internal(
    x = x,
    measure = measure,
    resamps = resamps,
    conservative = conservative,
    summarise = summarise,
    verbose = verbose
  )
}


#' @inheritParams resampling
#' @keywords internal
resampling_internal <- function(
  x,
  measure,
  resamps,
  conservative,
  summarise,
  verbose
) {
  checkmate::assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c("YEAR", "SAMPLE_DESC", "Species", measure)
  )
  base::stopifnot(
    "measure must be > 0" = all(x[, ..measure] > 0, na.rm = TRUE)
  )
  checkmate::assert_number(
    x = resamps,
    lower = 1L,
    na.ok = FALSE,
    null.ok = FALSE
  )
  checkmate::assert_integer(
    x = x$YEAR,
    lower = 1300L,
    null.ok = FALSE,
    any.missing = FALSE
  )
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
  checkmate::assert_logical(
    x = verbose,
    len = 1L,
    null.ok = FALSE,
    any.missing = FALSE
  )
  if (anyNA(x[, ..measure])) {
    if (conservative) {
      # See benchmarks.R   # semi_join versus data.table antijoin
      x |>
        dplyr::semi_join(
          y = x |>
            dplyr::summarise(
              dplyr::across(dplyr::all_of(measure), .fns = anyNA),
              .by = "SAMPLE_DESC"
            ) |>
            dplyr::filter(rowSums(dplyr::pick(dplyr::all_of(measure))) == 0L),
          by = "SAMPLE_DESC"
        )
      if (nrow(x) == 0L) {
        stop(paste("Only NA values in column(s)", measure))
      } else if (verbose) {
        warning(
          "NA values found and whole samples removed since `conservative` is TRUE.\n",
          "Only a subset of `x` is used.",
          call. = FALSE
        )
      }
    } else {
      x <- stats::na.omit(x, cols = measure)

      if (nrow(x) == 0L) {
        stop(paste("Only NA values in column(s)", measure))
      } else if (verbose) {
        warning(
          "NA values found and removed.\n",
          "Only a subset of `x` is used.",
          call. = FALSE
        )
      }
    }
  }
  one_year_studies <- tapply(x$YEAR, x$STUDY_ID, function(y) {
    data.table::uniqueN(y) == 1L
  })
  if (any(one_year_studies)) {
    # See benchmarks.R  # Row filtering ----
    x <- x |>
      dplyr::filter(
        !is.element(STUDY_ID, names(one_year_studies)[which(one_year_studies)])
      )
    if (verbose) warning("Some 1-year-long studies were removed.")
  }

  # Computing minimal effort per year per assemblageID
  x <- data.table::setDT(x)
  x[
    j = minsamp := data.table::uniqueN(SAMPLE_DESC),
    keyby = c("assemblageID", "YEAR")
  ][j = minsamp := min(minsamp), keyby = "assemblageID"]

  # Loop on resamps
  x <- lapply(X = 1L:resamps, FUN = function(resamp) {
    resampling_core(
      x |>
        dplyr::select(
          "assemblageID",
          "minsamp",
          "SAMPLE_DESC",
          "Species",
          "YEAR",
          dplyr::all_of(measure)
        ),
      measure = measure,
      summarise = summarise
    )
  }) |>
    data.table::rbindlist(idcol = "resamp")

  # See benchmarks.R # tidyr::separate vs data.table::tstrsplit (by reference)
  x[
    j = c("STUDY_ID", "cell") := data.table::tstrsplit(
      assemblageID,
      split = "_",
      type.convert = as.integer
    )
  ]

  return({
    x |>
      dplyr::select(
        "assemblageID",
        "resamp",
        "STUDY_ID",
        "YEAR",
        "Species",
        dplyr::any_of(c("SAMPLE_DESC", "minsamp")),
        dplyr::all_of(measure)
      )
  })
}


#' Rarefy BioTIME data
#' Applies sample-based rarefaction to standardise the number of samples per year
#'    within a cell-level time series.
#' @inheritParams resampling
#' @returns Returns a single long form data frame containing the total currency
#'    of interest (sum) for each species in each year.
#' @keywords internal

resampling_core <- function(x, measure, summarise) {
  # See benchmarks.R   # lapply vs data.table keyby ## resampling_core 1
  selected_indices <- x[
    j = .(
      sel = sample(
        x = unique(SAMPLE_DESC),
        size = unique(minsamp),
        replace = FALSE
      )
    ),
    keyby = c("assemblageID", "YEAR")
  ]$sel

  if (summarise) {
    # See benchmarks.R   # lapply vs data.table keyby ## resampling_core 2
    raref <- x[
      i = is.element(SAMPLE_DESC, selected_indices),
      j = lapply(X = .SD, FUN = sum),
      .SDcols = measure,
      by = c("assemblageID", "YEAR", "Species")
    ]
  } else {
    raref <- x[
      i = is.element(SAMPLE_DESC, selected_indices),
      j = lapply(X = .SD, FUN = sum),
      .SDcols = measure,
      by = c(
        "assemblageID",
        "minsamp",
        "SAMPLE_DESC",
        "YEAR",
        "Species"
      )
    ]
  }
  return(raref)
} # end of function
