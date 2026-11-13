# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path(
  "testdata",
  "data-query.rds"
))
test_df <- gridding(BTsubset_meta, BTsubset_data)

test_that("resampling runs correctly for Abundance and Biomass together 2 iterations, conservative", {
  skip_on_ci()
  skip_on_cran()
  set.seed(42)

  expect_snapshot({
    suppressWarnings(
      result <- resampling(
        x = test_df,
        measure = c("ABUNDANCE", "BIOMASS"),
        n_resamples = 2L,
        conservative = TRUE
      )
    )
  })

  checkmate::expect_subset(unique(result$Species), unique(test_df$Species))
  checkmate::expect_subset(
    unique(result$assemblageID),
    unique(test_df$assemblageID)
  )
  checkmate::expect_subset(unique(result$STUDY_ID), unique(test_df$STUDY_ID))

  # subset to data sets that actually had biomass values
  biomass_test_df <- subset(
    test_df[, c("assemblageID", "STUDY_ID", "BIOMASS", "YEAR")],
    !is.na(BIOMASS)
  )
  sub_test_df <- unique(biomass_test_df[, c(
    "assemblageID",
    "STUDY_ID",
    "YEAR"
  )])
  result <- dplyr::semi_join(
    result,
    sub_test_df,
    dplyr::join_by(assemblageID, YEAR)
  ) # STUDY_ID

  expect_false(anyNA(result))
  # n_resamples = 2: each resample sums to at most the total
  expect_lte(
    max(tapply(X = result$BIOMASS, INDEX = result$resamp, FUN = sum)),
    sum(biomass_test_df$BIOMASS)
  )
})

test_that("conservative=TRUE actually removes samples with NA in any measure column", {
  # Build a dataset where one row of one sample has NA in BIOMASS.
  # The same SAMPLE_DESC can be reused in other years or cells: a sample is
  # identified by (assemblageID, YEAR, SAMPLE_DESC).
  test_df_na <- test_df
  # Pick a complete sample (>= 2 rows) in an assemblage-year that has another
  # complete sample, in a study with >= 2 such years: after the injection the
  # assemblage-year must survive the conservative filter.
  na_key <- test_df |>
    dplyr::summarise(
      has_na = anyNA(BIOMASS) || anyNA(ABUNDANCE),
      n_rows = dplyr::n(),
      .by = c("STUDY_ID", "assemblageID", "YEAR", "SAMPLE_DESC")
    ) |>
    dplyr::filter(!has_na, n_rows >= 2L) |>
    dplyr::mutate(
      n_ok_samples = dplyr::n(),
      .by = c("STUDY_ID", "assemblageID", "YEAR")
    ) |>
    dplyr::mutate(n_ok_years = dplyr::n_distinct(YEAR), .by = "STUDY_ID") |>
    dplyr::filter(n_ok_samples >= 2L, n_ok_years >= 2L) |>
    dplyr::select("assemblageID", "YEAR", "SAMPLE_DESC") |>
    utils::head(n = 1L)
  expect_identical(nrow(na_key), 1L)
  na_row <- which(
    test_df_na$assemblageID == na_key$assemblageID &
      test_df_na$YEAR == na_key$YEAR &
      test_df_na$SAMPLE_DESC == na_key$SAMPLE_DESC
  )[[1L]]
  test_df_na$BIOMASS[na_row] <- NA
  # The sample has other rows without NA: only conservative = TRUE drops them
  expect_gt(
    sum(
      test_df_na$assemblageID == na_key$assemblageID &
        test_df_na$YEAR == na_key$YEAR &
        test_df_na$SAMPLE_DESC == na_key$SAMPLE_DESC
    ),
    1L
  )

  result_conservative <- suppressWarnings(
    resampling(
      x = test_df_na,
      measure = c("ABUNDANCE", "BIOMASS"),
      n_resamples = 1L,
      conservative = TRUE,
      summarise = FALSE
    )
  )
  result_non_conservative <- suppressWarnings(
    resampling(
      x = test_df_na,
      measure = c("ABUNDANCE", "BIOMASS"),
      n_resamples = 1L,
      conservative = FALSE,
      summarise = FALSE
    )
  )
  # The suppressed warning still fires
  expect_warning(
    resampling(
      x = test_df_na,
      measure = c("ABUNDANCE", "BIOMASS"),
      conservative = TRUE
    ),
    regexp = "whole samples removed"
  )

  in_na_assemblage_year <- function(res) {
    res$assemblageID == na_key$assemblageID & res$YEAR == na_key$YEAR
  }
  # The assemblage-year is still there (other samples have no NA) ...
  expect_true(any(in_na_assemblage_year(result_conservative)))
  # ... but the contaminated sample is gone from the conservative result.
  # (Checked on the key: the name alone may be reused elsewhere.)
  expect_false(is.element(
    na_key$SAMPLE_DESC,
    result_conservative$SAMPLE_DESC[in_na_assemblage_year(result_conservative)]
  ))

  # The two results must differ (conservative discards more data)
  expect_false(identical(result_conservative, result_non_conservative))

  # No NAs should remain in either result
  expect_false(anyNA(result_conservative$BIOMASS))
  expect_false(anyNA(result_non_conservative$BIOMASS))
})
