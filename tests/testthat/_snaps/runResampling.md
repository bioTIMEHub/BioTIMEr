# resample runs correctly for Abundance

    Code
      result <- resample(df = test_df, ab = "ABUNDANCE", resamps = 1L, conservative = FALSE)

# resample runs correctly for Biomass

    Code
      result <- resample(df = test_df, ab = "BIOMASS", resamps = 1L, conservative = FALSE)
    Condition
      Warning in `resample()`:
      NA values found and removed.
      Only a subset of `df` is used.

# resample runs correctly for Abundance and Biomass together

    Code
      result <- resample(df = test_df, ab = c("ABUNDANCE", "BIOMASS"), resamps = 1L,
      conservative = FALSE)
    Condition
      Warning in `resample()`:
      NA values found and removed.
      Only a subset of `df` is used.

# resample runs correctly for Abundance and Biomass together
          2 iterations, conservative

    Code
      result <- resample(df = test_df, ab = c("ABUNDANCE", "BIOMASS"), resamps = 2L,
      conservative = TRUE)
    Condition
      Warning in `resample()`:
      NA values found and whole samples removed since `conservative` is TRUE.
      Only a subset of `df` is used.

