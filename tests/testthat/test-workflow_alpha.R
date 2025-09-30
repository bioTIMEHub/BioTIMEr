test_that("Whole workflow works consistently", {
  skip_on_ci()
  skip_on_cran()

  meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
  btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

  # Alpha diversity metrics
  set.seed(42)

  regressions_abundance <- gridding(meta, btf) |>
    resampling(measure = "ABUNDANCE", resamps = 1L) |>
    getAlphaMetrics(measure = "ABUNDANCE") |>
    getLinearRegressions(divType = "alpha")

  expect_snapshot(regressions_abundance)

  set.seed(42)

  regressions_biomass <- gridding(meta, btf) |>
    resampling(measure = "BIOMASS", resamps = 1L) |>
    getAlphaMetrics(measure = "BIOMASS") |>
    getLinearRegressions(divType = "alpha")

  expect_snapshot(regressions_biomass)
})
