# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path(
  "testdata",
  "data-query.rds"
))
test_df <- gridding(BTsubset_meta, BTsubset_data)


test_that("resampling correctly excludes 1 year long studies", {
  test_df_1y <- rbind(
    test_df,
    test_df |>
      dplyr::filter(SAMPLE_DESC == "1984_12_Control_0_Medium") |>
      dplyr::mutate(
        SAMPLE_DESC = "TEST",
        STUDY_ID = 9999L,
        YEAR = 2005L,
        BIOMASS = 1L,
        ABUNDANCE = 1L
      )
  )

  expect_warning(
    resampling(test_df_1y, "BIOMASS"),
    regexp = "Some 1-year-long studies were removed."
  )

  expect_equal(
    object = {
      set.seed(42)
      suppressWarnings(
        resampling(test_df_1y, "BIOMASS")
      )
    },
    expected = {
      set.seed(42)
      resampling(test_df, "BIOMASS")
    }
  )
})

test_that("resampling correctly manages data.table, tibble and data.frame objects and respect class", {
  skip_on_ci()
  skip_on_cran()
  set.seed(42)

  data.table::setDT(test_df)
  test_object <- resampling(test_df, measure = "BIOMASS") # BIOMASS would be faster

  expect_s3_class(object = test_object, class = c("data.table", "data.frame"))
  # if test_df is a tibble, test_object has to be a tibble
})
