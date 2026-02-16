# Testing parser_BioTIME
test_that("Parser works as expected", code = {
    dt <- data.frame(
        code = rep(
            c(
                "T1_23.1212_56.2346_1995_12_30",
                "786_-60.4567_0.346_2027"
            ),
            each = 10L
        ),
        name = rep(
            c("transect_lon_lat_year_month_day", "depth_lat_lon_year"),
            each = 10L
        )
    )

    checkmate::expect_data_frame(
        x = parseBioTIME(dt$code, dt$name, "_"),
        types = "character",
        any.missing = TRUE,
        all.missing = FALSE,
        nrows = 20L,
        ncols = 7L,
        col.names = "named"
    )
})

test_that("Parser errors on NA values", code = {
    dt <- data.frame(
        code = rep(
            c(
                "T1_23.1212_56.2346_1995_12_30",
                "786_-60.4567_0.346_2027",
                NA
            ),
            each = 10L
        ),
        name = rep(
            c("transect_lon_lat_year_month_day", "depth_lat_lon_year", NA),
            each = 10L
        )
    )

    expect_error(parseBioTIME(dt$code, dt$name, "_"))
})

test_that("Parser handles codes and names that do not match", code = {
    # extra element in x
    dt_extra_x <- data.frame(
        code = rep(
            c(
                "T1_23.1212_56.2346_1995_12_30",
                "786_-60.4567_0.346_2027"
            ),
            each = 10L
        ),
        name = rep(
            c("transect_lon_lat_year_month_day", "depth_lat_lon"), # missing year
            each = 10L
        )
    )

    expect_warning(
        parseBioTIME(dt_extra_x$code, dt_extra_x$name, "_"),
        "Unmatched valus between x and format, inspect `error_x` and `error_format` columns."
    )

    checkmate::expect_data_frame(
        x = suppressWarnings(
            parseBioTIME(dt_extra_x$code, dt_extra_x$name, "_")
        ),
        types = "character",
        any.missing = TRUE,
        all.missing = FALSE,
        nrows = 20L,
        ncols = 7L + 1L,
        col.names = NULL
    )

    # extra element in format
    dt_extra_format <- data.frame(
        code = rep(
            c(
                "T1_23.1212_56.2346_1995_12_30",
                "786_-60.4567_0.346_2027"
            ),
            each = 10L
        ),
        name = rep(
            c("transect_lon_lat_year_month_day", "depth_lat_lon_year_extra"), # extra element
            each = 10L
        )
    )

    expect_warning(
        parseBioTIME(dt_extra_format$code, dt_extra_format$name, "_"),
        "Unmatched valus between x and format, inspect `error_x` and `error_format` columns."
    )

    checkmate::expect_data_frame(
        x = suppressWarnings(
            parseBioTIME(
                dt_extra_format$code,
                dt_extra_format$name,
                "_"
            )
        ),

        types = "character",
        any.missing = TRUE,
        all.missing = FALSE,
        nrows = 20L,
        ncols = 7L + 1L,
        col.names = NULL
    )
})

test_that("simplify_SAMPLE_DESC works as expected", {
    x <- c("T1_23.1212_56.2346_1995_12_30", "786_-60.4567_0.346_2027")
    format <- c("transect_lon_lat_year_month_day", "depth_lat_lon_year")
    exclude <- c("YEAR", "year", "month", "day")
    sep = "_"

    expect_equal(
        simplify_SAMPLE_DESC(x, format, "_", "year"),
        c("T1_23.1212_56.2346_12_30", "786_-60.4567_0.346")
    )
})
