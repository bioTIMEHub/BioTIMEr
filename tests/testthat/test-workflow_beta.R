test_that("Whole workflow works consistently", {
  skip_on_ci()

  meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
  btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

  # Beta diversity metrics
  expect_snapshot({
    gridding(meta, btf) %>%
      runResampling(ab = "ABUNDANCE", resamps = 1L) %>%
      getBetaMetrics(ab = "A") %>%
      getLinearRegressions(divType = "beta")
  })
  expect_snapshot({
    gridding(meta, btf) %>%
      runResampling(ab = "BIOMASS", resamps = 1L) %>%
      getBetaMetrics(ab = "B") %>%
      getLinearRegressions(divType = "beta")
  })
})
