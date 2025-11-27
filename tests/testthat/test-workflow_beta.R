test_that("Whole workflow works consistently", {
  skip_on_ci()
  skip_on_cran()

  meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
  btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

  # Beta diversity metrics
  g <- gridding(meta, btf)
  set.seed(42)
  regressions_abundance <- g |>
    resampling(measure = "ABUNDANCE", resamps = 1L) |>
    getBetaMetrics(measure = "ABUNDANCE") |>
    dplyr::select(-resamp) |>
    getLinearRegressions()

  expect_snapshot(regressions_abundance)

  set.seed(42)
  regressions_biomass <- g |>
    resampling(measure = "BIOMASS", resamps = 1L) |>
    getBetaMetrics(measure = "BIOMASS") |>
    dplyr::select(-resamp) |>
    getLinearRegressions()

  expect_snapshot(regressions_biomass)
})
