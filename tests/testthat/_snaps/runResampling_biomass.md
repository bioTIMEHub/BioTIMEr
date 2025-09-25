# resampling runs correctly for Biomass

    Code
      result <- resampling(x = test_df, measure = "BIOMASS", resamps = 1L,
        conservative = FALSE)
    Condition
      Warning:
      NA values found and removed.
      Only a subset of `x` is used.

