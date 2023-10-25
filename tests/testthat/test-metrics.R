# Load data
example_df <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
# example_df %>%
#   dplyr::filter(STUDY_ID == 10L) %>%
#   tidyr::pivot_wider(id_cols = c(STUDY_ID, SAMPLE_DESC, YEAR), names_from = ID_SPECIES,
#                      values_from = ABUNDANCE, values_fn = sum)

# # Create example data for testing
# Species <- c("Species1", "Species2", "Species1", "Species2")
# Abundance <- c(5, 8, 3, 6)
# Year <- c(2000, 2000, 2001, 2001)
# data <- data.frame(Year, Species, Abundance)
#
# test_that("getAlpha returns a data frame", {
#   result <- getAlpha(x = example_df, id = 10)
#   expect_s3_class(result, "data.frame")
# })
#
# test_that("getAlpha returns the expected columns", {
#   result <- getAlpha(x = data, id = "TestID")
#   expected_cols <- c("Year", "ID", "q1", "q2", "invS")
#   expect_equal(colnames(result), expected_cols)
# })
#
# test_that("getAlpha returns correct number of rows", {
#   result <- getAlpha(x = data, getID = "TestID")
#   expect_equal(object = nrow(result), expected = nrow(pivot_data))
# })
#
# test_that("getAlpha computes accurate biodiversity metrics", {
#   result <- getAlpha(x = data, getID = "TestID")
#
#   # Perform calculations using external libraries
#   shannon_expected <- vegan::diversity(data[, -1L], "shannon")
#   simpson_expected <- vegan::diversity(data[, -1L], "simpson")
#   inv_expected <- vegan::diversity(data[, -1L], "inv")
#
#   # Compare computed values with expected values
#   expect_equal(result$q1, (exp(1/shannon_expected)), ignore_attr = FALSE)
#   expect_equal(result$q2, (1/simpson_expected), ignore_attr = FALSE)
#   expect_equal(result$invS, inv_expected, ignore_attr = FALSE)
# })
#
# test_that("getBeta returns a data frame", {
#   result <- getBeta(x = pivot_data, id = "TestID")
#   expect_s3_class(result, "data.frame")
# })
#
# test_that("getBeta returns the expected columns", {
#   result <- getBeta(x = pivot_data, id = "TestID")
#   expected_cols <- c("Year", "ID", "jaccD", "mhorn")
#   expect_equal(colnames(result), expected_cols)
# })
#
# test_that("getBeta returns correct number of rows", {
#   result <- getBeta(x = pivot_data, id = "TestID")
#   expected_rows <- length(unique(data$Year))
#   expect_equal(nrow(result), expected_rows)
# })
#
# test_that("getBeta computes accurate biodiversity metrics", {
#   result <- getBeta(x = pivot_data, id = "TestID")
#
#   # Calculate expected values using external libraries
#   x2 <- pivot_data[, -1L]
#   x2[x2 > 1] <- 1
#   jacc_expected <- vegan::vegdist(x2, method = "jaccard")
#   mh_expected <- vegan::vegdist(pivot_data[, -1L], method = "horn")
#
#   # Compare computed values with expected values
#   expect_equal(result$jaccD[-2], jacc_expected, ignore_attr = TRUE)
#   expect_equal(result$mhorn[-2], mh_expected, ignore_attr = TRUE)
# })
