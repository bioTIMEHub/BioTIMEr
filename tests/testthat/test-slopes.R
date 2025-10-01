test_that("slopes works consistently", {
  skip_on_ci()
  skip_on_cran()

  set.seed(42)
  xa <- data.frame(
    resamp = 1L,
    assemblageID = base::rep(LETTERS[1L:8L], each = 24),
    YEAR = base::rep(base::rep(2010:2015, each = 4), times = 4),
    Species = c(replicate(
      n = 8L * 6L,
      sample(letters[1L:10L], 4L, replace = FALSE)
    )),
    ABUNDANCE = stats::rpois(24 * 8, 10)
  ) |>
    rbind(data.frame(
      resamp = 1L,
      assemblageID = "Z",
      YEAR = 2010:2011,
      Species = rep(sample(letters[1L:10L], 4L, replace = FALSE), each = 2),
      ABUNDANCE = stats::rpois(8, 10)
    )) # 1 year only to trigger the filter inside the function

  # Alpha diversity metrics
  alpham <- getAlphaMetrics(xa, measure = "ABUNDANCE") |>
    dplyr::select(-resamp)

  # Beta  diversity metrics
  betam <- getBetaMetrics(xa, measure = "ABUNDANCE") |>
    dplyr::select(-resamp)

  # Tests
  expect_warning(
    regressions_alpha <- getLinearRegressions(x = alpham),
    regexp = "essentially perfect fit: summary may be unreliable"
  )
  expect_snapshot(regressions_alpha)

  expect_snapshot(getLinearRegressions(x = betam))
})
