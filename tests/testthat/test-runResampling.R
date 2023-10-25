# Loading data for testing runResampling
subBTmeta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
subBTquery <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))
example_data <- gridding(subBTmeta, subBTquery)

test_that("runResampling runs correctly for Abundance", {
  result <- runResampling(df = example_data, ab = "A")

  expect_true(all(unique(result$Species) %in% unique(example_data$Species)))
  expect_true(all(unique(result$rarefyID) %in% unique(example_data$rarefyID)))
  expect_true(all(unique(result$StudyID) %in% unique(example_data$STUDY_ID)))

  # subset to data sets that actually had abundance values
  abundance_example_data <- subset(example_data[, c("rarefyID", "STUDY_ID", "ABUNDANCE", "YEAR")], !is.na(ABUNDANCE))
  sub_example_data <- unique(abundance_example_data[, c("rarefyID", "STUDY_ID", "YEAR")])
  result <- dplyr::semi_join(result, sub_example_data, dplyr::join_by(rarefyID, STUDY_ID, YEAR))

  expect_false(anyNA(result))
  expect_lte(sum(result$Abundance), sum(abundance_example_data$ABUNDANCE))
})


test_that("runResampling runs correctly for Biomass", {
  result <- runResampling(df = example_data, ab = "B")

  expect_true(all(unique(result$Species) %in% unique(example_data$Species)))
  expect_true(all(unique(result$rarefyID) %in% unique(example_data$rarefyID)))
  expect_true(all(unique(result$StudyID) %in% unique(example_data$STUDY_ID)))

  # subset to data sets that actually had biomass values
  biomass_example_data <- subset(example_data[, c("rarefyID", "STUDY_ID", "BIOMASS", "YEAR")], !is.na(BIOMASS))
  sub_example_data <- unique(biomass_example_data[, c("rarefyID", "STUDY_ID", "YEAR")])
  result <- dplyr::semi_join(result, sub_example_data, dplyr::join_by(rarefyID, STUDY_ID, YEAR))

  expect_false(anyNA(result))
  expect_lte(sum(result$Biomass), sum(biomass_example_data$BIOMASS))
})

