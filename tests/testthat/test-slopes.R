test_that("slopes works consistently", {
  # Alpha diversity metrics
  set.seed(42)
  xa <- data.frame(
    Year = rep(rep(2010:2015, each = 4), times = 4),
    Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
    Abundance = rpois(24 * 8, 10),
    rarefyID = rep(LETTERS[1L:8L], each = 24)
  )
  alpham <- getAlphaMetrics(xa, "A")

  # Beta  diversity metrics
  set.seed(42)
  xb <- data.frame(
    Year = rep(rep(2010:2015, each = 4), times = 4),
    Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
    Abundance = rpois(24 * 8, 2),
    rarefyID = rep(LETTERS[1L:8L], each = 24)
  )
  betam <- getBetaDissimilarity(xb, "A")

  # Tests
  expect_snapshot(getLinearRegressions(x = alpham, divType = "alpha"))
  expect_snapshot(getLinearRegressions(x = betam, divType = "beta"))
})
