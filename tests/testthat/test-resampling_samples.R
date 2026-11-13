# Synthetic data for the sample selection in resampling().
# One assemblage, years 2000 to 2003. `samples` is a list with the sample
# names of each year. Each sample holds two species, a and b.
make_samples_df <- function(samples, assemblage = "1_1", study_id = 1L) {
  n_per_year <- lengths(samples)
  df <- data.frame(
    STUDY_ID = study_id,
    assemblageID = assemblage,
    YEAR = rep(2000L:2003L, times = n_per_year),
    SAMPLE_DESC = unlist(samples)
  )
  df <- df[rep(seq_len(nrow(df)), each = 2L), ]
  df$Species <- rep(c("a", "b"), times = sum(n_per_year))
  df$ABUNDANCE <- 1
  rownames(df) <- NULL
  df
}

test_that("a year with a single numeric sample is kept (integer and double SAMPLE_DESC)", {
  # 1000 is far from 1:3 so a draw from 1:1000 almost never picks it
  samples_int <- list(1000L, 1L:3L, 1L:3L, 1L:3L)
  samples_dbl <- lapply(X = samples_int, FUN = as.numeric)
  for (samples in list(samples_int, samples_dbl)) {
    df <- make_samples_df(samples = samples)
    set.seed(1)
    res <- resampling(
      x = df,
      measure = "ABUNDANCE",
      summarise = FALSE,
      verbose = FALSE
    )
    expect_setequal(unique(res$YEAR), 2000L:2003L)
    expect_identical(class(res$SAMPLE_DESC), class(df$SAMPLE_DESC))
    expect_true(is.element(1000, res$SAMPLE_DESC[res$YEAR == 2000L]))
  }
})

# Number of distinct samples in each assemblage-year of an unsummarised result
count_samples <- function(res) {
  res |>
    dplyr::summarise(
      n_samples = dplyr::n_distinct(SAMPLE_DESC),
      minsamp = unique(minsamp),
      .by = c("resamp", "assemblageID", "YEAR")
    )
}

test_that("a sample name reused in several years does not let extra samples through", {
  samples <- list(
    c("P1", "P2"),
    paste0("P", 1:3),
    paste0("P", 1:4),
    paste0("P", 1:5)
  )
  df <- make_samples_df(samples = samples)
  set.seed(1)
  res <- resampling(
    x = df,
    measure = "ABUNDANCE",
    n_resamples = 5L,
    summarise = FALSE,
    verbose = FALSE
  )
  counts <- count_samples(res)
  expect_setequal(unique(counts$YEAR), 2000L:2003L)
  expect_true(all(counts$minsamp == 2L))
  expect_true(all(counts$n_samples == 2L))
})

test_that("every assemblage-year has exactly minsamp samples (bundled data)", {
  test_df <- gridding(
    base::readRDS(testthat::test_path("testdata", "data-meta.rds")),
    base::readRDS(testthat::test_path("testdata", "data-query.rds"))
  )
  set.seed(42)
  for (conservative in c(FALSE, TRUE)) {
    res <- resampling(
      x = test_df,
      measure = c("ABUNDANCE", "BIOMASS"),
      n_resamples = 2L,
      conservative = conservative,
      summarise = FALSE,
      verbose = FALSE
    )
    counts <- count_samples(res)
    expect_gt(nrow(counts), 0L)
    expect_identical(counts$n_samples, counts$minsamp)
  }
  # ABUNDANCE has no NA: study 402 reuses sample names across years
  res <- resampling(
    x = test_df,
    measure = "ABUNDANCE",
    summarise = FALSE,
    verbose = FALSE
  )
  counts <- count_samples(res)
  expect_identical(counts$n_samples, counts$minsamp)
  # minsamp is the minimum over the years of an assemblage
  expect_identical(
    counts$minsamp,
    stats::ave(counts$n_samples, counts$assemblageID, FUN = min)
  )
})

test_that("conservative = TRUE removes a sample with NA only in the year where it has NA", {
  samples <- list("P1", paste0("P", 1:3), paste0("P", 1:2), paste0("P", 1:2))
  df <- make_samples_df(samples = samples)
  df$ABUNDANCE[df$SAMPLE_DESC == "P1" & df$YEAR == 2001L] <- NA
  set.seed(1)
  res <- resampling(
    x = df,
    measure = "ABUNDANCE",
    conservative = TRUE,
    summarise = FALSE,
    verbose = FALSE
  )
  counts <- count_samples(res)
  # P1 is valid in 2000, 2002 and 2003: those years must stay
  expect_setequal(counts$YEAR, 2000L:2003L)
  expect_true(all(counts$n_samples == 1L))
  expect_identical(res$SAMPLE_DESC[res$YEAR == 2000L][[1L]], "P1")
  expect_false(is.element("P1", res$SAMPLE_DESC[res$YEAR == 2001L]))
})

test_that("same seed gives the same resample after row reordering", {
  samples <- list(
    paste0("s", 1:3),
    paste0("s", 1:6),
    paste0("s", 1:5),
    paste0("s", 1:6)
  )
  df <- make_samples_df(samples = samples)
  set.seed(99)
  df_shuffled <- df[sample(nrow(df)), ]
  expect_false(identical(df$SAMPLE_DESC, df_shuffled$SAMPLE_DESC))

  run <- function(x) {
    set.seed(5)
    res <- resampling(
      x = x,
      measure = "ABUNDANCE",
      n_resamples = 3L,
      summarise = FALSE,
      verbose = FALSE
    )
    res[order(res$resamp, res$YEAR, res$SAMPLE_DESC, res$Species), ]
  }
  res <- run(df)
  res_shuffled <- run(df_shuffled)
  rownames(res) <- NULL
  rownames(res_shuffled) <- NULL
  expect_identical(res, res_shuffled)
})
