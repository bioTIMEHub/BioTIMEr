# Load example data for testing
meta <- base::readRDS(testthat::test_path("testdata", "data-meta.rds"))
btf <- base::readRDS(testthat::test_path("testdata", "data-query.rds"))

test_that("gridding returns an object of same class as meta", {
  expect_no_error(resdf <- gridding(meta, btf))
  expect_s3_class(resdf, "data.frame", exact = TRUE)

  expect_no_error(
    restbl <- gridding(meta |> dplyr::as_tibble(), btf |> dplyr::as_tibble())
  )
  expect_s3_class(
    restbl,
    c("tbl_df", "tbl", "data.frame"),
    exact = TRUE
  )

  expect_no_error(
    resdt <- gridding(
      meta |> data.table::as.data.table(),
      btf |> data.table::as.data.table()
    )
  )
  expect_s3_class(
    resdt,
    c("data.table", "data.frame"),
    exact = TRUE
  )
})

test_that("gridding returns data.table results visibly", {
  # setDT() returns invisibly: the result used to print nothing at the console
  visible <- withVisible(
    gridding(
      meta |> data.table::as.data.table(),
      btf |> data.table::as.data.table(),
      verbose = FALSE
    )
  )$visible
  expect_true(visible)
})

test_that("gridding returns the expected columns", {
  expected_cols <- c(
    "CLIMATE",
    "REALM",
    "TAXA",
    "StudyMethod",
    "SAMPLE_DESC",
    "ABUNDANCE_TYPE",
    "BIOMASS_TYPE",
    "assemblageID",
    "STUDY_ID",
    "YEAR",
    "cell",
    "Species",
    "DAY",
    "MONTH",
    "ABUNDANCE",
    "BIOMASS",
    "taxon",
    "LATITUDE",
    "LONGITUDE",
    "resolution"
  )
  checkmate::expect_names(
    x = colnames(gridding(meta, btf)),
    what = "colnames",
    permutation.of = expected_cols
  )
})

test_that("gridding returns correct number of rows", {
  expected_rows <- nrow(btf)
  expect_equal(nrow(gridding(meta, btf)), expected_rows)
})

test_that("gridding stops when STUDY_ID is duplicated in meta", {
  duplicated_id <- meta$STUDY_ID[[1L]]
  meta_dup <- rbind(meta, meta[meta$STUDY_ID == duplicated_id, ])
  expect_error(
    gridding(meta_dup, btf, verbose = FALSE),
    regexp = paste0("one row per study.*", duplicated_id)
  )
})

test_that("gridding stops when STUDY_ID is missing in meta or x", {
  meta_na <- meta
  meta_na$STUDY_ID[[2L]] <- NA
  expect_error(
    gridding(meta_na, btf, verbose = FALSE),
    regexp = "meta\\$STUDY_ID"
  )
  btf_na <- btf
  btf_na$STUDY_ID[[1L]] <- NA
  expect_error(gridding(meta, btf_na, verbose = FALSE), regexp = "x\\$STUDY_ID")
})

test_that("gridding warns about data rows without a meta row and drops them", {
  dropped_id <- meta$STUDY_ID[[1L]]
  n_dropped <- sum(btf$STUDY_ID == dropped_id)
  expect_gt(n_dropped, 0L)
  expect_warning(
    res <- gridding(
      meta[meta$STUDY_ID != dropped_id, ],
      btf,
      verbose = FALSE
    ),
    regexp = paste0(n_dropped, " rows of `x` were dropped.*", dropped_id)
  )
  expect_equal(nrow(res), nrow(btf) - n_dropped)
  expect_false(is.element(dropped_id, res$STUDY_ID))
})

test_that("gridding does not warn when every data row has a meta row", {
  expect_no_warning(gridding(meta, btf, verbose = FALSE))
})

test_that(".format_ids shortens long lists", {
  expect_equal(.format_ids(c(3L, 1L)), "3, 1")
  expect_equal(.format_ids(1:12, max_shown = 3L), "1, 2, 3 and 9 more")
})

# One ML and one SL study of the test data, found with the current rule
ref <- gridding(meta, btf, verbose = FALSE)
ml_id <- ref$STUDY_ID[ref$StudyMethod == "ML"][[1L]]
sl_id <- ref$STUDY_ID[ref$StudyMethod == "SL"][[1L]]

test_that("gridding stops on missing or invalid sample coordinates of ML studies", {
  ml_rows <- which(btf$STUDY_ID == ml_id)
  for (bad in list(NA_real_, Inf, 95, -120)) {
    btf_bad <- btf
    btf_bad$LATITUDE[ml_rows[[1L]]] <- bad
    expect_error(
      gridding(meta, btf_bad, verbose = FALSE),
      regexp = paste0("1 rows of ML studies.*STUDY_ID ", ml_id)
    )
  }
  btf_bad <- btf
  btf_bad$LONGITUDE[ml_rows[1:2]] <- c(NA, 361)
  expect_error(
    gridding(meta, btf_bad, verbose = FALSE),
    regexp = paste0("2 rows of ML studies.*STUDY_ID ", ml_id)
  )
})

test_that("gridding stops on a missing or invalid centroid of SL studies", {
  n_rows <- sum(btf$STUDY_ID == sl_id)
  for (column in c("CENT_LAT", "CENT_LONG")) {
    meta_bad <- meta
    meta_bad[[column]][meta_bad$STUDY_ID == sl_id] <- NA
    expect_error(
      gridding(meta_bad, btf, verbose = FALSE),
      regexp = paste0(n_rows, " rows of SL studies.*STUDY_ID ", sl_id)
    )
  }
})

test_that("gridding does not use the sample coordinates of SL studies", {
  # SL studies are gridded by the meta centroid: the samples, even invalid or
  # far from the centroid, change nothing. In the test data the samples of SL
  # studies lie in the centroid cell, so they are moved here.
  btf_moved <- btf
  is_sl <- is.element(btf_moved$STUDY_ID, ref$STUDY_ID[ref$StudyMethod == "SL"])
  btf_moved$LATITUDE[is_sl] <- NA
  btf_moved$LONGITUDE[is_sl] <- 0
  res <- gridding(meta, btf_moved, verbose = FALSE)
  expect_equal(res$cell, ref$cell)
  expect_equal(res$assemblageID, ref$assemblageID)
})

test_that("every SL study stays in a single cell, whatever its samples and resolution", {
  # Invariant that was a runtime check (deleted: it cannot fail while STUDY_ID
  # is unique in meta). SL studies are gridded by one centroid. The samples are
  # scattered over the globe here, so gridding SL studies by their samples
  # would give many cells.
  btf_scattered <- btf
  is_sl <- is.element(btf$STUDY_ID, ref$STUDY_ID[ref$StudyMethod == "SL"])
  expect_gt(sum(is_sl), 100L)
  btf_scattered$LATITUDE[is_sl] <- seq(-80, 80, length.out = sum(is_sl))
  btf_scattered$LONGITUDE[is_sl] <- seq(-170, 170, length.out = sum(is_sl))

  for (args in list(list(res = 12), list(res = 18), list(res_by_data = TRUE))) {
    res <- do.call(
      gridding,
      c(list(meta = meta, x = btf_scattered, verbose = FALSE), args)
    )
    sl <- res[res$StudyMethod == "SL", ]
    expect_gt(nrow(sl), 0L)
    expect_equal(
      as.vector(tapply(sl$cell, sl$STUDY_ID, data.table::uniqueN)),
      rep(1L, dplyr::n_distinct(sl$STUDY_ID))
    )
    expect_equal(
      as.vector(tapply(sl$assemblageID, sl$STUDY_ID, data.table::uniqueN)),
      rep(1L, dplyr::n_distinct(sl$STUDY_ID))
    )
  }
})

test_that("gridding accepts the limits of latitude and the wrapped longitudes", {
  ml_rows <- which(btf$STUDY_ID == ml_id)[1:3]
  btf_edge <- btf
  btf_edge$LATITUDE[ml_rows] <- c(90, -90, 0)
  expect_no_error(gridding(meta, btf_edge, verbose = FALSE))

  # dggridR wraps longitudes: 190 is the same place as -170
  btf_a <- btf
  btf_a$LONGITUDE[ml_rows] <- c(-170, 180, -180)
  btf_b <- btf
  btf_b$LONGITUDE[ml_rows] <- c(190, -180, 180)
  expect_equal(
    gridding(meta, btf_a, verbose = FALSE)$cell,
    gridding(meta, btf_b, verbose = FALSE)$cell
  )
  btf_far <- btf
  btf_far$LONGITUDE[ml_rows[[1L]]] <- 360.5
  expect_error(gridding(meta, btf_far, verbose = FALSE), regexp = "-360, 360")
  btf_lat <- btf
  btf_lat$LATITUDE[ml_rows[[1L]]] <- 90.5
  expect_error(gridding(meta, btf_lat, verbose = FALSE), regexp = "-90, 90")
})

test_that("gridding stops when the SL/ML cutoff cannot be computed", {
  # Only the ML study in meta: 0 studies for the cutoff. Used to put every row
  # in the single cell 732 and print OK.
  expect_error(
    gridding(meta[meta$STUDY_ID == ml_id, ], btf, verbose = FALSE),
    regexp = paste0("cannot be computed.*has 0 such studies.*", ml_id)
  )
  # One SL study in meta: sd() of one value is NA
  expect_error(
    gridding(
      meta[is.element(meta$STUDY_ID, c(sl_id, ml_id)), ],
      btf,
      verbose = FALSE
    ),
    regexp = paste0("has 1 such studies.*", ml_id)
  )
})

test_that("gridding with a cutoff that cannot be computed works for SL studies", {
  # An SL study needs no cutoff: NUMBER_LAT_LONG == 1 is enough
  res <- gridding(
    meta[meta$STUDY_ID == sl_id, ],
    btf[btf$STUDY_ID == sl_id, ],
    verbose = FALSE
  )
  expect_equal(unique(res$StudyMethod), "SL")
  expect_false(anyNA(res$cell))
})

test_that("gridding stops when the metadata needed to classify a study is missing", {
  for (column in c("NUMBER_LAT_LONG", "AREA_SQ_KM")) {
    meta_na <- meta
    meta_na[[column]][meta_na$STUDY_ID == ml_id] <- NA
    expect_error(
      gridding(meta_na, btf, verbose = FALSE),
      regexp = paste0("AREA_SQ_KM is missing.*STUDY_ID ", ml_id)
    )
  }
  # A missing area does not matter for a study with a single lat/long
  meta_na <- meta
  meta_na$AREA_SQ_KM[meta_na$STUDY_ID == sl_id] <- NA
  res <- gridding(meta_na, btf, verbose = FALSE)
  expect_equal(unique(res$StudyMethod[res$STUDY_ID == sl_id]), "SL")
})

test_that("gridding counts only studies with a value for the SL/ML limit", {
  # One valid SL study plus an SL study with a missing area: still 1 study
  other_sl <- meta[meta$STUDY_ID == sl_id, ]
  other_sl$STUDY_ID <- 99999L
  other_sl$AREA_SQ_KM <- NA
  expect_error(
    gridding(
      rbind(meta[is.element(meta$STUDY_ID, c(sl_id, ml_id)), ], other_sl),
      btf,
      verbose = FALSE
    ),
    regexp = paste0("has 1 such studies.*", ml_id)
  )
})

test_that("gridding does not classify or check studies with a single year", {
  # Study ml_id has one year: it is removed, so it needs no metadata
  first_year <- min(btf$YEAR[btf$STUDY_ID == ml_id])
  btf_one <- btf[btf$STUDY_ID != ml_id | btf$YEAR == first_year, ]
  meta_na <- meta
  meta_na$AREA_SQ_KM[meta_na$STUDY_ID == ml_id] <- NA
  meta_na$NUMBER_LAT_LONG[meta_na$STUDY_ID == ml_id] <- NA
  btf_one$LATITUDE[btf_one$STUDY_ID == ml_id] <- NA
  expect_warning(
    res <- gridding(meta_na, btf_one, verbose = FALSE),
    regexp = paste0("single year were removed.*", ml_id)
  )
  expect_false(is.element(ml_id, res$STUDY_ID))
  # With a single ML study left that has one year, the cutoff is not needed
  expect_warning(
    expect_error(
      gridding(
        meta[meta$STUDY_ID == ml_id, ],
        btf_one[btf_one$STUDY_ID == ml_id, ]
      ),
      regexp = "No rows left to grid"
    ),
    regexp = "single year"
  )
})

test_that("gridding ignores unclassifiable studies that are not in the data", {
  meta_na <- meta
  meta_na$AREA_SQ_KM[meta_na$STUDY_ID == ml_id] <- NA
  expect_no_error(
    gridding(meta_na, btf[btf$STUDY_ID != ml_id, ], verbose = FALSE)
  )
})

test_that("gridding with res_by_data stops when the cutoff cannot be computed", {
  expect_error(
    gridding(
      meta[meta$STUDY_ID == sl_id, ],
      btf[btf$STUDY_ID == sl_id, ],
      res_by_data = TRUE,
      verbose = FALSE
    ),
    regexp = "res_by_data = TRUE. needs a resolution"
  )
})

test_that("gridding prints no OK message and is silent for clean data", {
  expect_silent(gridding(meta, btf))
})

test_that("gridding res_by_data prints the resolution only when verbose", {
  expect_output(
    gridding(meta, btf, res_by_data = TRUE, verbose = TRUE),
    regexp = "Resolution: [0-9]+"
  )
  expect_silent(gridding(meta, btf, res_by_data = TRUE, verbose = FALSE))
})

test_that("gridding removes one-year studies and always names them", {
  first_year <- min(btf$YEAR[btf$STUDY_ID == sl_id])
  btf_one <- btf[btf$STUDY_ID != sl_id | btf$YEAR == first_year, ]
  for (verbose in c(TRUE, FALSE)) {
    expect_warning(
      res <- gridding(meta, btf_one, verbose = verbose),
      regexp = paste0("1 studies with a single year were removed.*", sl_id)
    )
    expect_false(is.element(sl_id, res$STUDY_ID))
    expect_equal(
      nrow(res),
      nrow(btf_one) - sum(btf_one$STUDY_ID == sl_id)
    )
  }
})

test_that("gridding stops when no study has at least 2 years", {
  first_year <- min(btf$YEAR[btf$STUDY_ID == sl_id])
  btf_sl <- btf[btf$STUDY_ID == sl_id & btf$YEAR == first_year, ]
  expect_error(
    suppressWarnings(gridding(meta, btf_sl, verbose = FALSE)),
    regexp = "No rows left to grid"
  )
})

test_that("gridding removes one-year studies when YEAR or STUDY_ID are factors", {
  first_year <- min(btf$YEAR[btf$STUDY_ID == sl_id])
  btf_one <- btf[btf$STUDY_ID != sl_id | btf$YEAR == first_year, ]
  expected <- suppressWarnings(gridding(meta, btf_one, verbose = FALSE))

  btf_year <- btf_one
  btf_year$YEAR <- factor(btf_year$YEAR)
  expect_warning(
    res_year <- gridding(meta, btf_year, verbose = FALSE),
    regexp = paste0("1 studies with a single year were removed.*", sl_id)
  )
  expect_equal(nrow(res_year), nrow(expected))
  expect_equal(res_year$cell, expected$cell)

  # Unused factor levels (a subset of the studies) must not give NA IDs
  meta_f <- meta
  meta_f$STUDY_ID <- factor(meta_f$STUDY_ID)
  btf_f <- btf_one[btf_one$STUDY_ID != ml_id, ]
  btf_f$STUDY_ID <- factor(btf_f$STUDY_ID, levels = levels(meta_f$STUDY_ID))
  expect_warning(
    res_f <- gridding(meta_f, btf_f, verbose = FALSE),
    regexp = paste0(
      "^1 studies with a single year were removed: STUDY_ID ",
      sl_id,
      "$"
    )
  )
})

test_that("gridding gives the same result for factor and integer STUDY_ID", {
  meta_f <- meta
  meta_f$STUDY_ID <- factor(meta_f$STUDY_ID)
  btf_f <- btf
  btf_f$STUDY_ID <- factor(btf_f$STUDY_ID, levels = levels(meta_f$STUDY_ID))
  res_f <- gridding(meta_f, btf_f, verbose = FALSE)
  expect_equal(res_f$cell, ref$cell)
  expect_equal(res_f$assemblageID, ref$assemblageID)
})

test_that("gridding accepts only an integer resolution between 0 and 30", {
  expect_error(gridding(meta, btf, res = 12.5), regexp = "integerish")
  expect_error(gridding(meta, btf, res = 31), regexp = "<= 30")
  expect_error(gridding(meta, btf, res = -1), regexp = ">= 0")
  expect_error(gridding(meta, btf, res = NA), regexp = "May not be NA")
  expect_no_error(gridding(meta, btf, res = 12L, verbose = FALSE))
})

test_that("gridding creates correct cell IDs", {
  checkmate::expect_double(
    x = gridding(meta, btf)$cell,
    any.missing = FALSE,
    lower = 0,
    null.ok = FALSE
  )
})

# Snapshots hold one line per study, not the data: the whole table was 4 MB, only
# its first rows were compared, and printing depended on options(digits).
summarise_cells <- function(gridded) {
  gridded |>
    dplyr::summarise(
      n_rows = dplyr::n(),
      n_cells = dplyr::n_distinct(cell),
      min_cell = format(min(cell), scientific = FALSE),
      max_cell = format(max(cell), scientific = FALSE),
      .by = c("STUDY_ID", "StudyMethod")
    ) |>
    dplyr::arrange(STUDY_ID) |>
    as.data.frame()
}

test_that("gridding produces consistent results", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(summarise_cells(gridding(meta, btf, verbose = FALSE)))
})

test_that("gridding respects provided res parameter", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(
    summarise_cells(gridding(meta, btf, res = 18, verbose = FALSE))
  )
})

test_that("gridding respects res_by_data argument", {
  skip_on_ci()
  skip_on_cran()

  expect_snapshot(
    summarise_cells(gridding(meta, btf, res_by_data = TRUE, verbose = FALSE))
  )
})

test_that("gridding assigns the cell of the centroid to SL and of the sample to ML", {
  # Expected cells computed directly with dggridR, not with gridding()
  dgg <- dggridR::dgconstruct(res = 12)
  seqnum <- function(lon, lat) {
    dggridR::dgGEO_to_SEQNUM(
      dggs = dgg,
      in_lon_deg = lon,
      in_lat_deg = lat
    )$seqnum
  }
  centroids <- meta[match(ref$STUDY_ID, meta$STUDY_ID), ]
  sl <- ref$StudyMethod == "SL"
  expect_gt(sum(sl), 0L)
  expect_gt(sum(!sl), 0L)
  expect_equal(
    ref$cell[sl],
    seqnum(centroids$CENT_LONG[sl], centroids$CENT_LAT[sl])
  )
  expect_equal(
    ref$cell[!sl],
    seqnum(ref$LONGITUDE[!sl], ref$LATITUDE[!sl])
  )
  expect_equal(ref$assemblageID, paste(ref$STUDY_ID, ref$cell, sep = "_"))
  # SL studies have a single cell, whatever their sample coordinates
  expect_true(all(
    tapply(ref$cell[sl], ref$STUDY_ID[sl], data.table::uniqueN) == 1L
  ))
})

test_that("gridding does not modify its inputs by reference", {
  meta_dt <- data.table::as.data.table(meta)
  btf_dt <- data.table::as.data.table(btf)
  meta_before <- data.table::copy(meta_dt)
  btf_before <- data.table::copy(btf_dt)
  gridding(meta_dt, btf_dt, verbose = FALSE)
  expect_equal(meta_dt, meta_before)
  expect_equal(btf_dt, btf_before)
  expect_equal(names(meta_dt), names(meta))
})

test_that("gridding deprecated resByData argument still works with a warning", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    gridding(meta = meta, x = btf, resByData = FALSE),
    regexp = "resByData.*is deprecated"
  )
})

test_that("gridding deprecated btf argument still works with a warning", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    gridding(meta = meta, btf = btf),
    regexp = "btf.*is deprecated"
  )
})

test_that("gridding stops when a deprecated argument and its replacement are both given", {
  withr::local_options(lifecycle_verbosity = "quiet")
  expect_error(
    gridding(meta = meta, x = btf, btf = btf[btf$STUDY_ID == sl_id, ]),
    regexp = "either `x` or the deprecated `btf`"
  )
  expect_error(
    gridding(meta = meta, x = btf, res_by_data = TRUE, resByData = FALSE),
    regexp = "either `res_by_data` or the deprecated `resByData`"
  )
})

# test_that("gridding correctly manages data.table objects", {
#   skip_on_ci()
#   skip_on_cran()

#   data.table::setDT(meta)
#   data.table::setDT(btf)

#   result <- gridding(meta, btf, res = 12, res_by_data = FALSE)
#   expect_snapshot(result)
# })
