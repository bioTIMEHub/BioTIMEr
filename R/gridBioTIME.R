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
#'   \code{\link[dggridR]{dg_closest_res_to_area}} is called to adapt `res` to
#'   the data extent.
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
#' (concatenation of \code{study_ID} and \code{cell}).
#'
#' @importFrom dplyr %>%
#' @examples
#'   library(BioTIMEr)
#'   gridded_data <- gridding(BTsubset_meta, BTsubset_data)
#'

gridding <- function(meta, btf, res = 12, resByData = FALSE) {
  checkmate::assert_names(
    x = colnames(meta), what = "colnames",
    must.include = c("STUDY_ID", "NUMBER_LAT_LONG", "AREA_SQ_KM",
                     "CENT_LONG", "CENT_LAT", "REALM", "CLIMATE",
                     "TAXA", "ABUNDANCE_TYPE", "BIOMASS_TYPE"))
  checkmate::assert_names(
    x = colnames(btf), what = "colnames",
    must.include = c("valid_name", "STUDY_ID", "DAY", "MONTH", "YEAR",
                     "LATITUDE", "LONGITUDE", "ABUNDANCE", "BIOMASS",
                     "SAMPLE_DESC", "PLOT", "resolution", "taxon"))
  checkmate::assert_numeric(btf$ABUNDANCE, lower = 0)
  checkmate::assert_numeric(btf$BIOMASS, lower = 0)
  checkmate::assert_number(x = res, lower = 0, upper = 30,
                           null.ok = FALSE, na.ok = FALSE)

  bt <- dplyr::inner_join(meta, btf, by = "STUDY_ID") %>%
    dplyr::rename(Species = "valid_name")

  meta <- meta %>%
    dplyr::mutate(StudyMethod = dplyr::if_else(.data$NUMBER_LAT_LONG == 1, "SL", NA))
  bt <- bt %>%
    dplyr::mutate(StudyMethod = dplyr::if_else(.data$NUMBER_LAT_LONG == 1, "SL", "ML"))

  SL_extent_mean <- meta %>%
    dplyr::filter(.data$StudyMethod == "SL" & .data$AREA_SQ_KM <= 500) %>%
    dplyr::summarise(extent_mean = mean(.data$AREA_SQ_KM, na.rm = TRUE)) %>%
    dplyr::pull("extent_mean")
  SL_extent_sd <- meta %>%
    dplyr::filter(.data$StudyMethod == "SL" & .data$AREA_SQ_KM <= 500) %>%
    dplyr::summarise(extent_sd = stats::sd(.data$AREA_SQ_KM, na.rm = TRUE)) %>%
    dplyr::pull("extent_sd")

  bt <- bt %>% dplyr::mutate(
    StudyMethod = dplyr::if_else(
      condition = .data$AREA_SQ_KM < (SL_extent_mean + SL_extent_sd),
      true = "SL",
      false = .data$StudyMethod)) %>%
    dplyr::mutate(
      lon_to_grid = dplyr::if_else(condition = .data$StudyMethod == "SL",
                                   true = .data$CENT_LONG,
                                   false = .data$LONGITUDE),
      lat_to_grid = dplyr::if_else(condition = .data$StudyMethod == "SL",
                                   true = .data$CENT_LAT,
                                   false = .data$LATITUDE))

  oneyear <- bt %>%
    dplyr::group_by(.data$STUDY_ID) %>%
    dplyr::filter(max(.data$YEAR) - min(.data$YEAR) == 0) %>%
    dplyr::summarise() %>%
    dplyr::collect() %>%
    dplyr::pull("STUDY_ID")

  bt <- bt %>% dplyr::filter(!is.element(.data$STUDY_ID, oneyear))

  dgg <- dggridR::dgconstruct(res = res)

  if (resByData) {
    res <- dggridR::dg_closest_res_to_area(dgg, SL_extent_mean + SL_extent_sd)
    dgg <- dggridR::dgsetres(dgg, res)
  }

  bt$cell <- dggridR::dgGEO_to_SEQNUM(dggs = dgg,
                                      in_lon_deg = bt$lon_to_grid,
                                      in_lat_deg = bt$lat_to_grid)$seqnum %>%
    as.integer()

  check <- bt %>%
    dplyr::group_by(.data$StudyMethod, .data$STUDY_ID) %>%
    dplyr::summarise(n_cell = dplyr::n_distinct(.data$cell)) %>%
    dplyr::ungroup()

  if (sum(dplyr::filter(check, .data$StudyMethod == "SL") %>% .$n_cell != 1) == 0) {
    base::message("OK: all SL studies have 1 grid cell")
  } else {
    base::stop("ERROR: some SL studies have > 1 grid cell")
  }


  bt_grid <- bt %>%
    dplyr::select("CLIMATE", "REALM", "TAXA", "StudyMethod", "SAMPLE_DESC",
                  "ABUNDANCE_TYPE", "BIOMASS_TYPE", "STUDY_ID", "YEAR", "PLOT",
                  "cell", "LATITUDE", "LONGITUDE", "Species", "taxon",
                  "resolution", "DAY", "MONTH", "ABUNDANCE", "BIOMASS") %>%
    tidyr::unite(col = "assemblageID", "STUDY_ID", "cell", sep = "_", remove = FALSE)

  return(bt_grid)
}
