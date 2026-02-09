# Benchmarking.
if (FALSE) {
  # counting one year studies
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

  # resampling_core 1 ----
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

  # resampling_core 2 ----
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
  # resampling_core 3
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
  # Aggregate
  x <- readRDS(file = "ignored/data/benchmarking/resampling_core_aggregate.rds")
  selected_indices <- readRDS(
    file = "ignored/data/benchmarking/resampling_core_aggregate_indices.rds"
  )
  # Formula is 10% slower but more readable. Does not work directly when length(measure) > 1
  bench::mark(
    relative = TRUE,
    check = FALSE,
    classic = stats::aggregate(
      x = x[selected_indices, c("BIOMASS", "ABUNDANCE")],
      by = list(
        SAMPLE_DESC = x$SAMPLE_DESC[selected_indices],
        YEAR = x$YEAR[selected_indices],
        Species = x$Species[selected_indices]
      ),
      FUN = sum
    ),
    formula = stats::aggregate(
      data = x[selected_indices, ],
      x = BIOMASS + ABUNDANCE ~ SAMPLE_DESC + YEAR + Species,
      FUN = sum
    )
  )

  # changing how columns are dealt with in rarefy, adding the summarise argument
  source(file = "R/rarefyBioTIME.R")
  source(file = "R/rarefyBioTIME_reference.R")
  x <- gridding(BTsubset_meta, BTsubset_data)

  bench::mark(
    relative = TRUE,
    original = {
      set.seed(42)
      resampling_core_ref(x, "BIOMASS", 2L)
    },
    new = {
      set.seed(42)
      resampling_core(x, "BIOMASS", 2L, summarise = TRUE)
    },
    check = FALSE
  )

  # Benchmarking tapply vs data.table
  bt <- readRDS("data/benchmarking/tapply_vs_data.table.rds")
  bench::mark(
    relative = TRUE,
    tapply = {
      tapply(bt$YEAR, bt$STUDY_ID, function(y) dplyr::n_distinct(y) == 1L) |>
        any()
    },
    dt_chain = {
      bt[j = data.table::uniqueN(YEAR) == 1L, keyby = STUDY_ID][j = any(V1)]
    },
  )
  rm("bt")

  # Benchmarking BioTIMEr vs dtplyr BioTIMEr
  library(BioTIMEr)
  microbenchmark::microbenchmark(
    times = 10,
    ref = {
      gridding_reference(BTsubset_meta, BTsubset_data, 12, verbose = FALSE)
    },
    new = {
      gridding(BTsubset_meta, BTsubset_data, 12, verbose = FALSE)
    }
  )

  bench::mark(
    check = FALSE,
    ref = {
      x = gridding_reference(BTsubset_meta, BTsubset_data, 12, verbose = FALSE)
    },
    new = {
      y = gridding(BTsubset_meta, BTsubset_data, 12, verbose = FALSE)
    }
  )

  library(BioTIMEr)
  microbenchmark::microbenchmark(
    times = 20,
    ref = {
      resampling_ref(x, measure = "BIOMASS")
    },
    new = {
      resampling(y, measure = "BIOMASS")
    }
  )

  bench::mark(
    check = FALSE,
    ref = {
      set.seed(42)
      resampling_ref(x, measure = "BIOMASS")
    },
    new = {
      set.seed(42)
      resampling(y, measure = "BIOMASS", summarise = TRUE)
    }
  )

  # massive wins of base R versus dplyr
  meta <- BTsubset_meta
  bench::mark(
    check = FALSE,
    meta <- meta |>
      dplyr::mutate(
        StudyMethod = dplyr::if_else(.data$NUMBER_LAT_LONG == 1, "SL", NA)
      ),
    meta$StudyMethod <- data.table::fifelse(
      test = meta$NUMBER_LAT_LONG == 1L,
      yes = "SL",
      no = NA_character_
    )
  )
  # expression                  min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 "meta <- dplyr::mu   409.38µs 453.89µs     2015.    8.81KB     8.33   968     4    480.3ms
  # 2 "meta$StudyMethod      3.53µs   3.94µs   243238.      544B     0    10000     0     41.1ms

  meta <- readRDS(file = "ignored/data/benchmarking/sum_mean_sd.rds")
  bench::mark(
    check = FALSE,
    SL_extent <- meta |>
      dplyr::filter(.data$StudyMethod == "SL" & .data$AREA_SQ_KM <= 500) |>
      dplyr::summarise(
        sum(
          mean(.data$AREA_SQ_KM, na.rm = TRUE),
          stats::sd(.data$AREA_SQ_KM, na.rm = TRUE)
        )
      ) |>
      dplyr::pull(),
    {
      AREA_SQ_KM <- meta[
        meta$StudyMethod == "SL" & meta$AREA_SQ_KM <= 500,
        "AREA_SQ_KM"
      ]
      SL_extent <- sum(
        mean(AREA_SQ_KM, na.rm = TRUE),
        stats::sd(AREA_SQ_KM, na.rm = TRUE)
      )
    }
  )
  # # A tibble: 2 × 13
  #   expression                                       min median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 "SL_extent <- dplyr::pull(dplyr::summarise(… 982.9µs  1.1ms      844.    10.6KB     6.27   404     3      479ms
  # 2 "{ AREA_SQ_KM <- meta[meta$StudyMethod == \…  11.2µs 12.1µs    78842.      272B     7.88  9999     1      127ms

  # Row filtering ----
  # Win for dplyr. comparable speed, less ram
  bench::mark(
    check = FALSE,
    bt <- bt |>
      dplyr::filter(
        !is.element(STUDY_ID, names(one_year_study)[which(one_year_study)])
      ),
    bt <- bt[
      !is.element(bt$STUDY_ID, names(one_year_study)[one_year_study]),
    ]
  )
  #    expression                  min median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 bt <- dplyr::filter(bt,…  7.55ms 8.19ms      113.    17.8MB     44.3    23     9      203ms
  # 2 bt <- bt[!is.element(bt… 5.57ms 6.84ms      147.    29.2MB    133.     21    19      143ms

  # tidyr::separate vs data.table::tstrsplit (by reference)
  TSrf <- readRDS("ignored/data/benchmarking/rarefy_separate_tstrsplit.rds")
  bench::mark(
    check = FALSE,
    x <- data.table::rbindlist(TSrf, idcol = "rfID") |>
      tidyr::separate(
        col = "rfID",
        into = c("STUDY_ID", "cell"),
        sep = "_",
        remove = FALSE
      ),
    {
      x <- data.table::rbindlist(TSrf, idcol = "rfID")
      x[j = c("STUDY_ID", "cell") := data.table::tstrsplit(rfID, split = "_")]
    }
  )
  #   expression                  min median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 "x <- tidyr::separate(d… 7.47ms 7.91ms      126.    16.2MB    89.9     21    15      167ms
  # 2 "{ x <- data.table::rbi…  1.2ms 1.23ms      795.   222.9KB     4.12   386     2      486ms

  # semi_join versus data.table antijoin
  x = readRDS("ignored/data/benchmarking/rarefy_semi_join_datatable.rds")
  measure = c("BIOMASS", "ABUNDANCE")
  bench::mark(
    check = FALSE,
    x |>
      dplyr::semi_join(
        y = x |>
          dplyr::summarise(
            dplyr::across(dplyr::all_of(measure), .fns = anyNA),
            .by = "SAMPLE_DESC"
          ) |>
          dplyr::filter(rowSums(dplyr::pick(dplyr::all_of(measure))) == 0L),
        by = "SAMPLE_DESC"
      ),

    x[
      i = x[j = anyNA(.SD), .SDcols = measure, by = "SAMPLE_DESC"][!(V1)],
      on = "SAMPLE_DESC"
    ]
  )
  #   expression                 min  median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 "dplyr::semi_join(x, …  25.5ms  26.3ms     24.2     19.1MB     7.45    13     4      537ms
  # 2 "x[i = x[j = anyNA(.S… 128.1ms 128.8ms      7.57   128.1MB    18.9      4    10      528ms

  # lapply vs data.table keyby ----
  ## resampling ----
  x = readRDS("ignored/data/benchmarking/rarefy_lapply_datatable.rds")
  bench::mark(
    check = FALSE,
    lapply = {
      rfIDs <- unique(x$assemblageID)
      TSrf <- lapply(
        X = rfIDs,
        FUN = function(i) {
          x[x$assemblageID == i, ] |>
            resampling_core(
              measure = measure,
              resamps = resamps,
              summarise = summarise
            )
        }
      )
      names(TSrf) <- rfIDs
      TSrf <- data.table::rbindlist(TSrf, idcol = "rfID")
    },
    data.table = {
      TSrf <- x[
        j = resampling_core(.SD, measure, resamps, summarise),
        .SDcols = c("SAMPLE_DESC", "Species", "YEAR", measure),
        keyby = "assemblageID"
      ]
    }
  )
  #  expression  min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 lapply     3.58s  3.58s     0.280     731MB     6.71     1    24      3.58s
  # 2 data.table 3.16s  3.16s     0.317     178MB     5.70     1    18      3.16s

  ## resampling_core 1 ----
  x <- readRDS(
    "ignored/data/benchmarking/resampling_core_lapply_datatable_1.rds"
  )
  bench::mark(
    check = FALSE,
    lapply = {
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
        unlist()
    }, # end of loop on years
    data.table = {
      selected_indices <- x[
        j = .(
          sel = sample(
            x = unique(SAMPLE_DESC),
            size = unique(minsample),
            replace = FALSE
          )
        ),
        keyby = c("assemblageID", "YEAR")
      ]$sel
    }
  )
  #     expression    min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 lapply      121.9ms  126.1ms      5.22  223.47MB    13.9      3     8      575ms
  # 2 data.table   20.6ms   21.2ms     43.0     8.96MB     7.82    22     4      511ms

  ## resampling_core 2 ----
  bench::mark(
    check = FALSE,
    dplyr = x |>
      dplyr::filter(SAMPLE_DESC %in% selected_indices) |>
      dplyr::summarise(
        dplyr::across(.cols = dplyr::all_of(measure), .fns = sum),
        .by = c("YEAR", "Species")
      ),
    data.table = x[
      i = is.element(SAMPLE_DESC, selected_indices),
      j = lapply(X = .SD, FUN = sum),
      .SDcols = measure,
      by = c("YEAR", "Species")
    ]
  )
  #     expression    min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 dplyr       21.46ms  22.34ms      45.1      12MB     7.51    18     3      399ms
  # 2 data.table   4.15ms   4.94ms     197.      4.1MB    11.6     85     5      431ms

  # dommc
  x <- data.frame(
    YEAR = rep(rep(2010:2015, times = 10), times = 100),
    matrix(data = rpois(1000, 10), ncol = 4)
  )
  lx <- tidyr::pivot_longer(x, cols = -YEAR)

  x$YEAR <- NULL
  y <- as.data.frame(t(x))

  bench::mark(
    check = FALSE,
    ref = apply(x, 1, function(s) {
      y <- sort(s, decreasing = TRUE)
      (y[[1L]] + y[[2L]]) / sum(y)
    }),

    head = apply(x, 1, function(s) {
      y <- sort(s, decreasing = TRUE)
      sum(head(y, 2)) / sum(y)
    }),
    vec = apply(x, 1, function(s) {
      y <- sort(s, decreasing = TRUE)
      sum(y[c(1L, 2L)]) / sum(y)
    }),
    liner = apply(x, 1, function(s) {
      sum(sort(s, decreasing = TRUE)[1L:2L]) / sum(s)
    }),
    transposed = sapply(
      y,
      function(s) sum(sort(s, decreasing = TRUE)[1L:2L]),
      USE.NAMES = FALSE,
      simplify = TRUE
    ) /
      colSums(y),
    sep = {
      sums <- rowSums(x)
      maxs <- apply(x, 1, function(s) {
        y <- sort(s, decreasing = TRUE)
        y[[1L]] + y[[2L]]
      })
      maxs / sums
    },
    sep2 = apply(x, 1, function(s) {
      y <- sort(s, decreasing = TRUE)
      y[[1L]] + y[[2L]]
    }) /
      rowSums(x),
    longBase = tapply(lx$value, lx$YEAR, function(s) {
      y <- sort(s, decreasing = TRUE)
      (y[[1L]] + y[[2L]]) / sum(y)
    }),
    longSep = {
      rowsum(lx$value, lx$YEAR)
    }
  )

  # getAlphaMetrics on site by species matrices (with a pivot_wider on each
  # community) vs. keeping the long format
  # SHA f11f35ae054b212ac3188e5d86ef99e5a521e3a4
  y = gridding(BTsubset_meta, BTsubset_data) |>
    resampling(measure = "BIOMASS", resamps = 2)

  bench::mark(
    check = FALSE,
    ref = {
      y |>
        dplyr::reframe(
          getAlphaMetrics_reference(
            x = pick(assemblageID, YEAR, Species, BIOMASS),
            measure = "BIOMASS"
          ),
          .by = resamp
        )
    },
    wide = y |> getAlphaMetrics(measure = "BIOMASS"),
    long = y |> getAlphaMetrics_long(measure = "BIOMASS")
  )

  #   expression      min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 ref         324.9ms  410.1ms      2.44    9.38MB     6.10     2     5      820ms
  # 2 wide        293.8ms  296.2ms      3.38    8.32MB     8.44     2     5      592ms
  # 3 long         51.3ms   52.9ms     18.6     1.91MB     7.43    10     4      538ms

  # Benchmarking the function parsing SAMPLE_DESC based on _SAMPLE_DESC_NAME
  v1dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> as.data.frame())
    for (i in seq_len(NROW(dt))) {
      colnames(codes[[i]]) <- names[[i]]
    }

    data.table::rbindlist(codes, fill = TRUE)
  }
  v1dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> as.data.frame())
    for (i in seq_len(NROW(dt))) {
      colnames(codes[[i]]) <- names[[i]]
    }

    dplyr::bind_rows(codes)
  }

  v2dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    for (i in seq_along(codes)) {
      names(codes[[i]]) = names[[i]]
      codes[[i]] <- codes[[i]] |> t() |> data.frame()
    }
    data.table::rbindlist(codes, fill = TRUE)
  }
  v2dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    for (i in seq_along(codes)) {
      names(codes[[i]]) = names[[i]]
    }
    dplyr::bind_rows(codes)
  }
  v3dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> as.data.frame())
    for (i in seq_along(dt)) {
      colnames(codes[[i]]) <- names[[i]]
    }

    data.table::rbindlist(codes, fill = TRUE)
  }
  v3dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> as.data.frame())
    for (i in seq_along(dt)) {
      colnames(codes[[i]]) <- names[[i]]
    }

    dplyr::bind_rows(codes)
  }

  v4dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)
    lapply(seq_along(codes), function(i) {
      codes[[i]] |> t() |> as.data.frame() |> stats::setNames(nm = names[[i]])
    }) |>
      data.table::rbindlist(fill = TRUE)
  }
  v4dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    lapply(seq_along(codes), function(i) {
      codes[[i]] |> t() |> as.data.frame() |> stats::setNames(nm = names[[i]])
    }) |>
      dplyr::bind_rows()
  }

  v5dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> data.table::as.data.table())
    lapply(seq_along(codes), function(i) {
      data.table::setnames(codes[[i]], new = names[[i]])
    })

    data.table::rbindlist(codes, fill = TRUE)
  }
  v5dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> data.table::as.data.table())
    lapply(seq_along(codes), function(i) {
      data.table::setnames(codes[[i]], new = names[[i]])
    })

    dplyr::bind_rows(codes)
  }

  v6dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> data.table::as.data.table())
    for (i in seq_along(codes)) {
      data.table::setnames(codes[[i]], new = names[[i]])
    }

    data.table::rbindlist(codes, fill = TRUE)
  }
  v6dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) x |> t() |> data.table::as.data.table())
    for (i in seq_along(codes)) {
      data.table::setnames(codes[[i]], new = names[[i]])
    }

    dplyr::bind_rows(codes)
  }

  v7dt <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) as.data.frame(matrix(x, nrow = 1)))
    for (i in seq_along(codes)) {
      data.table::setnames(codes[[i]], new = names[[i]])
    }

    data.table::rbindlist(codes, fill = TRUE)
  }

  v7dp <- function(code, name) {
    codes <- stringi::stri_split_fixed(code, pattern = "_", simplify = FALSE)
    names <- stringi::stri_split_fixed(name, pattern = "_", simplify = FALSE)

    codes <- lapply(codes, function(x) as.data.frame(matrix(x, nrow = 1)))
    for (i in seq_along(codes)) {
      data.table::setnames(codes[[i]], new = names[[i]])
    }

    dplyr::bind_rows(codes)
  }

  # Benchmarking
  ## Conversion
  codes <- stringi::stri_split_fixed(dt$code, pattern = "_", simplify = FALSE)
  bench::mark(
    lapply(codes, function(x) as.data.frame(matrix(x, nrow = 1))),
    lapply(codes, function(x) x |> t() |> data.table::as.data.table()),
    lapply(seq_along(codes), function(i) {
      codes[[i]] |> t() |> as.data.frame() |> stats::setNames(nm = names[[i]])
    })
  )
  ## Total
  res <- lapply(2:5, function(i) {
    times <- 10^i
    dt <- data.frame(
      code = rep(
        c(
          "T1_23.1212_56.2346_1995_12_30",
          "786_-60.4567_0.346_2027"
        ),
        each = times
      ),
      name = rep(
        c("transect_lon_lat_year_month_day", "depth_lat_lon_year"),
        each = times
      )
    )

    bench::mark(
      check = FALSE,
      v1dp = v1dp(dt$code, dt$name),
      v1dt = v1dt(dt$code, dt$name),
      v2dp = v2dp(dt$code, dt$name),
      v2dt = v2dt(dt$code, dt$name),
      v3dp = v3dp(dt$code, dt$name),
      v3dt = v3dt(dt$code, dt$name),
      v4dp = v4dp(dt$code, dt$name),
      v4dt = v4dt(dt$code, dt$name),
      v5dt = v5dt(dt$code, dt$name),
      v5dp = v5dp(dt$code, dt$name),
      v6dt = v6dt(dt$code, dt$name),
      v6dp = v6dp(dt$code, dt$name),
      v7dt = v7dt(dt$code, dt$name),
      v7dp = v7dp(dt$code, dt$name)
    )
  }) |>
    dplyr::bind_rows(.id = "times") |>
    dplyr::mutate(
      # times = as.ordered(10^times),
      expression = as.factor(as.character(expression)),
      score = as.numeric(median) * as.numeric(mem_alloc)
    )
  res <- res |>
    dplyr::arrange(score, .by = times)

  res |>
    dplyr::summarise(
      score = mean(score),
      median = mean(median),
      mem_alloc = mean(mem_alloc),
      .by = expression
    ) |>
    dplyr::arrange(score)

  library(ggplot2)
  res |>
    dplyr::filter(!grepl("v5|v6", expression, perl = TRUE)) |>
    ggplot(aes(x = times, y = score, group = expression)) +
    scale_y_log10() +
    geom_line(aes(col = expression, shape = expression))

  #   times  expression        min   median `itr/sec` mem_alloc
  #  1 1     v4dt(dt$cod…   2.18ms   2.21ms  445.       40.27KB
  #  2 1     v2dp(dt$cod…   1.76ms   1.83ms  537.       72.94KB
  #  3 1     v4dp(dt$cod…   3.09ms   3.16ms  310.       43.41KB
  #  4 1     v3dt(dt$cod…   2.02ms   2.08ms  471.       95.84KB
  #  5 1     v1dt(dt$cod…   2.03ms   2.11ms  462.       104.1KB
  #  6 1     v3dp(dt$cod…   3.33ms   3.46ms  285.      130.29KB
  #  7 1     v1dp(dt$cod…    3.3ms    3.5ms  284.      129.04KB
  #  8 1     v2dt(dt$cod…   5.99ms   6.32ms  158.       83.83KB
  #  9 2     v4dt(dt$cod…  22.25ms  22.99ms   43.6      251.2KB
  # 10 2     v2dp(dt$cod…  16.61ms  16.98ms   58.7     400.39KB
  # 11 2     v3dt(dt$cod…  20.04ms  20.29ms   48.9      368.7KB
  # 12 2     v1dt(dt$cod…  20.13ms  20.45ms   48.9      368.7KB
  # 13 2     v4dp(dt$cod…  32.35ms  33.04ms   30.2     416.06KB
  # 14 2     v2dt(dt$cod…  60.52ms  60.73ms   16.4     235.53KB
  # 15 1     v5dt(dt$cod…   8.06ms   8.34ms  119.         3.2MB
  # 16 1     v6dt(dt$cod…   8.23ms   8.58ms  116.        3.24MB
  # 17 2     v1dp(dt$cod…  33.37ms  34.43ms   29.0     850.02KB
  # 18 2     v3dp(dt$cod…  33.93ms   35.4ms   28.3     853.26KB
  # 19 1     v6dp(dt$cod…  25.43ms  25.82ms   38.7       9.55MB
  # 20 1     v5dp(dt$cod…  25.25ms  27.23ms   35.0       9.52MB
  # 21 3     v4dt(dt$cod… 418.02ms 423.18ms    2.36      2.31MB
  # 22 3     v2dp(dt$cod…  220.4ms 255.22ms    3.92      3.89MB
  # 23 3     v1dt(dt$cod… 255.21ms 298.25ms    3.35      3.45MB
  # 24 3     v3dt(dt$cod… 281.29ms 304.68ms    3.28      3.45MB
  # 25 3     v2dt(dt$cod… 893.54ms 893.54ms    1.12      2.15MB
  # 26 2     v6dt(dt$cod…  84.89ms  85.37ms   11.6      31.83MB
  # 27 2     v5dt(dt$cod…  84.23ms  87.12ms   11.4      31.85MB
  # 28 3     v4dp(dt$cod…  855.9ms  855.9ms    1.17      4.05MB
  # 29 3     v3dp(dt$cod… 507.71ms 507.71ms    1.97      8.32MB
  # 30 3     v1dp(dt$cod… 540.89ms 540.89ms    1.85      8.31MB
  # 31 2     v6dp(dt$cod… 265.17ms 265.17ms    3.77     95.25MB
  # 32 2     v5dp(dt$cod… 277.68ms 277.68ms    3.60     95.27MB
  # 33 4     v1dt(dt$cod…    3.07s    3.07s    0.325    34.35MB
  # 34 4     v4dt(dt$cod…    4.12s    4.12s    0.243    27.99MB
  # 35 4     v3dt(dt$cod…    4.42s    4.42s    0.226    34.35MB
  # 36 4     v4dp(dt$cod…    3.96s    3.96s    0.252    40.44MB
  # 37 4     v2dt(dt$cod…    7.51s    7.51s    0.133    21.38MB
  # 38 4     v2dp(dt$cod…    4.48s    4.48s    0.223    38.91MB
  # 39 3     v5dt(dt$cod…    1.27s    1.27s    0.786   318.31MB
  # 40 3     v6dt(dt$cod…    1.37s    1.37s    0.728   318.16MB
  # 41 4     v1dp(dt$cod…    7.08s    7.08s    0.141    83.16MB
  # 42 4     v3dp(dt$cod…    7.92s    7.92s    0.126    83.16MB
  # 43 3     v5dp(dt$cod…    4.02s    4.02s    0.249   952.82MB
  # 44 3     v6dp(dt$cod…    4.52s    4.52s    0.221   952.67MB
  # 45 4     v6dt(dt$cod…   13.87s   13.87s    0.0721    3.11GB
  # 46 4     v5dt(dt$cod…   16.43s   16.43s    0.0609    3.11GB
  # 47 4     v6dp(dt$cod…   33.24s   33.24s    0.0301     9.3GB
  # 48 4     v5dp(dt$cod…   35.25s   35.25s    0.0284     9.3GB

  subset_SAMPLE_DESC <- dplyr::left_join(
    BTsubset_meta |> dplyr::select(STUDY_ID, SAMPLE_DESC_NAME),
    BTsubset_data |>
      dplyr::distinct(STUDY_ID, SAMPLE_DESC),
    dplyr::join_by(STUDY_ID)
  )

  initial_time <- Sys.time()
  parser_BioTIME(
    subset_SAMPLE_DESC$SAMPLE_DESC,
    subset_SAMPLE_DESC$SAMPLE_DESC_NAME,
    "_"
  )
  Sys.time() - initial_time
}
