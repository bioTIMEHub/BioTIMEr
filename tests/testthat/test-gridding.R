# Load example data for testing
meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

test_that("gridding returns an object of same class as meta", {
  expect_no_error(resdf <- gridding(meta, btf))
  expect_s3_class(resdf, "data.frame")

  expect_no_error(
    restbl <- gridding(meta |> dplyr::as_tibble(), btf |> dplyr::as_tibble())
  )
  expect_s3_class(
    restbl,
    c("tbl_df", "tbl", "data.frame")
  )

  expect_no_error(
    resdt <- gridding(
      meta |> data.table::as.data.table(),
      btf |> data.table::as.data.table()
    )
  )
  expect_s3_class(
    resdt,
    c("data.table", "data.frame")
  )
})

test_that("gridding returns the expected columns", {
  expected_cols <- c(
    "CLIMATE",
    "REALM",
    "TAXA",
    "StudyMethod",
    "SAMPLE_DESC",
    "ABUNDANCE_TYPE",
    "BIOMASS_TYPE",
    "assemblageID",
    "STUDY_ID",
    "YEAR",
    "cell",
    "Species",
    "DAY",
    "MONTH",
    "ABUNDANCE",
    "BIOMASS",
    "taxon",
    "LATITUDE",
    "LONGITUDE",
    "resolution"
  )
  checkmate::expect_names(
    x = colnames(gridding(meta, btf)),
    what = "colnames",
    permutation.of = expected_cols
  )
})

test_that("gridding returns correct number of rows", {
  expected_rows <- nrow(btf)
  expect_equal(nrow(gridding(meta, btf)), expected_rows)
})

test_that("gridding creates correct cell IDs", {
  checkmate::expect_double(
    x = gridding(meta, btf)$cell,
    any.missing = FALSE,
    lower = 0,
    null.ok = FALSE
  )
})

test_that("gridding produces consistent results", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(gridding(meta, btf))
})

test_that("gridding respects provided res parameter", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(gridding(meta, btf, res = 18))
})

test_that("gridding respects resByData argument", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(gridding(meta, btf, resByData = TRUE))
})

# test_that("gridding correctly manages data.table objects", {
#   skip_on_ci()
#   skip_on_cran()

#   data.table::setDT(meta)
#   data.table::setDT(btf)

#   result <- gridding(meta, btf, res = 12, resByData = FALSE)
#   expect_snapshot(result)
# })
