# Create example data for testing rarefysamples
test_dt <- data.table::data.table(
  YEAR = rep(rep(2010:2015, each = 4), times = 8),
  SAMPLE_DESC = rep(LETTERS[1L:8L], each = 24),
  Species = unlist(lapply(
    X = 1L:8L,
    function(x) letters[sample(length(letters), 24L, replace = FALSE)]
  )),
  ABUNDANCE = rpois(24 * 8, 10),
  BIOMASS = abs(rnorm(24 * 8, mean = 0, sd = 1000))
)

resamps <- 3L

# Summarise = TRUE (default) ----
test_that("rarefysamples returns a data frame", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = TRUE
  )
  expect_s3_class(result, "data.table")
})

test_that("rarefysamples returns the expected column names", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = TRUE
  )
  checkmate::assert_names(
    x = colnames(result),
    what = "colnames",
    must.include = c(
      "YEAR",
      "Species",
      "BIOMASS",
      "resamp"
    )
  )
})

test_that("rarefysamples returns non-empty data frame", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = TRUE
  )
  expect_false(anyNA(result))
})

test_that("rarefysamples returns consistent 'YEAR' values", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = TRUE
  )
  expected_years <- unique(test_dt$YEAR)
  expect_setequal(unique(result$YEAR), expected_years)
})

test_that("rarefysamples returns consistent 'Species' values", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = TRUE
  )
  expected_species <- unique(test_dt$Species)
  expect_setequal(unique(result$Species), expected_species)
})


test_that("rarefysamples returns positive 'BIOMASS' values", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = TRUE
  )
  checkmate::expect_numeric(
    result$BIOMASS,
    lower = 0L,
    null.ok = FALSE,
    all.missing = FALSE
  )
})

test_that("rarefysamples summarise = TRUE returns consistent results", {
  skip_on_cran()
  skip_on_ci()
  set.seed(42)

  expect_snapshot(
    suppressWarnings(
      rarefysamples(
        x = test_dt,
        measure = c("ABUNDANCE", "BIOMASS"),
        resamps,
        summarise = TRUE
      )
    )
  )
})


# Summarise = FALSE ----
test_that("rarefysamples summarise = FALSE returns a data frame", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = FALSE
  )
  expect_s3_class(result, "data.frame")
})

test_that("rarefysamples returns the expected column names", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = FALSE
  )
  checkmate::assert_names(
    x = colnames(result),
    what = "colnames",
    must.include = c(
      "YEAR",
      "Species",
      "BIOMASS",
      "resamp",
      "SAMPLE_DESC"
    )
  )
})

test_that("rarefysamples returns non-empty data frame", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = FALSE
  )
  expect_false(anyNA(result))
})

test_that("rarefysamples returns consistent 'YEAR' values", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = FALSE
  )
  expected_years <- unique(test_dt$YEAR)
  expect_setequal(unique(result$YEAR), expected_years)
})

test_that("rarefysamples returns consistent 'Species' values", {
  result <- rarefysamples(
    x = test_dt,
    measure = "BIOMASS",
    resamps,
    summarise = FALSE
  )
  expect_setequal(unique(result$Species), unique(test_dt$Species))
})


test_that("rarefysamples summarise = FALSE returns consistent results", {
  skip_on_cran()
  skip_on_ci()
  set.seed(42)

  expect_snapshot(
    suppressWarnings(
      rarefysamples(
        x = test_dt,
        measure = c("ABUNDANCE", "BIOMASS"),
        resamps,
        summarise = FALSE
      ) |>
        dplyr::as_tibble()
    )
  )
})
