#' gridding BioTIME data
#'
#' @description grids BioTIME data into a discrete global grid. Multi-location
#'    studies are gridded by the latitude/longitude of their samples,
#'    single-location studies by the centroid of the study (see Details).
#'
#' @export
#'
#' @param meta (\code{data.frame}, \code{tibble} or \code{data.table}) BioTIME
#'    metadata, one row per study. It should be the metadata of the whole
#'    BioTIME database: the limit between single-location and multi-location
#'    studies is computed from all its rows (see Details).
#' @param x (\code{data.frame}, \code{tibble} or \code{data.table}) BioTIME
#'    data.
#' @param res (\code{integer}) cell resolution. Must be an integer in the range
#'   [0,30]. Larger values represent finer resolutions. Default: 12 (~96 sq km).
#'   Passed to \code{\link[dggridR]{dgconstruct}}.
#' @param res_by_data (\code{logical}) FALSE by default. If TRUE, \code{res} is
#'   replaced by the resolution whose cell area is closest to the limit between
#'   single-location and multi-location studies (see Details), found with
#'   \code{\link[dggridR]{dg_closest_res_to_area}}. The new \code{res} value is
#'   used even if a value is provided by the user.
#' @param verbose (\code{logical}) TRUE by default. If FALSE, the resolution
#'    chosen when \code{res_by_data = TRUE} is not printed. Warnings about
#'    removed studies and rows are always shown.
#' @param resByData \code{r lifecycle::badge("deprecated")} Use \code{res_by_data}
#'   instead.
#' @param btf \code{r lifecycle::badge("deprecated")} Use \code{x} instead.
#'
#' @details Each BioTIME study contains distinct samples which were collected
#' with a consistent methodology over time, and each with unique coordinates and
#' date. These samples can be fixed plots (i.e. SL or 'single-location' studies
#' where measures are taken from a set of specific georeferenced sites at any
#' given time) or wide-ranging surveys, transects, tows, and so on (i.e. ML or
#' 'multi-location' studies where measures are taken from multiple sampling
#' locations over large extents that may or may not align from year to year, see
#' \code{\link{resampling}}). \code{gridding} is a function designed to deal
#' with the issue of varying spatial extent between studies by using a global
#' grid of hexagonal cells derived from \code{\link[dggridR]{dgconstruct}} and
#' assigning the individual samples to the cells across the grid. Each sample is
#' assigned a different combination of study ID and grid cell resulting in a
#' unique identifier for each assemblage time series within each cell
#' (assemblageID). This allows for the integrity of each study and each sample
#' to be maintained, while large extent studies are split into local time series
#' at the grid cell level.
#'
#' \strong{SL and ML studies.} A study is SL if \code{NUMBER_LAT_LONG == 1} or
#' if \code{AREA_SQ_KM} is below a limit, and ML otherwise. The limit is the
#' mean plus one standard deviation of \code{AREA_SQ_KM} over the studies of
#' \code{meta} with \code{NUMBER_LAT_LONG == 1} and \code{AREA_SQ_KM <= 500}.
#' It is computed from all rows of \code{meta}, not only from the studies in
#' \code{x}: the same study can be SL or ML depending on the other rows of
#' \code{meta}, so pass the metadata of the whole database. With less than 2
#' such studies in \code{meta} the limit cannot be computed, and the function
#' stops if a study of \code{x} needs it or if \code{res_by_data = TRUE}. SL
#' studies are gridded by the centroid of the study (\code{CENT_LAT},
#' \code{CENT_LONG} of \code{meta}), so each has one cell; the sample
#' coordinates of SL studies are not used. ML studies are gridded by the
#' \code{LATITUDE} and \code{LONGITUDE} of each sample.
#'
#' \code{res} defines the global grid cell resolution, thus determining the size
#' of the cells (see \code{vignette("dggridR")}). \code{res = 12} was found to
#' be the most appropriate value when working on the whole BioTIME database
#' (corresponding to ~96 km2 cell area), but the user can define their own grid
#' resolution (e.g. \code{res = 14}). With \code{res_by_data = TRUE} the
#' resolution is the one whose cell area is closest to the SL/ML limit above
#' (not to the extent of the data).
#'
#' \strong{Checks.} The function stops when \code{STUDY_ID} is missing in
#' \code{meta} or \code{x}, and when \code{STUDY_ID} is duplicated in
#' \code{meta} (also for studies that are not in \code{x}, since a duplicated
#' study would also change the SL/ML limit). It stops when a study of \code{x}
#' with at least 2 years cannot be classified: the limit cannot be computed, or
#' \code{NUMBER_LAT_LONG} or \code{AREA_SQ_KM} is missing and the study cannot
#' be classified without it (a study with \code{NUMBER_LAT_LONG == 1} needs no
#' area). It stops when a coordinate used for gridding is missing or invalid
#' (latitude outside [-90, 90], longitude outside [-360, 360]; longitudes
#' beyond [-180, 180] are wrapped by dggridR), and when no row is left to grid.
#' It warns, with the study IDs, when rows of \code{x} have no row in
#' \code{meta} (they are dropped) and when studies with a single year are
#' removed.
#'
#' @returns Returns an object of the same class as \code{meta} (a
#' \code{data.frame}, \code{tibble} or \code{data.table}) with selected columns
#' from \code{x} and \code{meta} (\code{valid_name} of \code{x} is renamed
#' \code{Species}), a numeric (double) column \code{cell} with the cell number,
#' a character column \code{StudyMethod} (\code{"SL"} or \code{"ML"}) and a
#' character column \code{assemblageID} (concatenation of \code{STUDY_ID} and
#' \code{cell}). Rows are ordered by \code{StudyMethod} (ML first). Studies with
#' a single year are removed.
#'
#' @examples \dontrun{
#'   gridded_data <- gridding(meta = BTsubset_meta, x = BTsubset_data)
#'   gridded_data <- gridding(meta = dplyr::as_tibble(BTsubset_meta),
#'                            x = dplyr::as_tibble(BTsubset_data))
#'   gridded_data <- gridding(meta = data.table::as.data.table(BTsubset_meta),
#'                            x = data.table::as.data.table(BTsubset_data))
#' }
#'
#' @importFrom lifecycle deprecated deprecate_warn is_present
gridding <- function(
  meta,
  x,
  res = 12,
  res_by_data = FALSE,
  verbose = TRUE,
  resByData = deprecated(),
  btf = deprecated()
) {
  if (is_present(btf)) {
    deprecate_warn(
      when = "0.3.3",
      what = "gridding(btf)",
      with = "gridding(x)"
    )
    if (!missing(x)) {
      stop("Use either `x` or the deprecated `btf`, not both.", call. = FALSE)
    }
    x <- btf
  }
  if (is_present(resByData)) {
    deprecate_warn(
      when = "0.3.3",
      what = "gridding(resByData)",
      with = "gridding(res_by_data)"
    )
    if (!missing(res_by_data)) {
      stop(
        "Use either `res_by_data` or the deprecated `resByData`, not both.",
        call. = FALSE
      )
    }
    res_by_data <- resByData
  }
  result <- gridding_internal(
    meta = meta,
    x = x,
    res = res,
    res_by_data = res_by_data,
    verbose = verbose
  )
  if (inherits(meta, "data.table")) {
    data.table::setDT(result) # returns invisibly, so return `result` itself
    return(result)
  }
  if (inherits(meta, "tbl_df")) {
    return(dplyr::as_tibble(result))
  }
  return(result)
}

#' gridding BioTIME data
#' @inheritParams gridding
#' @keywords internal
gridding_internal <- function(meta, x, res, res_by_data, verbose) {
  checkmate::assert_names(
    x = colnames(meta),
    what = "colnames",
    must.include = c(
      "STUDY_ID",
      "NUMBER_LAT_LONG",
      "AREA_SQ_KM",
      "CENT_LONG",
      "CENT_LAT",
      "REALM",
      "CLIMATE",
      "TAXA",
      "ABUNDANCE_TYPE",
      "BIOMASS_TYPE"
    )
  )
  checkmate::assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c(
      "valid_name",
      "STUDY_ID",
      "DAY",
      "MONTH",
      "YEAR",
      "LATITUDE",
      "LONGITUDE",
      "ABUNDANCE",
      "BIOMASS",
      "SAMPLE_DESC",
      "resolution",
      "taxon"
    )
  )
  checkmate::assert_numeric(x$ABUNDANCE, lower = 0)
  checkmate::assert_numeric(x$BIOMASS, lower = 0)
  checkmate::assert_int(
    x = res,
    lower = 0L,
    upper = 30L,
    null.ok = FALSE,
    na.ok = FALSE
  )
  checkmate::assert_logical(
    res_by_data,
    len = 1L,
    any.missing = FALSE,
    null.ok = FALSE,
  )
  checkmate::assert_logical(
    verbose,
    len = 1L,
    any.missing = FALSE,
    null.ok = FALSE,
  )

  .assert_study_ids(meta = meta, x = x)

  AREA_SQ_KM <- meta[
    meta$NUMBER_LAT_LONG == 1L & meta$AREA_SQ_KM <= 500,
    "AREA_SQ_KM"
  ] |>
    unlist()

  SL_extent <- sum(
    base::mean(AREA_SQ_KM, na.rm = TRUE),
    stats::sd(AREA_SQ_KM, na.rm = TRUE)
  )

  meta$StudyMethod <- data.table::fifelse(
    test = meta$NUMBER_LAT_LONG == 1L | meta$AREA_SQ_KM < SL_extent,
    yes = "SL",
    no = "ML"
  )

  # See benchmarks/benchmarks.R # counting one year studies
  # tapply() gives NA for unused factor levels: which() drops them. A study
  # with a single year is removed below, so it needs no classification and no
  # coordinates; studies without a meta row are reported by .assert_study_ids().
  years_per_study <- tapply(x$YEAR, x$STUDY_ID, data.table::uniqueN)
  one_year_ids <- names(years_per_study)[which(years_per_study == 1L)]
  one_year_ids <- one_year_ids[
    is.element(one_year_ids, as.character(meta$STUDY_ID))
  ]

  .assert_classified(
    meta = meta,
    study_ids = setdiff(as.character(unique(x$STUDY_ID)), one_year_ids),
    SL_extent = SL_extent,
    n_cutoff_studies = sum(!is.na(AREA_SQ_KM)),
    res_by_data = res_by_data
  )

  bt <- dplyr::inner_join(
    x = meta |>
      dplyr::select(
        "STUDY_ID",
        "CLIMATE",
        "REALM",
        "TAXA",
        "StudyMethod",
        "CENT_LAT",
        "CENT_LONG",
        "ABUNDANCE_TYPE",
        "BIOMASS_TYPE"
      ),
    y = x |>
      dplyr::select(
        "STUDY_ID",
        "SAMPLE_DESC",
        "taxon",
        "LATITUDE",
        "LONGITUDE",
        "YEAR",
        "MONTH",
        "DAY",
        Species = "valid_name",
        "resolution",
        "ABUNDANCE",
        "BIOMASS"
      ),
    by = dplyr::join_by("STUDY_ID"),
    # One meta row per study (checked by .assert_study_ids()), many data rows.
    relationship = "one-to-many",
    # Data rows without a meta row are reported by .assert_study_ids(); meta
    # rows without data are expected (meta is often the whole database).
    unmatched = "drop",
    na_matches = "never"
  )

  data.table::setorder(bt, "StudyMethod")

  bt$lon_to_grid <- data.table::fifelse(
    test = bt$StudyMethod == "SL",
    yes = bt$CENT_LONG,
    no = bt$LONGITUDE
  )
  bt$lat_to_grid <- data.table::fifelse(
    test = bt$StudyMethod == "SL",
    yes = bt$CENT_LAT,
    no = bt$LATITUDE
  )

  if (length(one_year_ids) > 0L) {
    # See benchmarks/benchmarks.R  # Row filtering ----
    bt <- bt |>
      dplyr::filter(!is.element(as.character(STUDY_ID), one_year_ids))
    # Always reported: rows are removed, so `verbose` does not apply
    warning(
      length(one_year_ids),
      " studies with a single year were removed: STUDY_ID ",
      .format_ids(one_year_ids),
      call. = FALSE
    )
  }

  if (nrow(bt) == 0L) {
    stop(
      "No rows left to grid: no study of `x` is in `meta` with at least ",
      "2 years of data.",
      call. = FALSE
    )
  }

  .assert_coordinates(bt)

  dgg <- dggridR::dgconstruct(res = res)

  if (res_by_data) {
    # dg_closest_res_to_area() prints the resolution it picked
    if (verbose) {
      res <- dggridR::dg_closest_res_to_area(dgg, SL_extent)
    } else {
      utils::capture.output(
        res <- dggridR::dg_closest_res_to_area(dgg, SL_extent)
      )
    }
    dgg <- dggridR::dgsetres(dgg, res)
  }

  bt$cell <- dggridR::dgGEO_to_SEQNUM(
    dggs = dgg,
    in_lon_deg = bt$lon_to_grid,
    in_lat_deg = bt$lat_to_grid
  )$seqnum

  bt$assemblageID <- base::paste(bt$STUDY_ID, bt$cell, sep = "_")
  bt <- bt |>
    dplyr::select(-c("CENT_LAT", "CENT_LONG", "lat_to_grid", "lon_to_grid"))

  return(bt)
}

#' Check the STUDY_ID keys used to join data and metadata
#'
#' Stops when `STUDY_ID` is missing in `meta` or `x`, or duplicated in `meta`
#' (a duplicated key would multiply the rows of that study and every sum
#' computed later). Warns, with the number of rows and the study IDs, when rows
#' of `x` have no matching row in `meta` (the join drops them).
#' @inheritParams gridding
#' @returns `NULL`, invisibly.
#' @keywords internal
.assert_study_ids <- function(meta, x) {
  checkmate::assert_atomic_vector(
    x = meta[["STUDY_ID"]],
    any.missing = FALSE,
    .var.name = "meta$STUDY_ID"
  )
  checkmate::assert_atomic_vector(
    x = x[["STUDY_ID"]],
    any.missing = FALSE,
    .var.name = "x$STUDY_ID"
  )

  duplicated_ids <- unique(meta[["STUDY_ID"]][duplicated(meta[["STUDY_ID"]])])
  if (length(duplicated_ids) > 0L) {
    stop(
      "`meta` must have one row per study, but STUDY_ID is duplicated: ",
      .format_ids(duplicated_ids),
      call. = FALSE
    )
  }

  has_meta <- is.element(x[["STUDY_ID"]], meta[["STUDY_ID"]])
  if (!all(has_meta)) {
    warning(
      sum(!has_meta),
      " rows of `x` were dropped because their STUDY_ID is not in `meta`: ",
      .format_ids(unique(x[["STUDY_ID"]][!has_meta])),
      call. = FALSE
    )
  }
  return(invisible(NULL))
}

#' Check that every study in the data can be classified as SL or ML
#'
#' A study is SL when `NUMBER_LAT_LONG == 1` or `AREA_SQ_KM < SL_extent`. When
#' the cutoff `SL_extent` is `NA` (fewer than two studies with one lat/long and
#' an area of 500 km2 or less in `meta`) or the metadata of a study is missing,
#' `StudyMethod` is `NA`, its coordinates would not be used and dggridR would
#' put all its rows in one cell. `res_by_data = TRUE` also needs the cutoff.
#' @param meta (`data.frame`) metadata with a `StudyMethod` column.
#' @param study_ids (`character`) IDs of the studies that will be gridded.
#' @param SL_extent (`numeric`) cutoff area in km2, possibly `NA`.
#' @param n_cutoff_studies (`integer`) number of studies the cutoff is based on.
#' @param res_by_data (`logical`) whether the cutoff sets the resolution.
#' @returns `NULL`, invisibly. Stops with the study IDs and the cause.
#' @keywords internal
.assert_classified <- function(
  meta,
  study_ids,
  SL_extent,
  n_cutoff_studies,
  res_by_data
) {
  cutoff_hint <- paste0(
    "the cutoff between SL and ML studies (mean + 1 sd of AREA_SQ_KM of the ",
    "studies with NUMBER_LAT_LONG == 1 and AREA_SQ_KM <= 500 in `meta`) ",
    "cannot be computed: `meta` has ",
    n_cutoff_studies,
    " such studies and needs at least 2. Pass the full BioTIME metadata."
  )
  if (isTRUE(res_by_data) && is.na(SL_extent)) {
    stop(
      "`res_by_data = TRUE` needs a resolution, but ",
      cutoff_hint,
      call. = FALSE
    )
  }

  in_data <- is.element(as.character(meta[["STUDY_ID"]]), study_ids)
  unclassified <- in_data & is.na(meta[["StudyMethod"]])
  if (!any(unclassified)) {
    return(invisible(NULL))
  }
  missing_metadata <- unclassified &
    (is.na(meta[["NUMBER_LAT_LONG"]]) | is.na(meta[["AREA_SQ_KM"]]))
  problems <- character()
  if (any(missing_metadata)) {
    problems <- c(
      problems,
      paste0(
        "NUMBER_LAT_LONG or AREA_SQ_KM is missing in `meta` for STUDY_ID ",
        .format_ids(meta[["STUDY_ID"]][missing_metadata])
      )
    )
  }
  if (any(unclassified & !missing_metadata)) {
    problems <- c(
      problems,
      paste0(
        cutoff_hint,
        " STUDY_ID ",
        .format_ids(meta[["STUDY_ID"]][unclassified & !missing_metadata]),
        " cannot be classified."
      )
    )
  }
  stop(
    "Studies cannot be classified as SL or ML: ",
    paste(problems, collapse = "; "),
    call. = FALSE
  )
}

#' Check the coordinates that are about to be gridded
#'
#' dggridR gives a real cell (for example 732 at resolution 12) to `NA`
#' coordinates and silently accepts values outside the valid range, so bad
#' coordinates must be caught before gridding. Single-location studies are
#' gridded by the `meta` centroid, multi-location studies by the sample
#' coordinates of `x`; this is the pair stored in `lon_to_grid` and
#' `lat_to_grid`.
#' @param bt (`data.frame`) joined data with columns `STUDY_ID`,
#'   `StudyMethod`, `lon_to_grid` and `lat_to_grid`.
#' @returns `NULL`, invisibly. Stops with the study IDs and the number of rows
#'   when a coordinate is missing, infinite, or outside latitude [-90, 90] or
#'   longitude [-360, 360] (dggridR wraps longitudes beyond [-180, 180], which
#'   BioTIME data that use 0 to 360 rely on; it does not wrap far values).
#' @keywords internal
.assert_coordinates <- function(bt) {
  lat <- bt[["lat_to_grid"]]
  lon <- bt[["lon_to_grid"]]
  valid <- is.finite(lat) &
    is.finite(lon) &
    lat >= -90 &
    lat <= 90 &
    lon >= -360 &
    lon <= 360
  # is.finite() is FALSE for NA, so `valid` has no NA
  if (all(valid)) {
    return(invisible(NULL))
  }
  columns_used <- c(
    SL = "CENT_LAT and CENT_LONG of `meta`",
    ML = "LATITUDE and LONGITUDE of `x`",
    unclassified = "StudyMethod is missing"
  )
  method <- bt[["StudyMethod"]][!valid]
  method[is.na(method)] <- "unclassified"
  methods <- split(x = bt[["STUDY_ID"]][!valid], f = method)
  problems <- vapply(
    X = names(methods),
    FUN = function(name) {
      paste0(
        length(methods[[name]]),
        " rows of ",
        name,
        " studies (",
        columns_used[[name]],
        "): STUDY_ID ",
        .format_ids(unique(methods[[name]]))
      )
    },
    FUN.VALUE = character(length = 1L)
  )
  stop(
    "Coordinates must be finite, with latitude in [-90, 90] and longitude in ",
    "[-360, 360]. Found: ",
    paste(problems, collapse = "; "),
    call. = FALSE
  )
}

#' Format study IDs for a message
#' @param ids (vector) study IDs.
#' @param max_shown (`integer`) number of IDs written out.
#' @returns A single string, e.g. "10, 18, 53 and 2 more".
#' @keywords internal
.format_ids <- function(ids, max_shown = 10L) {
  ids <- as.character(ids)
  if (length(ids) <= max_shown) {
    return(paste(ids, collapse = ", "))
  }
  paste0(
    paste(ids[seq_len(max_shown)], collapse = ", "),
    " and ",
    length(ids) - max_shown,
    " more"
  )
}
