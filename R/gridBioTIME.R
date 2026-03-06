#' gridding BioTIME data
#'
#' @description grids BioTIME data into a discrete global grid based on the
#'    location of the samples (latitude/longitude).
#'
#' @export
#'
#' @param meta (\code{data.frame}, \code{tibble} or \code{data.table}) BioTIME
#'    metadata.
#' @param x (\code{data.frame}, \code{tibble} or \code{data.table}) BioTIME
#'    data.
#' @param res (\code{integer}) cell resolution. Must be in the range [0,30].
#'   Larger values represent finer resolutions. Default: 12 (~96 sq km). Passed
#'   to \code{\link[dggridR]{dgconstruct}}.
#' @param res_by_data (\code{logical}) FALSE by default. If TRUE, the function
#'   \code{\link[dggridR]{dg_closest_res_to_area}} is called to adapt \code{res}
#'    to the data extent. The new \code{res} value is used even if a value is
#'    provided by the user.
#' @param verbose if TRUE, a warning will be shown when one-year-long time
#'    series are found in x and excluded.
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
#' \code{runResampling}. \code{gridding} is a function designed to deal with the
#' issue of varying spatial extent between studies by using a global grid of
#' hexagonal cells derived from \code{\link[dggridR]{dgconstruct}} and assigning
#' the individual samples to the cells across the grid based on its latitude and
#' longitude. Specifically, each sample is assigned a different combination of
#' study ID and grid cell resulting in a unique identifier for each assemblage
#' time series within each cell (assemblageID). This allows for the integrity of
#' each study and each sample to be maintained, while large extent studies are
#' split into local time series at the grid cell level. By default meta
#' represents a long form data frame containing the data information for BioTIME
#' studies and \code{x} is a data frame containing long form data from a main
#' BioTIME query (see Example). \code{res} defines the global grid cell
#' resolution, thus determining the size of the cells (see
#' \code{vignette("dggridR")}). \code{res = 12} was found to be the most
#' appropriate value when working on the whole BioTIME database(corresponding to
#' ~96 km2 cell area), but the user can define their own grid resolution (e.g.
#' \code{res = 14}, or when \code{res_by_data = TRUE} allow the function to find
#' the best \code{res} based on the average study extent.
#'
#' @returns Returns a \code{'data.frame'}, with selected columns from the
#' \code{x} and \code{meta} data frames, an extra integer column called
#' \code{'cell'} and two character columns called 'StudyMethod' and
#' 'assemblageID' (concatenation of \code{STUDY_ID} and \code{cell}).
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
    x <- btf
  }
  if (is_present(resByData)) {
    deprecate_warn(
      when = "0.3.3",
      what = "gridding(resByData)",
      with = "gridding(res_by_data)"
    )
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
    return(data.table::setDT(result))
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
  checkmate::assert_number(
    x = res,
    lower = 0,
    upper = 30,
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
    by = dplyr::join_by("STUDY_ID")
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

  # See benchmarks/benchmarks.R # counting one year studies
  one_year_studies <- tapply(bt$YEAR, bt$STUDY_ID, function(y) {
    data.table::uniqueN(y) == 1L
  })

  if (any(one_year_studies)) {
    # See benchmarks/benchmarks.R  # Row filtering ----
    bt <- bt |>
      dplyr::filter(
        !is.element(STUDY_ID, names(one_year_studies)[which(one_year_studies)])
      )
    if (verbose) warning("Some 1-year-long studies were removed.")
  }

  dgg <- dggridR::dgconstruct(res = res)

  if (res_by_data) {
    res <- dggridR::dg_closest_res_to_area(dgg, SL_extent)
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

  if (
    tapply(
      X = bt$cell[bt$StudyMethod == "SL"],
      INDEX = bt$STUDY_ID[bt$StudyMethod == "SL"],
      FUN = function(x) data.table::uniqueN(x) == 1L
    ) |>
      all()
  ) {
    if (verbose) base::message("OK: all SL studies have 1 grid cell")
  } else {
    base::stop("ERROR: some SL studies have > 1 grid cell")
  }

  return(bt)
}
