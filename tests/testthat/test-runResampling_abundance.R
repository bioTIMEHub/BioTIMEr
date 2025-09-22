# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path(
  "testdata",
  "data-query.rds"
))
test_df <- gridding(BTsubset_meta, BTsubset_data)

test_that("resampling runs correctly for Abundance", {
  skip_on_ci()
  skip_on_cran()
  set.seed(42)

  expect_snapshot({
    result <- resampling(
      x = test_df,
      measure = "ABUNDANCE",
      resamps = 1L,
      conservative = FALSE
    )
  })

  checkmate::expect_subset(
    x = unique(result$Species),
    choices = unique(test_df$Species)
  )
  checkmate::expect_subset(
    unique(result$assemblageID),
    levels(test_df$assemblageID)
  )
  checkmate::expect_subset(unique(result$STUDY_ID), unique(test_df$STUDY_ID))

  # subset to data sets that actually had abundance values
  abundance_test_df <- subset(
    test_df[, c("assemblageID", "STUDY_ID", "ABUNDANCE", "YEAR")],
    !is.na(ABUNDANCE)
  )
  sub_test_df <- unique(abundance_test_df[, c(
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
  expect_lte(sum(result$ABUNDANCE), sum(abundance_test_df$ABUNDANCE))
})
