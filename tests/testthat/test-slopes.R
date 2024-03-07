test_that("slopes works consistently", {
  skip_on_ci()
  # Alpha diversity metrics
  set.seed(42)
  xa <- data.frame(
    YEAR = base::rep(base::rep(2010:2015, each = 4), times = 4),
    Species = c(replicate(n = 8L * 6L, sample(letters[1L:10L], 4L, replace = FALSE))),
    ABUNDANCE = stats::rpois(24 * 8, 10),
    assemblageID = base::rep(LETTERS[1L:8L], each = 24)
  )
  alpham <- getAlphaMetrics(xa, measure = "ABUNDANCE")

  # Beta  diversity metrics
  betam <- getBetaMetrics(xa, measure = "ABUNDANCE")

  # Tests
  expect_snapshot(getLinearRegressions(x = alpham, divType = "alpha"))
  expect_snapshot(getLinearRegressions(x = betam, divType = "beta"))

  expect_snapshot(getLinearRegressions(x = alpham, divType = "alpha", pThreshold = 0.01))
  expect_snapshot(getLinearRegressions(x = betam, divType = "beta", pThreshold = 0.01))
})
