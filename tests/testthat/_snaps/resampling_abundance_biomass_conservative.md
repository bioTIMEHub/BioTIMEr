# resampling runs correctly for Abundance and Biomass together 2 iterations, conservative

    Code
      suppressWarnings(result <- resampling(x = test_df, measure = c("ABUNDANCE",
        "BIOMASS"), resamps = 2L, conservative = TRUE))

