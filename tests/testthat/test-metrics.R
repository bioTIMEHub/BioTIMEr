# Load data
# example_df <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
# example_df <- example_df |>
#   dplyr::filter(STUDY_ID == 10L) |>
#   tidyr::pivot_wider(id_cols = c(STUDY_ID, SAMPLE_DESC, YEAR), names_from = ID_SPECIES,
#                      values_from = ABUNDANCE, values_fn = sum)

# Create example data for testing
set.seed(42)
data <- data.frame(rpois(1000, 10))

test_that("getAlpha returns a data frame", {
  result <- getAlpha(x = data)
  expect_s3_class(result, "data.frame")
})

test_that("getAlpha returns the expected columns", {
  result <- getAlpha(x = data)
  expected_cols <- c(
    "S",
    "N",
    "maxN",
    "Shannon",
    "Simpson",
    "invSimpson",
    "PIE",
    "DomMc",
    "expShannon"
  )
  expect_equal(colnames(result), expected_cols)
})

test_that("getAlpha returns correct number of rows", {
  result <- getAlpha(x = data)
  expect_equal(object = nrow(result), expected = 1L)
})

test_that("getAlpha computes accurate biodiversity metrics", {
  result <- getAlpha(x = data)

  # Perform calculations using external libraries
  shannon_expected <- vegan::diversity(data, "shannon")
  simpson_expected <- vegan::diversity(data, "simpson")
  inv_expected <- vegan::diversity(data, "inv")

  # Compare computed values with expected values
  expect_equal(result$Shannon, shannon_expected, ignore_attr = TRUE)
  expect_equal(result$expShannon, exp(shannon_expected), ignore_attr = TRUE)
  expect_equal(result$Simpson, simpson_expected, ignore_attr = TRUE)
  expect_equal(result$invSimpson, inv_expected, ignore_attr = TRUE)
  expect_equal(result$Shannon, shannon_expected, ignore_attr = TRUE)
  expect_equal(result$expShannon, exp(shannon_expected), ignore_attr = TRUE)
  expect_equal(result$Simpson, simpson_expected, ignore_attr = TRUE)
  expect_equal(result$invSimpson, inv_expected, ignore_attr = TRUE)
})

test_that("getAlpha works consistently", {
  skip_on_ci()
  skip_on_cran()

  skip_on_cran()

  expect_snapshot(x = getAlpha(x = data))
})

set.seed(42)
dataMetrics <- data.frame(
  resamp = 1L,
  assemblageID = rep(LETTERS[1L:8L], each = 24),
  YEAR = rep(rep(2010:2015, each = 4), times = 4),
  Species = c(replicate(
    n = 8L,
    sample(letters, 24L, replace = FALSE)
  )),
  ABUNDANCE = rpois(24 * 8, 10),
  BIOMASS = rpois(24 * 8, 1000)
)


test_that("getAlphaMetrics works correctly for Abundance", {
  skip_on_ci()
  skip_on_cran()

  abundance_alpha_metrics <- getAlphaMetrics(
    x = dataMetrics,
    measure = "ABUNDANCE"
  ) |>
    as.data.frame()

  expect_snapshot(x = abundance_alpha_metrics)
})

test_that("getAlphaMetrics works correctly for Biomass", {
  skip_on_ci()
  skip_on_cran()

  biomass_alpha_metrics <- getAlphaMetrics(
    x = dataMetrics,
    measure = "BIOMASS"
  ) |>
    as.data.frame()
  expect_snapshot(x = biomass_alpha_metrics)
})

test_that("getBetaMetrics works correctly for Abundance", {
  skip_on_ci()
  skip_on_cran()

  abundance_beta_metrics <- getBetaMetrics(
    x = dataMetrics,
    measure = "ABUNDANCE"
  ) |>
    as.data.frame()

  expect_snapshot(x = abundance_beta_metrics)
})

test_that("getBetaMetrics works correctly for Biomass", {
  skip_on_ci()
  skip_on_cran()

  biomass_beta_metrics <- getBetaMetrics(
    x = dataMetrics,
    measure = "BIOMASS"
  ) |>
    as.data.frame()

  expect_snapshot(x = biomass_beta_metrics)
})
