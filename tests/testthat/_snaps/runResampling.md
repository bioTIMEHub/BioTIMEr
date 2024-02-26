# runResampling runs correctly for Abundance

    Code
      result <- runResampling(df = test_df, ab = "ABUNDANCE", resamps = 1L,
        conservative = FALSE)

# runResampling runs correctly for Biomass

    Code
      result <- runResampling(df = test_df, ab = "BIOMASS", resamps = 1L,
        conservative = FALSE)
    Condition
      Warning in `runResampling()`:
      NA values found and removed.
      Only a subset of `df` is used.

# runResampling runs correctly for Abundance and Biomass together

    Code
      result <- runResampling(df = test_df, ab = c("ABUNDANCE", "BIOMASS"), resamps = 1L,
      conservative = FALSE)
    Condition
      Warning in `runResampling()`:
      NA values found and removed.
      Only a subset of `df` is used.

# runResampling runs correctly for Abundance and Biomass together
          2 iterations, conservative

    Code
      result <- runResampling(df = test_df, ab = c("ABUNDANCE", "BIOMASS"), resamps = 2L,
      conservative = TRUE)
    Condition
      Warning in `runResampling()`:
      NA values found and whole samples removed since `conservative` is TRUE.
      Only a subset of `df` is used.

