# BioTIMEr 0.3.0 - 15.10.2025

## Major Improvement

- The package now uses `data.table` in the background for major speed
  and memory usage improvements. Resampling the whole BioTIME database used to
  take > 1 hour and now takes < 1 minute.
- methods: gridding and resampling functions now handle `data.frame`,
  `data.table` and `tibble` objects with dedicated functions.

## New Features

- In the `resampling` function:

  - new argument `summarise`, TRUE by default keeps previous behaviour.

    If TRUE, the abundance and/or biomass is summed per rarefyID while if FALSE
    the abundance and/or biomass will be summed per rarefyID/SAMPLE_DESC and gives
    more columns.

- In the getAlphaMetrics function:

 - `data.frames` containing several resamplings are accepted

   If the provided data contain several resamplings, metrics will be computed
   per resampling, per assemblageID, per year.

- In the getLinearRegressions function:

  - removed the `divType` argument.

    The function now reads the class of the objects produced by `getAlphaMetrics`
    and `getBetaMetrics` and computes the expected metrics.

## Minor Improvements and Bug Fixes

- In the `themeBioTIME` function:

  - argument `lp` is soft deprecated in favour of `legend.position`
  - argument `fontSize` is soft deprecated in favour of `font.size`
  - argument `colx` is soft deprecated in favour of `axis.colour`
  - argument `coly` is soft deprecated in favour of `strip.background`
  - the order of the arguments did not change.

# BioTIMEr 0.2.5 - 19.09.2025
- Patch. all testthat snapshot tests are now skipped on CRAN and CI.

# BioTIMEr 0.2.4 - 06.06.2025

- Data update matching structure from BioTIME v2.0.

# BioTIMEr 0.2.3 - 31.07.2024

- Update of the vignette for clarity
- FIX of the Mac M1 specific issue happening in package dggridR
- FIX in `resampling()` to sample without replacement
- FIX in `getLinearRegressions()` to correct result dimensions and metric order

# BioTIMEr 0.2.2 - 03.04.2024

- Initial CRAN submission.
