# Load example data for testing
meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

result <- gridding(meta, btf)

test_that("gridding returns a data frame", {
  expect_s3_class(result, "data.frame")
})

test_that("gridding returns the expected columns", {
  expected_cols <- c(
    "CLIMATE", "REALM", "TAXA", "StudyMethod", "SAMPLE_DESC",
    "ABUNDANCE_TYPE", "BIOMASS_TYPE", "assemblageID", "STUDY_ID", "YEAR", "PLOT",
    "cell", "Species", "DAY", "MONTH", "ABUNDANCE", "BIOMASS", "taxon",
    "LATITUDE", "LONGITUDE", "resolution"
  )
  checkmate::expect_names(x = colnames(result), what = "colnames",
                          permutation.of = expected_cols)
})

test_that("gridding returns correct number of rows", {
  expected_rows <- nrow(btf)
  expect_equal(nrow(result), expected_rows)
})

test_that("gridding creates correct cell IDs", {
  checkmate::expect_integer(result$cell, any.missing = FALSE, lower = 0L)
})

test_that("gridding produces consistent results", {
  skip_on_ci()
  expect_snapshot(result)
})

test_that("gridding respects provided res parameter", {
  skip_on_ci()
  expect_snapshot(gridding(meta, btf, res = 18))
})

test_that("gridding respects resByData argument", {
  skip_on_ci()
  expect_snapshot(gridding(meta, btf, resByData = TRUE))
})
