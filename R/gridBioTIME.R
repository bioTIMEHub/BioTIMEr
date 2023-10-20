#' gridding BioTIME
#'
#' @export
#' @param meta (data.frame) BioTIME metadata
#' @param btf (data.frame) BioTIME data
#'
#' @returns A data.frame with studies split into 96km2 gridded cells (rarefyIDs)
#' @examples
#' \dontrun{
#' base::load("data/subBTquery.RData")
#' base::load("data/subBTmeta.RData")
#' gridding(subBTmeta, subBTquery)
#' }

gridding <- function(meta, btf) {
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
      false = StudyMethod)
  )

  bt <- bt %>%
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

  dgg <- dggridR::dgconstruct(res = 12)
  res <- dggridR::dg_closest_res_to_area(dgg, SL_extent_mean + SL_extent_sd)
  dgg <- dggridR::dgsetres(dgg, res)
  bt <- as.data.frame(bt)

  bt$cell <- dggridR::dgGEO_to_SEQNUM(dgg, bt$lon_to_grid, bt$lat_to_grid)$seqnum

  check <- bt %>%
    dplyr::group_by(StudyMethod, STUDY_ID) %>%
    dplyr::summarise(n_cell = dplyr::n_distinct(cell))

  if (sum(dplyr::filter(check, StudyMethod == "SL") %>% .$n_cell != 1) == 0) {
    base::message("all SL studies have 1 grid cell")
  } else {
    base::stop("ERROR: some SL studies have > 1 grid cell")
  }

  # check2 <- bt %>%
  #   dplyr::group_by(StudyMethod, STUDY_ID, YEAR) %>%
  #   dplyr::summarise(n_cell = dplyr::n_distinct(cell))

  # range(check2$n_cell)

  bt <- bt %>%
    tidyr::unite(col = rarefyID, STUDY_ID, cell, sep = "_", remove = FALSE)

  rarefyID_coords_nest <- bt %>%
    dplyr::ungroup() %>%
    dplyr::filter(StudyMethod != "SL") %>%
    dplyr::select(STUDY_ID, rarefyID, LONGITUDE, LATITUDE) %>%
    dplyr::distinct(rarefyID, LONGITUDE, LATITUDE, .keep_all = TRUE) %>%
    dplyr::group_by(rarefyID) %>%
    dplyr::mutate(n_locations = dplyr::n_distinct(LONGITUDE, LATITUDE)) %>%
    dplyr::ungroup() %>%
    dplyr::filter(n_locations > 1) %>%
    dplyr::select(-n_locations) %>%
    dplyr::group_by(STUDY_ID, rarefyID) %>%
    tidyr::nest()

  cell_extent <- numeric()
  centre_rarefyID_x <- numeric()
  centre_rarefyID_y <- numeric()
  vertices_check <- data.frame()

  for (i in seq_len(nrow(rarefyID_coords_nest))) {
    ## check what it is doing
    print(paste('rarefyID', i, 'of',
                length(unique(rarefyID_coords_nest$rarefyID))))
    ################################################################
    hull <- grDevices::chull(
      x = unlist(rarefyID_coords_nest$data[[i]][, "LONGITUDE"]),
      y = unlist(rarefyID_coords_nest$data[[i]][, "LATITUDE"]))

    vertices <- rarefyID_coords_nest$data[[i]][hull, c("LONGITUDE", "LATITUDE")]
    info <- cbind.data.frame(
      Realm = rep(x = rarefyID_coords_nest$STUDY_ID[i],
                  times = nrow(vertices)),
      rarefyID = rep(x = rarefyID_coords_nest$rarefyID[i],
                     times = nrow(vertices)),
      vertices)
    vertices_check <- rbind.data.frame(vertices_check, info)

    ## get the extent of cells in km2
    cell_extent[i] <- geosphere::areaPolygon(data.frame(
      x = vertices$LONGITUDE,
      y = vertices$LATITUDE))
    ## get the centre points of the cells
    centre_rarefyID_x[i] <- geosphere::geomean(
      cbind(x = vertices$LONGITUDE,
            y = vertices$LATITUDE))[1]
    centre_rarefyID_y[i] <- geosphere::geomean(
      cbind(x = vertices$LONGITUDE,
            y = vertices$LATITUDE))[2]
  }

  rarefyID_cell_centre <- cbind.data.frame(
    rarefyID_coords_nest[, 1:2],
    cell_extent,
    rarefyID_x = centre_rarefyID_x,
    rarefyID_y = centre_rarefyID_y)
  rarefyID_cell_centre <- dplyr::as_tibble(rarefyID_cell_centre)

  ## can save here for large studies
  #saveRDS(as.data.frame(rarefyID_cell_centre), "savedStage2.rds")

  ## combine these with the other studies

  SL_coords <- bt %>%
    dplyr::ungroup() %>%
    dplyr::filter(StudyMethod == "SL") %>%
    dplyr::select(STUDY_ID, rarefyID, CENT_LONG, CENT_LAT) %>%
    ## cell extent = 0, need to rename the centre points to merge
    dplyr::mutate(cell_extent = 0,
                  rarefyID_x = CENT_LONG,
                  rarefyID_y = CENT_LAT) %>%
    dplyr::select(-CENT_LONG, -CENT_LAT)

  ML_coords <- dplyr::ungroup(bt) %>%
    dplyr::filter(StudyMethod != "SL") %>%
    dplyr::select(STUDY_ID, rarefyID, LONGITUDE, LATITUDE) %>%
    dplyr::distinct(rarefyID, LONGITUDE, LATITUDE, .keep_all = TRUE) %>%
    dplyr::group_by(rarefyID) %>%
    dplyr::mutate(n_locations = dplyr::n_distinct(LONGITUDE, LATITUDE)) %>%
    dplyr::ungroup() %>%
    dplyr::filter(n_locations == 1) %>%
    dplyr::mutate(cell_extent = 0,
                  rarefyID_x = LONGITUDE,
                  rarefyID_y = LATITUDE) %>%
    dplyr::select(-LONGITUDE, -LATITUDE, -n_locations)

  ## join everything
  rarefyID_cell_centre <- dplyr::bind_rows(rarefyID_cell_centre,
                                           SL_coords, ML_coords) %>%
    dplyr::distinct(STUDY_ID, rarefyID, cell_extent, rarefyID_x, rarefyID_y)

  bt_grid <- bt %>%
    dplyr::select(CLIMATE, REALM, TAXA, StudyMethod, SAMPLE_DESC,
                  ABUNDANCE_TYPE, BIOMASS_TYPE, STUDY_ID, YEAR, PLOT,
                  cell, Species, DAY, MONTH, ABUNDANCE, BIOMASS, taxon,
                  resolution) %>%
    tidyr::unite(col = rarefyID, STUDY_ID, cell, sep = "_", remove = FALSE)
  k <- c(15, 16)
  bt_grid[, k] <- apply(bt_grid[, k], 2, function(x) as.numeric(as.character(x)))

  return(bt_grid)
}
