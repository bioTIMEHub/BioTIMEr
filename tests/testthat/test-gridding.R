# # Create example data for testing
# meta <- data.frame(
#   STUDY_ID = c("Study1", "Study2", "Study3"),
#   NUMBER_LAT_LONG = c(1, 1, 2),
#   AREA_SQ_KM = c(100, 200, 150),
#   CENT_LONG = c(-75, -80, NA),
#   CENT_LAT = c(40, 35, NA),
#   LONGITUDE = c(-70, -85, -90),
#   LATITUDE = c(45, 30, 25)
# )
#
# btf <- data.frame(
#   STUDY_ID = c("Study1", "Study1", "Study2", "Study2", "Study3", "Study3"),
#   valid_name = c("Species1", "Species2", "Species1", "Species2", "Species1", "Species2"),
#   YEAR = c(2000, 2000, 2001, 2001, 2002, 2002),
#   ABUNDANCE = c(5, 8, 3, 6, 9, 2),
#   DAY = c(1, 2, 3, 4, 5, 6),
#   MONTH = c(1, 2, 3, 4, 5, 6)
# )
#
# test_that("gridding returns a data frame", {
#   result <- gridding(meta, btf)
#   expect_s3_class(result, "data.frame")
# })
#
# test_that("gridding returns the expected columns", {
#   result <- gridding(meta, btf)
#   expected_cols <- c(
#     "CLIMATE", "REALM", "TAXA", "StudyMethod", "SAMPLE_DESC",
#     "ABUNDANCE_TYPE", "BIOMASS_TYPE", "STUDY_ID", "YEAR", "PLOT",
#     "cell", "Species", "DAY", "MONTH", "ABUNDANCE", "BIOMASS", "taxon", "resolution"
#   )
#   expect_equal(colnames(result), expected_cols)
# })
#
# test_that("gridding returns correct number of rows", {
#   result <- gridding(meta, btf)
#   expected_rows <- nrow(btf)
#   expect_equal(nrow(result), expected_rows)
# })
#
# test_that("gridding creates correct cell IDs", {
#   result <- gridding(meta, btf)
#
#   # Check if cell IDs are in the expected format
#   cell_ids <- unique(result$cell)
#   expect_match(cell_ids, "Study\\d+_\\d+", ignore_case = TRUE)
# })
