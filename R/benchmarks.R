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
  # Aggregate
  x <- readRDS(file = "ignored/data/benchmarking/rarefysamples_aggregate.rds")
  selected_indices <- readRDS(
    file = "ignored/data/benchmarking/rarefysamples_aggregate_indices.rds"
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
      rarefysamples_ref(x, "BIOMASS", 2L)
    },
    new = {
      set.seed(42)
      rarefysamples(x, "BIOMASS", 2L, summarise = TRUE)
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
            rarefysamples(
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
        j = rarefysamples(.SD, measure, resamps, summarise),
        .SDcols = c("SAMPLE_DESC", "Species", "YEAR", measure),
        keyby = "assemblageID"
      ]
    }
  )
  #  expression  min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time
  # 1 lapply     3.58s  3.58s     0.280     731MB     6.71     1    24      3.58s
  # 2 data.table 3.16s  3.16s     0.317     178MB     5.70     1    18      3.16s

  ## rarefysamples 1 ----
  x <- readRDS("ignored/data/benchmarking/rarefysamples_lapply_datatable_1.rds")
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

  ## rarefysamples 2 ----
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
}
