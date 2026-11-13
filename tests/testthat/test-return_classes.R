# Rules for the class of the returned object:
# - gridding() and resampling() return the table of the user plus columns: the
#   class of the input is kept (data.frame, tibble, data.table).
# - getAlphaMetrics() and getBetaMetrics() return a new summary table: always a
#   data.frame with the extra class `alpha` or `beta`.
# - getLinearRegressions() returns a new result table: a plain data.frame.
# A change of these classes must be deliberate: it changes what users get back.

same_class_as_input <- list(
  data.frame = "data.frame",
  tibble = c("tbl_df", "tbl", "data.frame"),
  data.table = c("data.table", "data.frame")
)
as_input_class <- list(
  data.frame = as.data.frame,
  tibble = dplyr::as_tibble,
  data.table = data.table::as.data.table
)

test_that("returned classes follow the rules for every input class", {
  for (input in names(as_input_class)) {
    convert <- as_input_class[[input]]
    gridded <- gridding(
      meta = convert(BTsubset_meta),
      x = convert(BTsubset_data),
      verbose = FALSE
    )
    expect_identical(
      class(gridded),
      same_class_as_input[[input]],
      info = paste("gridding,", input)
    )

    set.seed(1)
    resampled <- resampling(
      x = gridded,
      measure = "ABUNDANCE",
      n_resamples = 1L,
      verbose = FALSE
    )
    expect_identical(
      class(resampled),
      same_class_as_input[[input]],
      info = paste("resampling,", input)
    )

    alpha <- getAlphaMetrics(x = resampled, measure = "ABUNDANCE")
    expect_identical(
      class(alpha),
      c("alpha", "data.frame"),
      info = paste("getAlphaMetrics,", input)
    )
    beta <- getBetaMetrics(x = resampled, measure = "ABUNDANCE")
    expect_identical(
      class(beta),
      c("beta", "data.frame"),
      info = paste("getBetaMetrics,", input)
    )

    # Constant series in real data give "essentially perfect fit" warnings from
    # lm(); they are asserted in the next test
    expect_identical(
      class(suppressWarnings(getLinearRegressions(x = alpha))),
      "data.frame",
      info = paste("getLinearRegressions alpha,", input)
    )
    expect_identical(
      class(suppressWarnings(getLinearRegressions(x = beta))),
      "data.frame",
      info = paste("getLinearRegressions beta,", input)
    )
  }
})

test_that("getLinearRegressions still warns about a perfect fit of constant metrics", {
  constant_alpha <- dplyr::tibble(
    assemblageID = "10_1",
    YEAR = 2000:2004,
    S = 2L,
    N = 10,
    maxN = 5,
    Shannon = 0.69,
    expShannon = 2,
    Simpson = 0.5,
    invSimpson = 2,
    PIE = 0.5,
    DomMc = 1
  )
  class(constant_alpha) <- c("alpha", class(constant_alpha))
  expect_warning(
    getLinearRegressions(x = constant_alpha),
    regexp = "essentially perfect fit"
  )
})
