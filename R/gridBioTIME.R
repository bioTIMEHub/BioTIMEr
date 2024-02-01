#' Gridding BioTIME
#'
#' @description Grids BioTIME data into 96km2 cells based on location (latitude/longitude).
#' @export
#' @param meta (data.frame) BioTIME metadata
#' @param btf (data.frame) BioTIME data
#' @param res (integer) XXXthe resolution for the grid sizeXXX
#' @details
#' Each BioTIME study contains distinct samples measured (with a
#'   consistent methodology) over time, which could be fixed plots (i.e. SL or
#'   "single-location" studies where measures are taken from a set of specific
#'   georeferenced sites at any given time) or wide-ranging surveys, transects,
#'   tows, and so on (i.e. ML or "multi-location" studies where measures are taken
#'   from multiple sites that may or may not align from year to year, see
#'   \code{\link{runResampling}}). `gridding` is a function designed to identify,
#'   separate and standardise both SL and ML studies using a global grid of 96km2
#'   hexagonal cells derived from \code{\link[dggridR]{dgconstruct}} (res = 12).
#'   Here each sample is assigned a different combination of study ID and grid cell
#'   (based on its latitude and longitude) resulting in a unique identifier for
#'   each assemblage time-series (assemblageID), thus allowing for the integrity
#'   of each study and each sample to be maintained.
#'   By default `meta` represents a long form data frame containing the data
#'   information for BioTIME studies and `btf` is a data frame containing long
#'   form data from a main BioTIME query.
#'
#' `res` = 12 was found to be the most appropriate value when working on the whole
#'   BioTIME database. Now the function gives users the possibility to provide
#'   their own values (e.g. res = 14) or to let the function compute the best
#'   `res` value taking 12 as a reference.
#'
#' @returns Returns a `data.frame`, with selected columns from the `btf` and `meta`
#'   data.frames, an extra integer column called `cell` and two character columns
#'   called `StudyMethod` and `assemblageID` (concatenation of study_ID and cell).
#'
#' @importFrom dplyr %>%
#' @examples
#' \dontrun{
#'   library(BioTIMEr)
#'   gridding(subBTmeta, subBTquery)
#' }

gridding <- function(meta, btf, res = NULL) {
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
  checkmate::assert_number(x = res, lower = 0, upper = 30, null.ok = TRUE)

  bt <- dplyr::inner_join(meta, btf, by = "STUDY_ID") %>%
    dplyr::rename(Species = valid_name)

  meta <- meta %>%
    dplyr::mutate(StudyMethod = dplyr::if_else(NUMBER_LAT_LONG == 1, "SL", NA))
  bt <- bt %>%
    dplyr::mutate(StudyMethod = dplyr::if_else(NUMBER_LAT_LONG == 1, "SL", "ML"))

  SL_extent_mean <- meta %>%
    dplyr::filter(StudyMethod == "SL" & AREA_SQ_KM <= 500) %>%
    dplyr::summarise(extent_mean = mean(AREA_SQ_KM, na.rm = TRUE)) %>%
    dplyr::pull(extent_mean)
  SL_extent_sd <- meta %>%
    dplyr::filter(StudyMethod == "SL" & AREA_SQ_KM <= 500) %>%
    dplyr::summarise(extent_sd = stats::sd(AREA_SQ_KM, na.rm = TRUE)) %>%
    dplyr::pull(extent_sd)

  bt <- bt %>% dplyr::mutate(
    StudyMethod = dplyr::if_else(
      condition = AREA_SQ_KM < (SL_extent_mean + SL_extent_sd),
      true = "SL",
      false = StudyMethod)) %>%
    dplyr::mutate(
      lon_to_grid = dplyr::if_else(StudyMethod == "SL", CENT_LONG, LONGITUDE),
      lat_to_grid = dplyr::if_else(StudyMethod == "SL", CENT_LAT, LATITUDE))

  oneyear <- bt %>%
    dplyr::group_by(STUDY_ID) %>%
    dplyr::filter(max(YEAR) - min(YEAR) == 0) %>%
    dplyr::summarise() %>%
    dplyr::collect() %>%
    dplyr::pull(STUDY_ID)

  bt <- bt %>% dplyr::filter(!(STUDY_ID %in% oneyear))

  if (is.null(res) || is.na(res)) {
    res <- 12L
    dgg <- dggridR::dgconstruct(res = res)
    res <- dggridR::dg_closest_res_to_area(dgg, SL_extent_mean + SL_extent_sd)
    dgg <- dggridR::dgsetres(dgg, res)
  } else {
    dgg <- dggridR::dgconstruct(res = res)
  }

  bt$cell <- dggridR::dgGEO_to_SEQNUM(dggs = dgg,
                                      in_lon_deg = bt$lon_to_grid,
                                      in_lat_deg = bt$lat_to_grid)$seqnum %>%
    as.integer()

  check <- bt %>%
    dplyr::group_by(StudyMethod, STUDY_ID) %>%
    dplyr::summarise(n_cell = dplyr::n_distinct(cell))

  if (sum(dplyr::filter(check, StudyMethod == "SL") %>% .$n_cell != 1) == 0) {
    base::message("OK: all SL studies have 1 grid cell")
  } else {
    base::stop("ERROR: some SL studies have > 1 grid cell")
  }

  bt_grid <- bt %>%
    dplyr::select(CLIMATE, REALM, TAXA, StudyMethod, SAMPLE_DESC,
                  ABUNDANCE_TYPE, BIOMASS_TYPE, STUDY_ID, YEAR, PLOT,
                  cell, Species, DAY, MONTH, ABUNDANCE, BIOMASS, taxon,
                  resolution) %>%
    tidyr::unite(col = assemblageID, STUDY_ID, cell, sep = "_", remove = FALSE)

  return(bt_grid)
}
