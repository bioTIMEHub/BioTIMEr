# Benchmarking.
if (FALSE) {
  bench::mark(
    tapply = tapply(x$YEAR, x$STUDY_ID, function(y) length(unique(y)) == 1L) |>
      any(),
    distinct = tapply(x$YEAR, x$STUDY_ID, function(y) {
      dplyr::n_distinct(y) == 1L
    }) |>
      any(),
    anydistinct = tapply(x$YEAR, x$STUDY_ID, function(y) {
      dplyr::n_distinct(y) == 1L |> any()
    }) |>
      any(),
    dplyr = dplyr::summarise(
      x,
      t = dplyr::n_distinct(YEAR) == 1L,
      .by = STUDY_ID
    ) |>
      dplyr::select(t) |>
      any(),
    .data = dplyr::summarise(
      # .data slows down the code by at least 2x in this example
      x,
      t = dplyr::n_distinct(.data$YEAR) == 1L,
      .by = .data$STUDY_ID
    ) |>
      dplyr::select(t) |>
      any(),
    aggregate = stats::aggregate(x$YEAR, by = list(x$STUDY_ID), function(y) {
      length(unique(y)) == 1L
    })$x |>
      any()
  )

  # rarefysamples 1 ----
  bench::mark(
    lapply = {
      set.seed(42)
      lapply(
        # beginning sub loop on years
        X = unique(x$YEAR),
        FUN = function(y) {
          sam <- unique(x$SAMPLE_DESC[x$YEAR == y]) |>
            sample(minsample, replace = FALSE)
          return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
        }
      ) |>
        unlist()
    },
    lapply2 = {
      set.seed(42)
      lapply(
        # beginning sub loop on years
        X = unique(x$YEAR),
        FUN = function(y) {
          sam <- x$SAMPLE_DESC[x$YEAR == y] |>
            unique() |>
            sample(minsample, replace = FALSE)
          return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
        }
      ) |>
        unlist()
    },
    sapply = {
      set.seed(42)
      sapply(
        # beginning sub loop on years
        X = unique(x$YEAR),
        FUN = function(y) {
          sam <- unique(x$SAMPLE_DESC[x$YEAR == y]) |>
            sample(minsample, replace = FALSE)
          return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
        },
        simplify = TRUE,
        USE.NAMES = FALSE
      ) |>
        unlist()
    },
    map = {
      set.seed(42)
      purrr::map(
        .x = unique(x$YEAR),
        .f = function(y) {
          sam <- unique(x$SAMPLE_DESC[x$YEAR == y]) |>
            sample(minsample, replace = FALSE)
          return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
        }
      ) |>
        unlist()
    },
    relative = TRUE
  )

  # rarefysamples 2 ----
  microbenchmark::microbenchmark(
    # bench::mark(
    # relative = TRUE,
    original = {
      tYear <- x[selected_indices, "YEAR"]
      tSpecies <- x[selected_indices, "Species"]
      tcurrency <- x[selected_indices, measure, drop = FALSE]

      stats::aggregate(
        x = tcurrency,
        by = list(YEAR = tYear, Species = tSpecies),
        FUN = sum
      )
    },
    base1 = stats::aggregate(
      x = x[selected_indices, measure],
      by = list(
        YEAR = x$YEAR[selected_indices],
        Species = x$Species[selected_indices]
      ),
      FUN = sum
    ),
    dplyr1 = dplyr::slice(x, selected_indices) |>
      dplyr::summarise(
        x = sum(.data[[measure]]),
        .by = c(YEAR, Species)
      ),
    dplyr.data = dplyr::slice(x, selected_indices) |> # .data slows down things again...
      dplyr::summarise(
        x = sum(.data[[measure]]),
        .by = c(.data$YEAR, .data$Species)
      )
  )
  # rarefysamples 3
  microbenchmark::microbenchmark(
    original = {
      set.seed(42)
      rareftab_list <- lapply(
        # beginning loop on repetitions
        X = seq_len(resamps),
        FUN = function(i) {
          selected_indices <- lapply(
            # beginning sub loop on years
            X = unique(x$YEAR),
            FUN = function(y) {
              sam <- x$SAMPLE_DESC[x$YEAR == y] |>
                unique() |>
                sample(minsample, replace = FALSE)
              return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
            }
          ) |>
            unlist() # end of loop on years

          raref <- stats::aggregate(
            x = x[selected_indices, measure],
            by = list(
              YEAR = x$YEAR[selected_indices],
              Species = x$Species[selected_indices]
            ),
            FUN = sum
          )
          raref$resamp <- i
          return(raref)
        }
      ) # end of loop on repetitions
      dplyr::bind_rows(rareftab_list)
    },
    idcol = {
      set.seed(42)
      rareftab_list <- lapply(
        # beginning loop on repetitions
        X = seq_len(resamps),
        FUN = function(i) {
          selected_indices <- lapply(
            # beginning sub loop on years
            X = unique(x$YEAR),
            FUN = function(y) {
              sam <- x$SAMPLE_DESC[x$YEAR == y] |>
                unique() |>
                sample(minsample, replace = FALSE)
              return(which(x$SAMPLE_DESC %in% sam & x$YEAR == y))
            }
          ) |>
            unlist() # end of loop on years

          return(stats::aggregate(
            x = x[selected_indices, measure],
            by = list(
              YEAR = x$YEAR[selected_indices],
              Species = x$Species[selected_indices]
            ),
            FUN = sum
          ))
        }
      ) # end of loop on repetitions
      dplyr::bind_rows(rareftab_list, .id = "resamp")
    }
  )
}
