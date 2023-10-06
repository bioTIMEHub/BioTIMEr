# Create example data for testing
Species <- c("Species1", "Species2", "Species1", "Species2")
Abundance <- c(5, 8, 3, 6)
Year <- c(2000, 2000, 2001, 2001)
data <- data.frame(Year, Species, Abundance)

test_that("getAlpha returns a data frame", {
  result <- getAlpha(x = data, getID = "TestID")
  expect_s3_class(result, "data.frame")
})

test_that("getAlpha returns the expected columns", {
  result <- getAlpha(x = data, getID = "TestID")
  expected_cols <- c("Year", "ID", "q1", "q2", "invS", "h0", "h1", "h2")
  expect_equal(colnames(result), expected_cols)
})

test_that("getAlpha returns correct number of rows", {
  result <- getAlpha(x = data, getID = "TestID")
  expect_equal(object = nrow(result), expected = nrow(pivot_data))
})

test_that("getAlpha computes accurate biodiversity metrics", {
  result <- getAlpha(x = data, getID = "TestID")

  # Perform calculations using external libraries
  shannon_expected <- vegan::diversity(data[, -1L], "shannon")
  simpson_expected <- vegan::diversity(data[, -1L], "simpson")
  inv_expected <- vegan::diversity(data[, -1L], "inv")
  h0_expected <- hillR::hill_taxa(data[, -1L], q = 0)
  h1_expected <- hillR::hill_taxa(data[, -1L], q = 1)
  h2_expected <- hillR::hill_taxa(data[, -1L], q = 2)

  # Compare computed values with expected values
  expect_equal(result$q1, (exp(1/shannon_expected)), ignore_attr = FALSE)
  expect_equal(result$q2, (1/simpson_expected), ignore_attr = FALSE)
  expect_equal(result$invS, inv_expected, ignore_attr = FALSE)
  expect_equal(result$h0, h0_expected, ignore_attr = FALSE)
  expect_equal(result$h1, h1_expected, ignore_attr = FALSE)
  expect_equal(result$h2, h2_expected, ignore_attr = FALSE)
})

test_that("getBeta returns a data frame", {
  result <- getBeta(x = pivot_data, id = "TestID")
  expect_s3_class(result, "data.frame")
})

test_that("getBeta returns the expected columns", {
  result <- getBeta(x = pivot_data, id = "TestID")
  expected_cols <- c("Year", "ID", "jaccD", "mhorn")
  expect_equal(colnames(result), expected_cols)
})

test_that("getBeta returns correct number of rows", {
  result <- getBeta(x = pivot_data, id = "TestID")
  expected_rows <- length(unique(data$Year))
  expect_equal(nrow(result), expected_rows)
})

test_that("getBeta computes accurate biodiversity metrics", {
  result <- getBeta(x = pivot_data, id = "TestID")

  # Calculate expected values using external libraries
  x2 <- pivot_data[, -1L]
  x2[x2 > 1] <- 1
  jacc_expected <- vegan::vegdist(x2, method = "jaccard")
  mh_expected <- vegan::vegdist(pivot_data[, -1L], method = "horn")

  # Compare computed values with expected values
  expect_equal(result$jaccD[-2], jacc_expected, ignore_attr = TRUE)
  expect_equal(result$mhorn[-2], mh_expected, ignore_attr = TRUE)
})
