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
  checkmate::expect_subset(unique(result$StudyID), unique(test_df$STUDY_ID))

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
  expect_lte(sum(result$Biomass), sum(biomass_test_df$BIOMASS))
})

test_that("conservative=TRUE actually removes samples with NA in any measure column", {
  # Build a dataset where some SAMPLE_DESCs have NA in BIOMASS
  test_df_na <- test_df
  # Inject NAs into BIOMASS for a specific sample
  na_sample <- unique(test_df_na$SAMPLE_DESC)[[1L]]
  test_df_na$BIOMASS[test_df_na$SAMPLE_DESC == na_sample] <- NA

  result_conservative <- suppressWarnings(
    resampling(
      x = test_df_na,
      measure = c("ABUNDANCE", "BIOMASS"),
      n_resamples = 1L,
      conservative = TRUE
    )
  )
  result_non_conservative <- suppressWarnings(
    resampling(
      x = test_df_na,
      measure = c("ABUNDANCE", "BIOMASS"),
      n_resamples = 1L,
      conservative = FALSE
    )
  )

  # conservative=TRUE removes the whole sample; non-conservative removes only NA rows.
  # The contaminated sample should not appear in the conservative result at all.
  expect_false(na_sample %in% result_conservative$SAMPLE_DESC)

  # The two results must differ (conservative discards more data)
  expect_false(identical(result_conservative, result_non_conservative))

  # No NAs should remain in either result
  expect_false(anyNA(result_conservative$BIOMASS))
  expect_false(anyNA(result_non_conservative$BIOMASS))
})
