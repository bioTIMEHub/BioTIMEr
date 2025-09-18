# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path(
  "testdata",
  "data-query.rds"
))
test_df <- gridding(BTsubset_meta, BTsubset_data)

test_that("resampling runs correctly for Abundance", {
  skip_on_cran()
  skip_on_ci()

  expect_snapshot({
    result <- resampling(
      x = test_df,
      measure = "ABUNDANCE",
      resamps = 1L,
      conservative = FALSE
    )
  })

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(
    unique(result$assemblageID) %in% unique(test_df$assemblageID)
  ))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

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
  expect_lte(sum(result$Abundance), sum(abundance_test_df$ABUNDANCE))
})


test_that("resampling runs correctly for Biomass", {
  skip_on_cran()
  skip_on_ci()

  expect_snapshot({
    result <- resampling(
      x = test_df,
      measure = "BIOMASS",
      resamps = 1L,
      conservative = FALSE
    )
  })

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(
    unique(result$assemblageID) %in% unique(test_df$assemblageID)
  ))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

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


test_that("resampling runs correctly for Abundance and Biomass together", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot({
    result <- resampling(
      x = test_df,
      measure = c("ABUNDANCE", "BIOMASS"),
      resamps = 1L,
      conservative = FALSE
    )
  })

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(
    unique(result$assemblageID) %in% unique(test_df$assemblageID)
  ))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

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

test_that("resampling runs correctly for Abundance and Biomass together
          2 iterations, conservative", {
  skip_on_ci()
  skip_on_cran()

  suppressWarnings(
    expect_snapshot({
      result <- resampling(
        x = test_df,
        measure = c("ABUNDANCE", "BIOMASS"),
        resamps = 2L,
        conservative = TRUE
      )
    })
  )

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(
    unique(result$assemblageID) %in% unique(test_df$assemblageID)
  ))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

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

test_that("resampling correctly excludes 1 year long studies", {
  test_df_1y <- rbind(
    test_df,
    test_df |>
      dplyr::filter(SAMPLE_DESC == "1984_12_Control_0_Medium") |>
      dplyr::mutate(SAMPLE_DESC = "TEST", STUDY_ID = "TEST", YEAR = 2005L)
  )

  expect_equal(
    object = {
      set.seed(42)
      suppressWarnings(
        resampling(test_df_1y, "ABUNDANCE")
      )
    },
    expected = {
      set.seed(42)
      resampling(test_df, "ABUNDANCE")
    }
  )

  expect_warning(resampling(test_df_1y, "ABUNDANCE"))
})

test_that("resampling correctly manages data.table objects", {
  skip_on_ci()
  skip_on_cran()

  data.table::setDT(test_df)
  expect_snapshot(resampling(test_df, measure = "ABUNDANCE"))
  expect_warning(resampling(test_df, measure = "ABUNDANCE"))
})
