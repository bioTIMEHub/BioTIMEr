# Testing BioTIME scales

# Helper dummy data
set.seed(42)
df_discrete <- data.frame(x = letters[1:4], y = 1:4)
df_continuous <- data.frame(x = rnorm(100), y = rnorm(100), z = rnorm(100))

test_palettes <- c("realms", "gradient", "cool", "warm")

# ---- biotime_cols() ----
test_that("biotime_cols returns interpolator function", {
  for (pal in test_palettes) {
    f <- biotime_cols(palette = pal)
    expect_type(f, "closure")
    cols <- f(10)
    expect_type(cols, "character")
    expect_length(cols, 10)
    expect_true(all(grepl("^#[0-9A-Fa-f]{6}", cols)))
  }
})

test_that("biotime_cols reverses palette correctly", {
  normal <- biotime_cols("cool")(2)
  reversed <- biotime_cols("cool", reverse = TRUE)(2)
  expect_false(identical(normal, reversed))
})

test_that("biotime_cols throws error on invalid palette", {
  expect_error(biotime_cols("nonexistent"))
})

# ---- scale_color_biotime & scale_fill_biotime ----
test_that("scale_color_biotime and scale_fill_biotime handle all combinations", {
  skip_on_ci()
  for (pal in test_palettes) {
    for (reverse in c(TRUE, FALSE)) {
      for (discrete in c(TRUE, FALSE)) {
        p1 <- ggplot2::ggplot(
          df_discrete,
          ggplot2::aes(x = x, y = y, color = x)
        ) +
          ggplot2::geom_point() +
          scale_color_biotime(palette = pal, reverse = reverse, discrete = TRUE)

        p2 <- ggplot2::ggplot(
          df_discrete,
          ggplot2::aes(x = x, y = y, fill = x)
        ) +
          ggplot2::geom_col() +
          scale_fill_biotime(palette = pal, reverse = reverse, discrete = TRUE)

        p3 <- ggplot2::ggplot(
          df_continuous,
          ggplot2::aes(x = x, y = y, color = z)
        ) +
          ggplot2::geom_point() +
          scale_color_biotime(
            palette = pal,
            reverse = reverse,
            discrete = FALSE
          )

        p4 <- ggplot2::ggplot(
          df_continuous,
          ggplot2::aes(x = x, y = y, fill = z)
        ) +
          ggplot2::geom_tile() +
          scale_fill_biotime(palette = pal, reverse = reverse, discrete = FALSE)

        # Visual tests
        vdiffr::expect_doppelganger(
          sprintf("color-%s-%s-%s", pal, reverse, discrete),
          p1
        )
        vdiffr::expect_doppelganger(
          sprintf("fill-%s-%s-%s", pal, reverse, discrete),
          p2
        )
        vdiffr::expect_doppelganger(
          sprintf("color-continuous-%s-%s", pal, reverse),
          p3
        )
        vdiffr::expect_doppelganger(
          sprintf("fill-continuous-%s-%s", pal, reverse),
          p4
        )
      }
    }
  }
})

# ---- Argument checks ----
test_that("scale functions validate inputs", {
  expect_error(
    scale_color_biotime(palette = "invalid"),
    "Must be element of set"
  )
  expect_error(
    scale_fill_biotime(palette = "invalid"),
    "Must be element of set"
  )
  expect_error(
    scale_color_biotime(discrete = NULL),
    "Must be of type 'logical'"
  )
  expect_error(scale_fill_biotime(reverse = NULL), "Must be of type 'logical'")
})

test_that("intPalette handles edge cases", {
  pal_fn <- intPalette(c("#000000", "#FFFFFF"))

  expect_error(pal_fn("a"), "Must be of type 'integerish'")
  expect_error(pal_fn(-5), "Element 1 is not >= 1")

  expect_length(pal_fn(1), 1)
  expect_length(pal_fn(10), 10)
})
