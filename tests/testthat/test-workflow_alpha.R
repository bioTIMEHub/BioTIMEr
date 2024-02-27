test_that("Whole workflow works consistently", {
  skip_on_ci()

  meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
  btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

  # Alpha diversity metrics
  set.seed(42)
  expect_snapshot({
    gridding(meta, btf) %>%
      runResampling(ab = "ABUNDANCE", resamps = 1L) %>%
      getAlphaMetrics(ab = "A") %>%
      getLinearRegressions(divType = "alpha")
  })

  set.seed(42)
  expect_snapshot({
    gridding(meta, btf) %>%
      runResampling(ab = "BIOMASS", resamps = 1L) %>%
      getAlphaMetrics(ab = "B") %>%
      getLinearRegressions(divType = "alpha")
  })

})
