# Load data
# example_df <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
# example_df <- example_df %>%
#   dplyr::filter(STUDY_ID == 10L) %>%
#   tidyr::pivot_wider(id_cols = c(STUDY_ID, SAMPLE_DESC, YEAR), names_from = ID_SPECIES,
#                      values_from = ABUNDANCE, values_fn = sum)

# Create example data for testing
set.seed(42)
data <- data.frame(
  YEAR = rep(rep(2010:2015, each = 4), times = 4),
  matrix(data = rpois(384, 10), ncol = 4)
)

test_that("getAlpha returns a data frame", {
  result <- getAlpha(x = data, id = 10)
  expect_s3_class(result, "data.frame")
})

test_that("getAlpha returns the expected columns", {
  result <- getAlpha(x = data, id = "TestID")
  expected_cols <- c("assemblageID","YEAR", "S", "N", "maxN", "Shannon","Simpson",
                     "invSimpson","PIE","DomMc","expShannon")
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
  expect_equal(result$invSimpson, inv_expected, ignore_attr = FALSE)
})

test_that("getAlpha works consistently", {
  skip_on_ci()
  expect_snapshot(x = getAlpha(x = data, id = "TestID"))
})

set.seed(42)
dataMetrics <- data.frame(
  YEAR = rep(rep(2010:2015, each = 4), times = 4),
  Species = c(replicate(
    n = 8L,
    sample(letters, 24L, replace = FALSE))),
  ABUNDANCE = rpois(24 * 8, 10),
  BIOMASS = rpois(24 * 8, 1000),
  assemblageID = rep(LETTERS[1L:8L], each = 24)
)


test_that("getAlphaMetrics works correctly for Abundance", {
  skip_on_ci()
  expect_snapshot(x = getAlphaMetrics(x = dataMetrics, measure = "ABUNDANCE"))
})
test_that("getAlphaMetrics works correctly for Biomass", {
  skip_on_ci()
  expect_snapshot(x = getAlphaMetrics(x = dataMetrics, measure = "BIOMASS"))
})
test_that("getBetaMetrics works correctly for Abundance", {
  skip_on_ci()
  expect_snapshot(x = getBetaMetrics(x = dataMetrics, measure = "ABUNDANCE"))
})
test_that("getBetaMetrics works correctly for Biomass", {
  skip_on_ci()
  expect_snapshot(x = getBetaMetrics(x = dataMetrics, measure = "BIOMASS"))
})
