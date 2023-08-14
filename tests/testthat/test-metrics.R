# Create example data for testing
Species <- c("Species1", "Species2", "Species1", "Species2")
Abundance <- c(5, 8, 3, 6)
Year <- c(2000, 2000, 2001, 2001)
data <- data.frame(Year, Species, Abundance)
pivot_data <- doPivot(data)

test_that("getAlphav1 returns a data frame", {
  result <- getAlphav1(x = pivot_data, id = "TestID", pivot = FALSE)
  expect_s3_class(result, "data.frame")
})

test_that("getAlphav1 returns the expected columns", {
  result <- getAlphav1(x = pivot_data, id = "TestID", pivot = FALSE)
  expected_cols <- c("Year", "ID", "q1", "q2", "invS", "h0", "h1", "h2")
  expect_equal(colnames(result), expected_cols)
})

test_that("getAlphav1 returns correct number of rows", {
  result <- getAlphav1(x = pivot_data, id = "TestID", pivot = FALSE)
  expect_equal(object = nrow(result), expected = nrow(pivot_data))
})

test_that("getAlphav1 computes accurate biodiversity metrics", {
  result <- getAlphav1(x = pivot_data, id = "TestID", pivot = FALSE)

  # Perform calculations using external libraries
  shannon_expected <- vegan::diversity(pivot_data[, -1L], "shannon")
  simpson_expected <- vegan::diversity(pivot_data[, -1L], "simpson")
  inv_expected <- vegan::diversity(pivot_data[, -1L], "inv")
  h0_expected <- hillR::hill_taxa(pivot_data[, -1L], q = 0)
  h1_expected <- hillR::hill_taxa(pivot_data[, -1L], q = 1)
  h2_expected <- hillR::hill_taxa(pivot_data[, -1L], q = 2)

  # Compare computed values with expected values
  expect_equal(result$q1, (exp(1/shannon_expected)), ignore_attr = FALSE)
  expect_equal(result$q2, (1/simpson_expected), ignore_attr = FALSE)
  expect_equal(result$invS, inv_expected, ignore_attr = FALSE)
  expect_equal(result$h0, h0_expected, ignore_attr = FALSE)
  expect_equal(result$h1, h1_expected, ignore_attr = FALSE)
  expect_equal(result$h2, h2_expected, ignore_attr = FALSE)
})

test_that("getAlphav2 returns a data frame", {
  result <- getAlphav2(x = pivot_data, id = "TestID", pivot = FALSE)
  expect_s3_class(result, "data.frame")
})

test_that("getAlphav2 returns the expected columns", {
  result <- getAlphav2(x = pivot_data, id = "TestID", pivot = FALSE)
  expected_cols <- c("Year", "ID", "S", "N", "mx", "PIE", "DomMc", "expShan")
  expect_equal(colnames(result), expected_cols)
})

test_that("getAlphav2 returns correct number of rows", {
  result <- getAlphav2(x = pivot_data, id = "TestID", pivot = FALSE)
  expected_rows <- length(unique(data$Year))
  expect_equal(nrow(result), expected_rows)
})

test_that("getAlphav2 computes accurate biodiversity metrics", {
  result <- getAlphav2(x = pivot_data, id = "TestID", pivot = FALSE)

  # Calculate expected values using custom functions
  s_expected <- apply(pivot_data[, -1L], 1, function(s) sum(s != 0))
  n_expected <- apply(pivot_data[, -1L], 1, sum)
  mx_expected <- apply(pivot_data[, -1L], 1, max)
  pie_expected <- apply(pivot_data[, -1L], 1, function(s) {
    n <- sum(s)
    (n / (n - 1)) * (1 - sum((s / n)^2))
  })
  dommc_expected <- apply(pivot_data[, -1L], 1, function(s) {
    y <- sort(s, decreasing = TRUE)
    (y[1] + y[2]) / sum(y)
  })
  expshan_expected <- apply(pivot_data[, -1L], 1, function(s) {
    n <- sum(s)
    exp(-sum(s / n * ifelse(s == 0, 0, log(s / n))))
  })

  # Compare computed values with expected values
  expect_equal(result$S, s_expected, ignore_attr = FALSE)
  expect_equal(result$N, n_expected, ignore_attr = FALSE)
  expect_equal(result$mx, mx_expected, ignore_attr = FALSE)
  expect_equal(result$PIE, pie_expected, ignore_attr = FALSE)
  expect_equal(result$DomMc, dommc_expected, ignore_attr = FALSE)
  expect_equal(result$expShan, expshan_expected, ignore_attr = FALSE)
})

test_that("getBetav2 returns a data frame", {
  result <- getBetav2(x = pivot_data, id = "TestID", pivot = FALSE)
  expect_s3_class(result, "data.frame")
})

test_that("getBetav2 returns the expected columns", {
  result <- getBetav2(x = pivot_data, id = "TestID", pivot = FALSE)
  expected_cols <- c("Year", "ID", "jaccD", "mhorn")
  expect_equal(colnames(result), expected_cols)
})

test_that("getBetav2 returns correct number of rows", {
  result <- getBetav2(x = pivot_data, id = "TestID", pivot = FALSE)
  expected_rows <- length(unique(data$Year))
  expect_equal(nrow(result), expected_rows)
})

test_that("getBetav2 computes accurate biodiversity metrics", {
  result <- getBetav2(x = pivot_data, id = "TestID", pivot = FALSE)

  # Calculate expected values using external libraries
  x2 <- pivot_data[, -1L]
  x2[x2 > 1] <- 1
  jacc_expected <- vegan::vegdist(x2, method = "jaccard")
  mh_expected <- vegan::vegdist(pivot_data[, -1L], method = "horn")

  # Compare computed values with expected values
  expect_equal(result$jaccD[-2], jacc_expected, ignore_attr = TRUE)
  expect_equal(result$mhorn[-2], mh_expected, ignore_attr = TRUE)
})
