# Load example data for testing
meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

test_that("gridding returns a data frame", {
  result <- gridding(meta, btf)
  expect_s3_class(result, "data.frame")
})

test_that("gridding returns the expected columns", {
  result <- gridding(meta, btf)
  expected_cols <- c(
    "CLIMATE", "REALM", "TAXA", "StudyMethod", "SAMPLE_DESC",
    "ABUNDANCE_TYPE", "BIOMASS_TYPE", "rarefyID", "STUDY_ID", "YEAR", "PLOT",
    "cell", "Species", "DAY", "MONTH", "ABUNDANCE", "BIOMASS", "taxon", "resolution"
  )
  expect_equal(colnames(result), expected_cols)
})

test_that("gridding returns correct number of rows", {
  result <- gridding(meta, btf)
  expected_rows <- nrow(btf)
  expect_equal(nrow(result), expected_rows)
})

test_that("gridding creates correct cell IDs", {
  result <- gridding(meta, btf)

  expect_equal(class(result$cell), "integer")
  # Check if cell IDs are in the expected format
  # cell_ids <- unique(result$cell)
  # expect_match(cell_ids, "Study\\d+_\\d+", ignore_case = TRUE)
})
