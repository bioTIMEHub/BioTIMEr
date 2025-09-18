# BioTIMEr 0.2.6

## Major Improvement

- methods: gridding and resampling functions now handle `data.frame`,
  `data.table` and `tibble` objects with dedicated functions.
- use of package dtplyr to call data.table in the background for better speed
and memory usage
- categorical variables are turned into factors

# BioTIMEr 0.2.5 - 01.10.2025

## New Features

- In the `resampling` function:

  - new argument `summarise`, TRUE by default keeps previous behaviour.

    If TRUE, the abundance and/or biomass is summed per rarefyID while if FALSE
    the abundance and/or biomass will be summed per rarefyID/SAMPLE_DESC and gives
    more columns.

## Minor Improvements and Bug Fixes

- In the `themeBioTIME` function:

  - argument `lp` is soft deprecated in favour of `legend.position`
  - argument `fontSize` is soft deprecated in favour of `font.size`
  - argument `colx` is soft deprecated in favour of `axis.colour`
  - argument `coly` is soft deprecated in favour of `strip.background`
  - the order of the arguments did not change.

- `data.table` objects are converted to `data.frame`

# BioTIMEr 0.2.4 - 06.06.2025

- Data update matching structure from BioTIME v2.0.

# BioTIMEr 0.2.3 - 31.07.2024

- Update of the vignette for clarity
- FIX of the Mac M1 specific issue happening in package dggridR
- FIX in `resampling()` to sample without replacement
- FIX in `getLinearRegressions()` to correct result dimensions and metric order

# BioTIMEr 0.2.2 - 03.04.2024

- Initial CRAN submission.
