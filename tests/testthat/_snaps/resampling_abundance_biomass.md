# resampling runs correctly for Abundance and Biomass together

    Code
      result <- resampling(x = test_df, measure = c("ABUNDANCE", "BIOMASS"), resamps = 1L,
      conservative = FALSE)
    Condition
      Warning:
      NA values found and removed.
      Only a subset of `x` is used.

