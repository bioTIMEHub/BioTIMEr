test_that("Whole workflow works consistently", {
  skip_on_ci()

  meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
  btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

  # Alpha diversity metrics
  expect_snapshot({
    set.seed(42)
    gridding(meta, btf) %>%
      resampling(measure = "ABUNDANCE", resamps = 1L) %>%
      getAlphaMetrics(measure = "ABUNDANCE") %>%
      getLinearRegressions(divType = "alpha")
  })

  expect_snapshot({
    set.seed(42)
    gridding(meta, btf) %>%
      resampling(measure = "BIOMASS", resamps = 1L) %>%
      getAlphaMetrics(measure = "BIOMASS") %>%
      getLinearRegressions(divType = "alpha")
  })

})
