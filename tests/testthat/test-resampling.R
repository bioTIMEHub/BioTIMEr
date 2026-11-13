# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path(
  "testdata",
  "data-query.rds"
))
test_df <- gridding(BTsubset_meta, BTsubset_data)

test_that("resampling returns an object of same class as meta", {
  expect_no_error(resdf <- resampling(test_df, measure = "BIOMASS"))
  expect_s3_class(resdf, "data.frame")

  expect_no_error(
    restbl <- resampling(test_df |> dplyr::as_tibble(), measure = "BIOMASS")
  )
  expect_s3_class(
    restbl,
    c("tbl_df", "tbl", "data.frame")
  )

  expect_no_error(
    resdt <- resampling(
      test_df |> data.table::as.data.table(),
      measure = "BIOMASS"
    )
  )
  expect_s3_class(
    resdt,
    c("data.table", "data.frame")
  )
})

test_that("gridded object passed to resampling is not changed by reference", {
  # ABUNDANCE has no NAs: no internal copy is made by NA removal
  # BIOMASS has NAs: an internal copy is made by NA removal
  for (measure in c("ABUNDANCE", "BIOMASS")) {
    gdf <- gridding(BTsubset_meta, BTsubset_data)
    gdf_before <- data.table::copy(gdf)
    suppressWarnings(resampling(gdf, measure = measure))
    expect_s3_class(gdf, "data.frame", exact = TRUE)
    expect_identical(gdf, gdf_before)

    gtbl <- gridding(
      BTsubset_meta |> dplyr::as_tibble(),
      BTsubset_data |> dplyr::as_tibble()
    )
    gtbl_before <- data.table::copy(gtbl)
    suppressWarnings(resampling(gtbl, measure = measure))
    expect_s3_class(
      gtbl,
      c("tbl_df", "tbl", "data.frame"),
      exact = TRUE
    )
    expect_identical(gtbl, gtbl_before)

    gdt <- gridding(
      BTsubset_meta |> data.table::as.data.table(),
      BTsubset_data |> data.table::as.data.table()
    )
    gdt_before <- data.table::copy(gdt)
    suppressWarnings(resampling(gdt, measure = measure))
    expect_s3_class(
      gdt,
      c("data.table", "data.frame"),
      exact = TRUE
    )
    expect_identical(gdt, gdt_before)
    # No leftover column, key or reordering
    expect_false(is.element("minsamp", colnames(gdt)))
    expect_null(data.table::key(gdt))
    expect_identical(colnames(gdt), colnames(gdt_before))
  }
})

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
      resampling(test_df_1y, "BIOMASS", verbose = FALSE)
    },
    expected = {
      set.seed(42)
      resampling(test_df, "BIOMASS", verbose = FALSE)
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

test_that("resampling deprecated resamps argument still works with a warning", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    resampling(x = test_df, measure = "BIOMASS", resamps = 2L),
    regexp = "resamps.*is deprecated"
  )
})
