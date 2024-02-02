test_that("slopes works consistently", {
  skip_on_ci()
  # Alpha diversity metrics
  set.seed(42)
  xa <- data.frame(
    YEAR = base::rep(base::rep(2010:2015, each = 4), times = 4),
    Species = c(base::replicate(n = 8L, base::sample(letters, 24L, replace = FALSE))),
    Abundance = stats::rpois(24 * 8, 10),
    assemblageID = base::rep(LETTERS[1L:8L], each = 24)
  )
  alpham <- getAlphaMetrics(xa, "A")

  # Beta  diversity metrics
  base::set.seed(42)
  xb <- data.frame(
    YEAR = base::rep(base::rep(2010:2015, each = 4), times = 4),
    Species = c(base::replicate(n = 8L, base::sample(letters, 24L, replace = FALSE))),
    Abundance = stats::rpois(24 * 8, 2),
    assemblageID = base::rep(LETTERS[1L:8L], each = 24)
  )
  betam <- getBetaMetrics(xb, "A")

  # Tests
  expect_snapshot(getLinearRegressions(x = alpham, divType = "alpha"))
  expect_snapshot(getLinearRegressions(x = betam, divType = "beta"))
})
