# Loading data for testing resampling
BTsubset_meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
BTsubset_data <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
test_df <- gridding(BTsubset_meta, BTsubset_data)

test_that("resampling runs correctly for Abundance", {
  expect_snapshot({
    result <- resampling(x = test_df, measure = "ABUNDANCE",
                         resamps = 1L, conservative = FALSE)
  })

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(unique(result$assemblageID) %in% unique(test_df$assemblageID)))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

  # subset to data sets that actually had abundance values
  abundance_test_df <- subset(test_df[, c("assemblageID", "STUDY_ID", "ABUNDANCE", "YEAR")], !is.na(ABUNDANCE))
  sub_test_df <- unique(abundance_test_df[, c("assemblageID", "STUDY_ID", "YEAR")])
  result <- dplyr::semi_join(result, sub_test_df, dplyr::join_by(assemblageID, YEAR)) # STUDY_ID

  expect_false(anyNA(result))
  expect_lte(sum(result$Abundance), sum(abundance_test_df$ABUNDANCE))
})


test_that("resampling runs correctly for Biomass", {
  expect_snapshot({
    result <- resampling(x = test_df, measure = "BIOMASS",
                         resamps = 1L, conservative = FALSE)
  })

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(unique(result$assemblageID) %in% unique(test_df$assemblageID)))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

  # subset to data sets that actually had biomass values
  biomass_test_df <- subset(test_df[, c("assemblageID", "STUDY_ID", "BIOMASS", "YEAR")], !is.na(BIOMASS))
  sub_test_df <- unique(biomass_test_df[, c("assemblageID", "STUDY_ID", "YEAR")])
  result <- dplyr::semi_join(result, sub_test_df, dplyr::join_by(assemblageID, YEAR)) # STUDY_ID

  expect_false(anyNA(result))
  expect_lte(sum(result$Biomass), sum(biomass_test_df$BIOMASS))
})


test_that("resampling runs correctly for Abundance and Biomass together", {
  expect_snapshot({
    result <- resampling(x = test_df, measure = c("ABUNDANCE","BIOMASS"),
                         resamps = 1L, conservative = FALSE)
  })

  expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
  expect_true(all(unique(result$assemblageID) %in% unique(test_df$assemblageID)))
  expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

  # subset to data sets that actually had biomass values
  biomass_test_df <- subset(test_df[, c("assemblageID", "STUDY_ID", "BIOMASS", "YEAR")], !is.na(BIOMASS))
  sub_test_df <- unique(biomass_test_df[, c("assemblageID", "STUDY_ID", "YEAR")])
  result <- dplyr::semi_join(result, sub_test_df, dplyr::join_by(assemblageID, YEAR)) # STUDY_ID

  expect_false(anyNA(result))
  expect_lte(sum(result$Biomass), sum(biomass_test_df$BIOMASS))
})

test_that("resampling runs correctly for Abundance and Biomass together
          2 iterations, conservative", {
            suppressWarnings(
              expect_snapshot({
                result <- resampling(x = test_df, measure = c("ABUNDANCE","BIOMASS"),
                                     resamps = 2L, conservative = TRUE)
              })
            )

            expect_true(all(unique(result$Species) %in% unique(test_df$Species)))
            expect_true(all(unique(result$assemblageID) %in% unique(test_df$assemblageID)))
            expect_true(all(unique(result$StudyID) %in% unique(test_df$STUDY_ID)))

            # subset to data sets that actually had biomass values
            biomass_test_df <- subset(test_df[, c("assemblageID", "STUDY_ID", "BIOMASS", "YEAR")], !is.na(BIOMASS))
            sub_test_df <- unique(biomass_test_df[, c("assemblageID", "STUDY_ID", "YEAR")])
            result <- dplyr::semi_join(result, sub_test_df, dplyr::join_by(assemblageID, YEAR)) # STUDY_ID

            expect_false(anyNA(result))
            expect_lte(sum(result$Biomass), sum(biomass_test_df$BIOMASS))
          })
