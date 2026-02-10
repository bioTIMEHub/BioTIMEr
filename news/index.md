# Changelog

## BioTIMEr 0.3.1 - 10.02.2026

### Minor Improvements and Bug Fixes

- getLinearRegressions() now handles data from getMetrics() with several
  resamplings
- getMetrics() and getLinearRegressions() now work without resamplings
  allowing users to run them on their own data.
- vignette YAML frontmatter fixed.

## BioTIMEr 0.3.0 - 29.11.2025

CRAN release: 2025-11-28

### Major Improvement

- The package now uses `data.table` in the background for major speed
  and memory usage improvements. Resampling the whole BioTIME database
  used to take \> 1 hour and now takes \< 1 minute.
- methods: gridding and resampling functions now handle `data.frame`,
  `data.table` and `tibble` objects with dedicated functions.
- getAlphaMetrics and getBetaMetrics are faster and use 100x less
  memory.

### New Features

- In the `resampling` function:

  - new argument `summarise`, TRUE by default keeps previous behaviour.

    If TRUE, the abundance and/or biomass is summed per rarefyID while
    if FALSE the abundance and/or biomass will be summed per
    rarefyID/SAMPLE_DESC and gives more columns.

- In the getAlphaMetrics and getBetaMetrics functions:

- `data.frames` containing several resamplings are accepted

  If the provided data contain several resamplings, metrics will be
  computed per resampling, per assemblageID, per year.

- In the getLinearRegressions function:

  - removed the `divType` argument.

    The function now reads the class of the objects produced by
    `getAlphaMetrics` and `getBetaMetrics` and computes the expected
    metrics.

### Minor Improvements and Bug Fixes

- In the `themeBioTIME` function:

  - argument `lp` is soft deprecated in favour of `legend.position`
  - argument `fontSize` is soft deprecated in favour of `font.size`
  - argument `colx` is soft deprecated in favour of `axis.colour`
  - argument `coly` is soft deprecated in favour of `strip.background`
  - the order of the arguments did not change.

## BioTIMEr 0.2.6

CRAN release: 2025-10-15

- Patch. test modification to adapt to vegan update 2.7-2

## BioTIMEr 0.2.5 - 19.09.2025

CRAN release: 2025-09-19

- Patch. all testthat snapshot tests are now skipped on CRAN and CI.

## BioTIMEr 0.2.4 - 06.06.2025

CRAN release: 2025-06-06

- Data update matching structure from BioTIME v2.0.

## BioTIMEr 0.2.3 - 31.07.2024

CRAN release: 2024-07-31

- Update of the vignette for clarity
- FIX of the Mac M1 specific issue happening in package dggridR
- FIX in
  [`resampling()`](https://biotimehub.github.io/BioTIMEr/reference/resampling.md)
  to sample without replacement
- FIX in
  [`getLinearRegressions()`](https://biotimehub.github.io/BioTIMEr/reference/getLinearRegressions.md)
  to correct result dimensions and metric order

## BioTIMEr 0.2.2 - 03.04.2024

CRAN release: 2024-04-03

- Initial CRAN submission.
