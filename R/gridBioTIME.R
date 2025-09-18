#' gridding BioTIME data
#'
#' @description grids BioTIME data into a discrete global grid based on the
#'    location of the samples (latitude/longitude).
#' @export
#' @param meta (\code{data.frame}) BioTIME metadata.
#' @param btf (\code{data.frame}) BioTIME data.
#' @param res (\code{integer}) cell resolution. Must be in the range [0,30]. Larger values
#'   represent finer resolutions. Default: 12 (~96 sq km). Passed to
#'   \code{\link[dggridR]{dgconstruct}}.
#' @param resByData (\code{logical}) FALSE by default. If TRUE, the function
#'   \code{\link[dggridR]{dg_closest_res_to_area}} is called to adapt \code{res}
#'    to the data extent.
#' @param verbose if TRUE, a warning will be shown when one-year-long time series
#' are found in btf and excluded.
#'
#' @details
#' Each BioTIME study contains distinct samples which were collected with a consistent
#' methodology over time, and each with unique coordinates and date.
#' These samples can be fixed plots (i.e. SL or
#' 'single-location' studies where measures are taken from a set of specific
#' georeferenced sites at any given time) or wide-ranging surveys, transects,
#' tows, and so on (i.e. ML or 'multi-location' studies where measures are taken
#' from multiple sampling locations over large extents that may or may not align
#' from year to year,
#' see \code{runResampling}. \code{gridding} is a function designed to deal with the issue
#' of varying spatial extent between studies by using a global grid of hexagonal cells
#' derived from \code{\link[dggridR]{dgconstruct}} and assigning the individual
#' samples to the cells across the grid based on its latitude and
#' longitude. Specifically, each sample is assigned
#' a different combination of study ID and grid cell resulting in a unique
#' identifier for each assemblage time series within each cell
#' (assemblageID). This allows for the integrity of each study and each sample
#' to be maintained, while large extent studies are split into local time series
#' at the grid cell level. By default meta represents a long form data frame
#' containing the data information for BioTIME studies and \code{btf} is a data frame
#' containing long form data from a main BioTIME query (see Example). \code{res}
#' defines the global grid cell resolution, thus determining the size of the
#' cells (see \code{vignette("dggridR")}). \code{res = 12} was found to be the most
#' appropriate value when working on the whole BioTIME database(corresponding
#' to ~96 km2 cell area), but the user can define their own grid resolution
#' (e.g. \code{res = 14}, or when \code{resbyData = TRUE} allow the function to find the
#' best \code{res} based on the average study extent.
#'
#' @returns Returns a \code{'data.frame'}, with selected columns from the
#' \code{btf} and \code{meta} data frames, an extra integer column called
#' \code{'cell'} and two character columns called 'StudyMethod' and 'assemblageID'
#' (concatenation of \code{STUDY_ID} and \code{cell}).
#'
#' @examples
#'   library(BioTIMEr)
#'   gridded_data <- gridding(meta = BTsubset_meta, btf = BTsubset_data)
#'

gridding <- function(meta, btf, res = 12, resByData = FALSE, verbose = TRUE) {
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
    x = colnames(btf),
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
  checkmate::assert_numeric(btf$ABUNDANCE, lower = 0)
  checkmate::assert_numeric(btf$BIOMASS, lower = 0)
  checkmate::assert_number(
    x = res,
    lower = 0,
    upper = 30,
    null.ok = FALSE,
    na.ok = FALSE
  )
  checkmate::assert_logical(
    resByData,
    len = 1L,
    any.missing = FALSE,
    null.ok = FALSE,
  )

  data.table::setDT(btf)
  data.table::setDT(meta)

  meta <- meta |>
    dtplyr::lazy_dt(immutable = FALSE) |>
    dplyr::mutate(
      StudyMethod = dplyr::if_else(.data$NUMBER_LAT_LONG == 1, "SL", NA)
    ) |>
    data.table::as.data.table()

  # In this block, the computation of the lazy command above might be done twice
  # and the filtration is done twice for no good reason
  SL_extent_mean <- meta |>
    dplyr::filter(.data$StudyMethod == "SL" & .data$AREA_SQ_KM <= 500) |>
    dplyr::summarise(extent_mean = mean(.data$AREA_SQ_KM, na.rm = TRUE)) |>
    dplyr::pull("extent_mean")
  SL_extent_sd <- meta |>
    dplyr::filter(.data$StudyMethod == "SL" & .data$AREA_SQ_KM <= 500) |>
    dplyr::summarise(extent_sd = stats::sd(.data$AREA_SQ_KM, na.rm = TRUE)) |>
    dplyr::pull("extent_sd")

  bt <- dplyr::inner_join(meta, btf, by = "STUDY_ID") |>
    dplyr::rename(Species = "valid_name") |>
    dtplyr::lazy_dt(immutable = FALSE) |>
    dplyr::mutate(
      StudyMethod = dplyr::if_else(.data$NUMBER_LAT_LONG == 1, "SL", "ML")
    ) |>
    dplyr::mutate(
      StudyMethod = dplyr::if_else(
        condition = .data$AREA_SQ_KM < (SL_extent_mean + SL_extent_sd),
        true = "SL",
        false = .data$StudyMethod
      )
    ) |>
    dplyr::mutate(
      lon_to_grid = dplyr::if_else(
        condition = .data$StudyMethod == "SL",
        true = .data$CENT_LONG,
        false = .data$LONGITUDE
      ),
      lat_to_grid = dplyr::if_else(
        condition = .data$StudyMethod == "SL",
        true = .data$CENT_LAT,
        false = .data$LATITUDE
      )
    ) |>
    data.table::as.data.table(bt)

  if (
    # tapply(bt$YEAR, bt$STUDY_ID, function(y) dplyr::n_distinct(y) == 1L) |>
    #   any()
    bt[j = data.table::uniqueN(YEAR) == 1L, keyby = "STUDY_ID"][j = any(V1)]
    # bt |>
    #   dplyr::summarise(
    #     dplyr::n_distinct(.data$YEAR) == 1L,
    #     .by = "STUDY_ID"
    #   ) |>
    #   dplyr::select(-"STUDY_ID") |>
    #   dplyr::pull() |>
    #   any()
  ) {
    # anti_join does not seem to be translated into dtplyr data.table so a new
    # column followed by filter would make sense
    bt <- dtplyr::lazy_dt(bt, immutable = FALSE, key_by = "STUDY_ID") |>
      dplyr::anti_join(
        x = bt,
        y = bt |>
          dplyr::summarise(
            count = dplyr::n_distinct(.data$YEAR),
            .by = "STUDY_ID"
          ) |>
          dplyr::filter(.data$count == 1L),
        by = "STUDY_ID"
      ) |>
      data.table::as.data.table()
    if (isTRUE(verbose)) warning("Some 1-year-long studies were removed.")
  }

  dgg <- dggridR::dgconstruct(res = res)

  if (resByData) {
    res <- dggridR::dg_closest_res_to_area(dgg, SL_extent_mean + SL_extent_sd)
    dgg <- dggridR::dgsetres(dgg, res)
  }

  bt <- bt |>
    dtplyr::lazy_dt(immutable = FALSE, key_by = "STUDY_ID") |>
    dplyr::mutate(
      cell = dggridR::dgGEO_to_SEQNUM(
        dggs = dgg,
        in_lon_deg = lon_to_grid,
        in_lat_deg = lat_to_grid
      )$seqnum |>
        as.integer()
    ) |>
    tidyr::unite(
      "STUDY_ID",
      "cell",
      col = "assemblageID",
      sep = "_",
      remove = FALSE
    ) |>
    dplyr::mutate(dplyr::across(
      .cols = c("cell", "assemblageID"),
      .fns = as.factor
    )) |>
    dplyr::select(
      "STUDY_ID",
      "SAMPLE_DESC",
      "cell",
      "resolution",
      "assemblageID",
      "CLIMATE",
      "REALM",
      "TAXA",
      "StudyMethod",
      "ABUNDANCE_TYPE",
      "BIOMASS_TYPE",
      "YEAR",
      "LATITUDE",
      "LONGITUDE",
      "Species",
      "taxon",
      "DAY",
      "MONTH",
      "ABUNDANCE",
      "BIOMASS"
    ) |>
    # data.table::as.data.table()
    dplyr::as_tibble()

  if (
    tapply(
      X = bt$cell[bt$StudyMethod == "SL"],
      INDEX = bt$STUDY_ID[bt$StudyMethod == "SL"],
      FUN = function(x) data.table::uniqueN(x) == 1L
    ) |>
      all()
  ) {
    base::message("OK: all SL studies have 1 grid cell")
  } else {
    base::stop("ERROR: some SL studies have > 1 grid cell")
  }

  return(bt)
}
