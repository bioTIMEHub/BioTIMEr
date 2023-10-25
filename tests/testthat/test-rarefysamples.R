# Create example data for testing rarefysamples
YEAR <- rep(rep(2010:2015, each = 4), times = 8)
SampleID <- rep(LETTERS[1L:8L], each = 24)
Species <- unlist(lapply(
  X = 1L:8L,
  function(x) letters[sample(length(letters), 24L, replace = FALSE)]))
Abundance <- rpois(24 * 8, 10)

resamps <- 3

test_that("rarefysamples returns a data frame", {
  result <- rarefysamples(YEAR, SampleID, Species, Abundance, resamps)
  expect_s3_class(result, "data.frame")
})

test_that("rarefysamples returns the expected column names", {
  result <- rarefysamples(YEAR, SampleID, Species, Abundance, resamps)
  expect_equal(colnames(result), c("YEAR", "Species", "currency", "repeats"))
})

test_that("rarefysamples returns non-empty data frame", {
  result <- rarefysamples(YEAR, SampleID, Species, Abundance, resamps)
  expect_false(all(is.na(result)))
})

test_that("rarefysamples returns consistent 'Year' values", {
  result <- rarefysamples(YEAR, SampleID, Species, Abundance, resamps)
  expected_years <- unique(YEAR)
  expect_setequal(unique(result$YEAR), expected_years)
})

test_that("rarefysamples returns consistent 'Species' values", {
  result <- rarefysamples(YEAR, SampleID, Species, Abundance, resamps)
  expected_species <- unique(Species)
  expect_setequal(unique(result$Species), expected_species)
})

test_that("rarefysamples returns positive 'Abundance' values", {
  result <- rarefysamples(YEAR, SampleID, Species, Abundance, resamps)
  checkmate::expect_integerish(result$currency, lower = 0L)
})
