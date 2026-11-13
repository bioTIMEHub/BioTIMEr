# Load data
# example_df <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
# example_df <- example_df |>
#   dplyr::filter(STUDY_ID == 10L) |>
#   tidyr::pivot_wider(id_cols = c(STUDY_ID, SAMPLE_DESC, YEAR), names_from = ID_SPECIES,
#                      values_from = ABUNDANCE, values_fn = sum)

# Create example data for testing
set.seed(42)
data <- data.frame(rpois(1000, 10))

test_that("getAlpha returns a data frame", {
  result <- getAlpha(x = data)
  expect_s3_class(result, "data.frame")
})

test_that("getAlpha returns the expected columns", {
  result <- getAlpha(x = data)
  expected_cols <- c(
    "S",
    "N",
    "maxN",
    "Shannon",
    "Simpson",
    "invSimpson",
    "PIE",
    "DomMc",
    "expShannon"
  )
  expect_equal(colnames(result), expected_cols)
})

test_that("getAlpha returns correct number of rows", {
  result <- getAlpha(x = data)
  expect_equal(object = nrow(result), expected = 1L)
})

test_that("getAlpha computes accurate biodiversity metrics", {
  result <- getAlpha(x = data)

  # Perform calculations using external libraries
  shannon_expected <- vegan::diversity(data, "shannon")
  simpson_expected <- vegan::diversity(data, "simpson")
  inv_expected <- vegan::diversity(data, "inv")

  # Compare computed values with expected values
  expect_equal(result$Shannon, shannon_expected, ignore_attr = TRUE)
  expect_equal(result$expShannon, exp(shannon_expected), ignore_attr = TRUE)
  expect_equal(result$Simpson, simpson_expected, ignore_attr = TRUE)
  expect_equal(result$invSimpson, inv_expected, ignore_attr = TRUE)
  expect_equal(result$Shannon, shannon_expected, ignore_attr = TRUE)
  expect_equal(result$expShannon, exp(shannon_expected), ignore_attr = TRUE)
  expect_equal(result$Simpson, simpson_expected, ignore_attr = TRUE)
  expect_equal(result$invSimpson, inv_expected, ignore_attr = TRUE)
})

test_that("getAlpha works consistently", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(x = getAlpha(x = data))
})

set.seed(42)
dataMetrics <- data.frame(
  resamp = 1L,
  assemblageID = rep(LETTERS[1L:8L], each = 24),
  YEAR = rep(rep(2010:2015, each = 4), times = 4),
  Species = c(replicate(
    n = 8L,
    sample(letters, 24L, replace = FALSE)
  )),
  ABUNDANCE = rpois(24 * 8, 10),
  BIOMASS = rpois(24 * 8, 1000)
)


test_that("getAlphaMetrics works correctly for Abundance", {
  skip_on_ci()
  skip_on_cran()

  abundance_alpha_metrics <- getAlphaMetrics(
    x = dataMetrics,
    measure = "ABUNDANCE"
  ) |>
    as.data.frame()

  expect_snapshot(x = abundance_alpha_metrics)
})

test_that("getAlphaMetrics works correctly for Biomass", {
  skip_on_ci()
  skip_on_cran()

  biomass_alpha_metrics <- getAlphaMetrics(
    x = dataMetrics,
    measure = "BIOMASS"
  ) |>
    as.data.frame()
  expect_snapshot(x = biomass_alpha_metrics)
})

test_that("getAlphaMetrics works correctly without resamp", {
  skip_on_ci()
  skip_on_cran()

  abundance_alpha_metrics_no_resamp <- getAlphaMetrics(
    x = dataMetrics |> dplyr::select(-resamp),
    measure = "ABUNDANCE"
  ) |>
    as.data.frame()

  expect_snapshot(x = abundance_alpha_metrics_no_resamp)
})

test_that("getBetaMetrics works correctly for Abundance", {
  skip_on_ci()
  skip_on_cran()

  abundance_beta_metrics <- getBetaMetrics(
    x = dataMetrics,
    measure = "ABUNDANCE"
  ) |>
    as.data.frame()

  expect_snapshot(x = abundance_beta_metrics)
})

test_that("getBetaMetrics works correctly for Biomass", {
  skip_on_ci()
  skip_on_cran()

  biomass_beta_metrics <- getBetaMetrics(
    x = dataMetrics,
    measure = "BIOMASS"
  ) |>
    as.data.frame()

  expect_snapshot(x = biomass_beta_metrics)
})

test_that("getBetaMetrics works correctly without resamp", {
  skip_on_ci()
  skip_on_cran()

  abundance_Beta_metrics_no_resamp <- getBetaMetrics(
    x = dataMetrics |> dplyr::select(-resamp),
    measure = "ABUNDANCE"
  ) |>
    as.data.frame()

  expect_snapshot(x = abundance_Beta_metrics_no_resamp)
})

# Hand-computed checks --------------------------------------------------------
# 4 years x 3 species. Dissimilarities from the baseline (first year):
#   Bray-Curtis:    0, 10/50, 20/40, 15/45
#   Morisita-Horn:  0, 0.2,   0.5,   0     (year 4 has the same proportions)
#   Jaccard (p/a):  0, 1/3,   2/3,   0
beta_hand <- data.frame(
  assemblageID = "A",
  YEAR = rep(2001:2004, each = 3L),
  Species = rep(c("a", "b", "c"), times = 4L),
  ABUNDANCE = c(10, 10, 10, 10, 10, 0, 10, 0, 0, 5, 5, 5)
) |>
  subset(ABUNDANCE > 0)

expected_beta_hand <- data.frame(
  assemblageID = "A",
  YEAR = 2001:2004,
  JaccardDiss = c(0, 1 / 3, 2 / 3, 0),
  MorisitaHornDiss = c(0, 0.2, 0.5, 0),
  BrayCurtisDiss = c(0, 0.2, 0.5, 1 / 3)
)

test_that("getBetaMetrics gives 0 for the baseline year and no one-year shift", {
  result <- getBetaMetrics(x = beta_hand, measure = "ABUNDANCE") |>
    as.data.frame()

  expect_equal(
    result[, names(expected_beta_hand)],
    expected_beta_hand,
    ignore_attr = TRUE
  )
})

test_that("getBetaMetrics uses the earliest YEAR as baseline for unsorted input", {
  shuffled <- beta_hand[c(7L, 8L, 9L, 1L, 2L, 3L, 6L, 4L, 5L), ]
  expect_true(is.unsorted(shuffled$YEAR))

  result <- getBetaMetrics(x = shuffled, measure = "ABUNDANCE") |>
    as.data.frame()

  expect_equal(
    result[, names(expected_beta_hand)],
    expected_beta_hand,
    ignore_attr = TRUE
  )
})

test_that("getBetaMetrics Jaccard is presence/absence for fractional biomass", {
  # Same two species in all years, only the quantities change
  biomass <- data.frame(
    assemblageID = "A",
    YEAR = rep(2001:2003, each = 2L),
    Species = rep(c("a", "b"), times = 3L),
    BIOMASS = c(0.5, 0.5, 0.1, 0.9, 0.5, 0.5)
  )

  result <- getBetaMetrics(x = biomass, measure = "BIOMASS") |>
    as.data.frame()

  expect_equal(result$JaccardDiss, c(0, 0, 0))
  # Bray-Curtis does see the change: |0.5-0.1| + |0.5-0.9| over 2
  expect_equal(result$BrayCurtisDiss, c(0, 0.4, 0))
})

test_that("getAlpha PIE is hand-computed and NA when N <= 1", {
  # N = 10, p = (0.5, 0.5): PIE = 10/9 * (1 - 0.5)
  expect_equal(getAlpha(x = c(5, 5))$PIE, 5 / 9)

  expect_true(is.na(getAlpha(x = 1)$PIE)) # N = 1 would give Inf
  expect_true(is.na(getAlpha(x = c(0.5, 0.5))$PIE)) # N = 1
  expect_true(is.na(getAlpha(x = c(0.1, 0.1, 0.1))$PIE)) # N < 1 would be < 0
})

# Helper: one assemblage, years 2001:2008, `richness` species per year
.species_by_year <- function(richness, values) {
  species_data <- data.frame(
    assemblageID = "A",
    YEAR = rep(2001:2008, times = richness),
    Species = unlist(lapply(richness, function(s) letters[seq_len(s)]))
  )
  species_data$value <- values(species_data)
  species_data
}

test_that("getLinearRegressions removes years with S == 1 before fitting alpha metrics", {
  # S = 5, 5, 1, 1, 5, 5, 5, 5. The S == 1 years are removed (rule in the
  # function since its first version), so S is constant on the remaining 6
  # years and its slope is 0. Keeping them would give 8 / 42.
  species_data <- .species_by_year(
    richness = c(5L, 5L, 1L, 1L, 5L, 5L, 5L, 5L),
    # varies with year and species so that no metric is a perfect fit
    values = \(d) 10 + (d$YEAR %% 7L) * match(d$Species, letters)
  )
  names(species_data)[names(species_data) == "value"] <- "ABUNDANCE"

  alpha <- getAlphaMetrics(x = species_data, measure = "ABUNDANCE")
  expect_equal(alpha$S, c(5L, 5L, 1L, 1L, 5L, 5L, 5L, 5L))

  slopes <- getLinearRegressions(x = alpha)
  expect_equal(slopes$slope[slopes$metric == "S"], 0, tolerance = 1e-10)
  # The regression of N uses 6 years: check against lm() on those years
  kept <- alpha[alpha$S != 1L, ]
  expect_equal(
    slopes$slope[slopes$metric == "N"],
    unname(coef(lm(kept$N ~ kept$YEAR))[2L])
  )
})

test_that("getLinearRegressions: NA in one metric does not drop the year from the others", {
  # Year 2004 has 2 species with a total biomass of 0.7: N <= 1 so PIE is NA,
  # but S = 2 so the year is kept. S = 5, 5, 5, 2, 5, 5, 5, 5: slope = 1.5 / 42
  species_data <- .species_by_year(
    richness = c(5L, 5L, 5L, 2L, 5L, 5L, 5L, 5L),
    values = \(d) {
      ifelse(
        d$YEAR == 2004L,
        c(0.3, 0.4)[match(d$Species, c("a", "b"))],
        10 + (d$YEAR %% 7L) * match(d$Species, letters)
      )
    }
  )
  names(species_data)[names(species_data) == "value"] <- "BIOMASS"

  alpha <- getAlphaMetrics(x = species_data, measure = "BIOMASS")
  expect_equal(is.na(alpha$PIE), alpha$YEAR == 2004L)

  slopes <- getLinearRegressions(x = alpha)
  expect_equal(slopes$slope[slopes$metric == "S"], 1.5 / 42)
  expect_true(is.element("PIE", slopes$metric))
})

test_that("getLinearRegressions leaves out a metric with fewer than 3 non-NA years", {
  # 6 of 8 years have 2 species and a total biomass of 0.7 (PIE is NA), so PIE
  # has only 2 valid years; S has all 8 years
  species_data <- .species_by_year(
    richness = c(5L, 5L, rep(2L, 6L)),
    values = \(d) {
      ifelse(
        d$YEAR > 2002L,
        c(0.3, 0.4)[match(d$Species, c("a", "b"))],
        10 + (d$YEAR %% 7L) * match(d$Species, letters)
      )
    }
  )
  names(species_data)[names(species_data) == "value"] <- "BIOMASS"

  alpha <- getAlphaMetrics(x = species_data, measure = "BIOMASS")
  slopes <- getLinearRegressions(x = alpha)

  expect_false(is.element("PIE", slopes$metric))
  expect_true(is.element("S", slopes$metric))
})

test_that("getLinearRegressions returns one complete row per metric for constant metrics", {
  # Same two species with the same abundance in 3 years: every metric is
  # constant (NaN p-value)
  constant <- data.frame(
    assemblageID = "A",
    YEAR = rep(2001:2003, each = 2L),
    Species = rep(c("a", "b"), times = 3L),
    ABUNDANCE = 5
  )

  alpha <- getAlphaMetrics(x = constant, measure = "ABUNDANCE")
  slopes <- getLinearRegressions(x = alpha)

  expect_equal(nrow(slopes), 9L)
  expect_setequal(
    as.character(slopes$metric),
    c(
      "S",
      "N",
      "maxN",
      "Shannon",
      "expShannon",
      "Simpson",
      "invSimpson",
      "PIE",
      "DomMc"
    )
  )
  expect_false(anyNA(slopes$slope))
  expect_false(anyNA(slopes$intercept))
})

test_that("getLinearRegressions validates p_threshold for alpha and beta input", {
  beta <- getBetaMetrics(x = beta_hand, measure = "ABUNDANCE")
  alpha <- getAlphaMetrics(x = beta_hand, measure = "ABUNDANCE")

  for (input in list(alpha, beta)) {
    expect_error(getLinearRegressions(x = input, p_threshold = "a"))
    expect_error(getLinearRegressions(x = input, p_threshold = 5))
    expect_error(getLinearRegressions(x = input, p_threshold = NA_real_))
  }
})

test_that("alpha and beta metrics only drop NAs in `measure`, whatever the class", {
  # BIOMASS is NA for species b in 2002 but ABUNDANCE is complete
  na_unrelated <- data.frame(
    assemblageID = "A",
    YEAR = rep(2001:2003, each = 2L),
    Species = rep(c("a", "b"), times = 3L),
    ABUNDANCE = c(4, 6, 5, 5, 6, 4),
    BIOMASS = c(1, 2, 1, NA, 2, 1)
  )

  for (input in list(
    na_unrelated,
    dplyr::as_tibble(na_unrelated),
    data.table::as.data.table(na_unrelated)
  )) {
    alpha <- getAlphaMetrics(x = input, measure = "ABUNDANCE")
    expect_equal(alpha$S, c(2L, 2L, 2L))
    expect_equal(alpha$N, c(10, 10, 10))

    beta <- getBetaMetrics(x = input, measure = "ABUNDANCE")
    expect_equal(beta$JaccardDiss, c(0, 0, 0))
    expect_equal(beta$BrayCurtisDiss, c(0, 0.1, 0.2))
  }
})
