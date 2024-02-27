test_that("Whole workflow works consistently", {
  skip_on_ci()

  meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
  btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

  # Beta diversity metrics
  set.seed(42)
  expect_snapshot({
    gridding(meta, btf) %>%
      runResampling(ab = "ABUNDANCE", resamps = 1L) %>%
      getBetaMetrics(ab = "A") %>%
      getLinearRegressions(divType = "beta")
  })

  set.seed(42)
  expect_snapshot({
    gridding(meta, btf) %>%
      runResampling(ab = "BIOMASS", resamps = 1L) %>%
      getBetaMetrics(ab = "B") %>%
      getLinearRegressions(divType = "beta")
  })

})
