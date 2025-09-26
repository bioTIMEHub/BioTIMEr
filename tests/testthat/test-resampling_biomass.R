# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path(
  "testdata",
  "data-query.rds"
))
test_df <- gridding(BTsubset_meta, BTsubset_data)

test_that("resampling runs correctly for Biomass", {
  skip_on_ci()
  skip_on_cran()
  set.seed(42)

  expect_snapshot({
    result <- resampling(
      x = test_df,
      measure = "BIOMASS",
      resamps = 1L,
      conservative = FALSE
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
  expect_lte(sum(result$Biomass), sum(biomass_test_df$BIOMASS))
})
