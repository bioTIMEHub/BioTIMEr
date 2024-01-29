# Load data
# example_df <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
# example_df <- example_df %>%
#   dplyr::filter(STUDY_ID == 10L) %>%
#   tidyr::pivot_wider(id_cols = c(STUDY_ID, SAMPLE_DESC, YEAR), names_from = ID_SPECIES,
#                      values_from = ABUNDANCE, values_fn = sum)

# Create example data for testing
set.seed(42)
data <- data.frame(
  Year = rep(rep(2010:2015, each = 4), times = 4),
  matrix(data = rpois(384, 10), ncol = 4)
)

test_that("getAlpha returns a data frame", {
  result <- getAlpha(x = data, id = 10)
  expect_s3_class(result, "data.frame")
})

test_that("getAlpha returns the expected columns", {
  result <- getAlpha(x = data, id = "TestID")
  expected_cols <- c("rarefyID","Year", "S", "N", "maxN", "Shannon","Simpson",
                     "InvSimpson","PIE","DomMc","expShannon")
  expect_equal(colnames(result), expected_cols)
})

test_that("getAlpha returns correct number of rows", {
  result <- getAlpha(x = data, id = "TestID")
  expect_equal(object = nrow(result), expected = nrow(data))
})

test_that("getAlpha computes accurate biodiversity metrics", {
  result <- getAlpha(x = data, id = "TestID")

  # Perform calculations using external libraries
  shannon_expected <- vegan::diversity(data[, -1L], "shannon")
  simpson_expected <- vegan::diversity(data[, -1L], "simpson")
  inv_expected <- vegan::diversity(data[, -1L], "inv")

  # Compare computed values with expected values
  expect_equal(result$Shannon, shannon_expected, ignore_attr = FALSE)
  expect_equal(result$expShannon, exp(shannon_expected), ignore_attr = FALSE)
  expect_equal(result$Simpson, simpson_expected, ignore_attr = FALSE)
  expect_equal(result$InvSimpson, inv_expected, ignore_attr = FALSE)
})

test_that("getAlpha works consistently", {
  expect_snapshot(x = getAlpha(x = data, id = "TestID"))
})

set.seed(42)
dataMetrics <- data.frame(
  Year = rep(rep(2010:2015, each = 4), times = 4),
  Species = c(replicate(
    n = 8L,
    sample(letters, 24L, replace = FALSE))),
  Abundance = rpois(24 * 8, 10),
  Biomass = rpois(24 * 8, 1000),
  rarefyID = rep(LETTERS[1L:8L], each = 24)
)


# test getAlphaMetrics
# test_that("getAlphaMetrics returns correct number of rows", {
#
# })
test_that("getAlphaMetrics works correctly for Abundance", {
  expect_snapshot(x = getAlphaMetrics(x = dataMetrics, ab = "A"))
})
test_that("getAlphaMetrics works correctly for Biomass", {
  expect_snapshot(x = getAlphaMetrics(x = dataMetrics, ab = "B"))
})

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
