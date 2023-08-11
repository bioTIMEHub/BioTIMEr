# Create example data for testing
Species <- c("Species1", "Species2", "Species1", "Species2")
Abundance <- c(5, 8, 3, 6)
Year <- c(2000, 2000, 2001, 2001)
data <- data.frame(Year, Species, Abundance)

test_that("doPivot returns a data frame", {
  result <- doPivot(data)
  expect_s3_class(result, "data.frame")
})

test_that("doPivot returns the correct number of rows", {
  result <- doPivot(data)
  expected_rows <- length(unique(data$Year))
  expect_equal(nrow(result), expected_rows)
})

test_that("doPivot returns the correct number of columns", {
  result <- doPivot(data)
  unique_species <- unique(data$Species)
  expect_equal(
    object = ncol(result),
    expected = length(unique_species) + 1L,
    label = "Number of columns matches unique species plus Year columns"
  )
})

test_that("doPivot returns the expected column names", {
  result <- doPivot(data)
  unique_species <- unique(data$Species)
  expected_cols <- c("Year", unique_species)
  expect_equal(colnames(result), expected_cols)
})

test_that("doPivot fills missing values with 0", {
  result <- doPivot(data)
  expect_false(anyNA(result), label = "No NA values in the result")
})

# test_that("doPivot sums duplicate entries for the same Species and Year", {
#   duplicate_data <- rbind(data, data)
#   result <- doPivot(duplicate_data)
#   expected_abundances <- c(5 + 5, 8 + 8)
#   expect_equal(result$Species1, expected_abundances[1])
#   expect_equal(result$Species2, expected_abundances[2])
# })

# test_that("doPivot correctly distributes values", {
#   result <- doPivot(data)
# })
