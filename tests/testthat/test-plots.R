# themeBioTIME
test_that("themeBioTIME - works as expected", {
  set.seed(42)
  data <- as.data.frame(
    matrix(data = rpois(384, 10), ncol = 4)
  )
  data$PIE <- apply(data, 1, function(s) {
    n <- sum(s)
    (n / (n - 1)) * (1 - sum((s / n)^2))
  })
  data$YEAR <- rep(2010:2015, each = 4) |>
    rep(times = 4) |>
    as.factor()

  p <- ggplot2::ggplot(data = data) +
    ggplot2::geom_point(ggplot2::aes(YEAR, PIE, col = YEAR, group = YEAR)) +
    ggplot2::ggtitle(label = "This is a snapshotted test plot") +
    themeBioTIME(
      legend.position = "left",
      font.size = 12,
      axis.colour = "red",
      strip.background = "green"
    )

  vdiffr::expect_doppelganger(title = "themeBioTIME plot", p)
})

test_that("themeBioTIME - argument deprecation works as expected", {
  # warns correctly
  expect_warning(
    themeBioTIME(
      lp = "top",
      font.size = 12,
      axis.colour = "black",
      strip.background = "grey90"
    ),
    class = "lifecycle_warning_deprecated"
  )
  expect_warning(
    themeBioTIME(
      legend.position = "top",
      fontSize = 12,
      axis.colour = "black",
      strip.background = "grey90"
    ),
    class = "lifecycle_warning_deprecated"
  )
  expect_warning(
    themeBioTIME(
      legend.position = "top",
      font.size = 12,
      colx = "black",
      strip.background = "grey90"
    ),
    class = "lifecycle_warning_deprecated"
  )
  expect_warning(
    themeBioTIME(
      legend.position = "top",
      font.size = 12,
      axis.colour = "black",
      coly = "grey90"
    ),
    class = "lifecycle_warning_deprecated"
  )

  # works anyway
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_equal(
    themeBioTIME(
      lp = "top",
      fontSize = 12,
      colx = "black",
      coly = "grey90"
    ),
    themeBioTIME(
      legend.position = "top",
      font.size = 12,
      axis.colour = "black",
      strip.background = "grey90"
    )
  )
})
