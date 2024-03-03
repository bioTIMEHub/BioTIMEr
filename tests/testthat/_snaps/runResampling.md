# resampling runs correctly for Abundance

    Code
      result <- resampling(x = test_df, measure = "ABUNDANCE", resamps = 1L,
        conservative = FALSE)

# resampling runs correctly for Biomass

    Code
      result <- resampling(x = test_df, measure = "BIOMASS", resamps = 1L,
        conservative = FALSE)
    Condition
      Warning in `resampling()`:
      NA values found and removed.
      Only a subset of `x` is used.

# resampling runs correctly for Abundance and Biomass together

    Code
      result <- resampling(x = test_df, measure = c("ABUNDANCE", "BIOMASS"), resamps = 1L,
      conservative = FALSE)
    Condition
      Warning in `resampling()`:
      NA values found and removed.
      Only a subset of `x` is used.

# resampling runs correctly for Abundance and Biomass together
          2 iterations, conservative

    Code
      result <- resampling(x = test_df, measure = c("ABUNDANCE", "BIOMASS"), resamps = 2L,
      conservative = TRUE)
    Condition
      Warning in `resampling()`:
      NA values found and whole samples removed since `conservative` is TRUE.
      Only a subset of `x` is used.

