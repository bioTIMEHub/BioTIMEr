# BioTIMEr 0.4.0 (development version)

## Bug Fixes That Change Results

 - **Recompute all beta metrics and beta slopes.** `getBetaMetrics()` shifted
 every dissimilarity by one year: each year showed the value of the next year
 and the baseline year was not 0. The baseline is now the earliest `YEAR`
 (whatever the row order) and has a dissimilarity of 0. Results from earlier
 versions, and `getLinearRegressions()` on beta metrics, are wrong and must be
 recomputed.
 - Jaccard dissimilarity in `getBetaMetrics()` is now computed on
 presence/absence. Before, fractional values (for example biomass below 1)
 were treated as quantities.
 - `getLinearRegressions()` now fits each metric separately. Before, one missing
 value in a metric (for example `PIE`, which is `NA` when `N <= 1`) removed that
 year from the regressions of all metrics. Perfectly constant metrics no longer
 give rows with a missing slope or a wrong intercept. A metric with fewer than
 3 non-missing years is left out of the result. This also applies to an
 assemblage with fewer than 3 years in one resample (the check used all
 resamples together): it used to be fitted on 1 or 2 points and gave `NaN`
 p-values, it is now left out.
 - `getAlphaMetrics()`: `PIE` is now `NA` when the total abundance `N` is 1 or
 less (it was `Inf` or negative). PIE assumes counts of individuals, so it is
 only meaningful for `measure = "ABUNDANCE"`.

## Performance

 - `getLinearRegressions()` no longer uses broom, which took about 75% of its run
 time. Results are identical. The package no longer depends on broom.
 - `resampling()` does one vectorised `unique()` per draw instead of one per
 assemblage and year, and sorts the samples once.

## Other Bug Fixes

 - `resampling()` identifies a sample by assemblage, year and `SAMPLE_DESC`.
 Before, it kept every row of the table whose `SAMPLE_DESC` had been picked in
 any assemblage and year. The same `SAMPLE_DESC` value is used by several
 studies (2.7% of the values in the BioTIME database; for example one sampling
 event split into two studies, or a bare year such as "2000"), so a pick in one
 study kept rows in the others and some assemblage-years had more samples than
 the minimum. On the full BioTIME database (708 studies) this affected 0.85% of
 the assemblage-years, in 131 studies, with up to 41 extra samples. Resampled
 data, and everything computed from it, can change for these studies. Rerun
 `resampling()` and the metrics.
 - `resampling()` no longer changes a data.table given by the user (it added a
 `minsamp` column, set a key and reordered rows).
 - `resampling()` no longer loses a year when `SAMPLE_DESC` is numeric and the
 year has one sample (`sample(7, 1)` drew from 1:7).
 - With the same seed, `resampling()` now gives the same result whatever the row
 order of the input.
 - `getAlphaMetrics()` and `getBetaMetrics()` now drop only rows with a missing
 value in `measure`, for data frames and tibbles as well as data.tables. Before,
 a missing value in any other column removed the row for data frames.
 - `getLinearRegressions()` checks `p_threshold` for beta tables too.
 - `getAlphaMetrics()` and `getBetaMetrics()` now always return a data frame
 (classes `alpha` or `beta`, then `data.frame`), whatever the class of the
 input. Before, `getAlphaMetrics()` returned a tibble, and `getBetaMetrics()`
 returned a data frame, or a tibble for tibble input. The returned classes are
 now documented and tested: `gridding()` and `resampling()` return the class of
 their input, the metric tables and the slopes are data frames.
 - `themeBioTIME()` can be called without arguments (defaults: `legend.position
 = "right"`, `font.size = 12`, `axis.colour = "black"`, `strip.background =
 "grey90"`) and `axis.color` now works.
 - `scale_color_biotime()` and `scale_fill_biotime()` no longer pick random
 colours when fewer colours are needed than the palette has. The colours are now
 evenly spaced, so the same plot always has the same colours.
 - `gridding()` prints its result for data.table input.
 - `gridding()` now stops, with the study IDs, instead of returning wrong
 values without any message in these cases. Check pipelines that relied on the
 old silent behaviour.
   - `STUDY_ID` duplicated in `meta`: the rows of that study were duplicated
   (81,084 rows became 82,490 in a test), so every later sum was wrong.
   - A study that cannot be classified as single-location (SL) or
   multi-location (ML): fewer than 2 studies in `meta` for the SL/ML limit, or a
   missing `NUMBER_LAT_LONG` or `AREA_SQ_KM`. The study got `StudyMethod = NA`,
   its coordinates were not used and all its rows went to one cell (cell 732 at
   `res = 12`). `res_by_data = TRUE` with no limit failed with "argument is of
   length zero".
   - Missing, infinite or out-of-range coordinates (latitude outside [-90, 90],
   longitude outside [-360, 360]) in the coordinates used for gridding. They
   were silently put in a cell. Longitudes beyond [-180, 180] are accepted
   because dggridR wraps them. `res` must be an integer in [0, 30].
   - No row left to grid (for example every study of `x` has a single year or is
   missing in `meta`): it used to return a data frame with 0 rows.
 - `gridding()` warns, with the count and the study IDs, when rows of `x` have
 no `STUDY_ID` in `meta` (they were dropped without a message). Studies with a
 single year are removed with a warning that names them, whatever `verbose` is.
 - `gridding()` no longer prints "OK: all SL studies have 1 grid cell": it
 printed even with no SL study. A factor `STUDY_ID` no longer makes it crash,
 and `verbose = FALSE` now also hides the resolution printed by
 `res_by_data = TRUE`.
 - The rule that separates SL from ML studies is unchanged. It is computed from
 all rows of `meta`, so the same study can be SL or ML depending on the other
 rows of `meta`: pass the metadata of the whole BioTIME database. A decision on
 this rule is pending.

## Deprecated Arguments

Old names still work and give a deprecation warning.

 - `gridding()`: `btf` is now `x`, `resByData` is now `res_by_data`. Giving both an old and a new name is now an
 error (`btf` used to replace `x` silently).
 - `resampling()`: `resamps` is now `n_resamples`.
 - `getLinearRegressions()`: `pThreshold` is now `p_threshold`.

## Documentation

 - The Shannon formula now has its minus sign and PIE uses `p_i` (not `\pi_i`).
 - `gridding()` documentation now describes the SL/ML rule, that SL studies are
 gridded by the `meta` centroid, that `res_by_data` uses the SL/ML limit (not
 the data extent), the checks it makes, and the returned columns (`cell` is
 numeric, not integer).
 - `getLinearRegressions()` documentation now says exactly what is removed:
 for alpha metrics, years with a single species (`S == 1`), then assemblages with
 fewer than 3 years. The code did this since the first version, but the
 documentation spoke of single-species time series.

# BioTIMEr 0.3.2 - 10.03.2026

## Minor Improvements and Bug Fixes
 - Documentation for data sets BTsubset_data and BTsubset_meta was improved.
 - Figures in the vignette were invisible.

# BioTIMEr 0.3.1 - 10.02.2026

## Minor Improvements and Bug Fixes

 - getLinearRegressions() now handles data from getMetrics() with several
 resamplings.
 - getMetrics() and getLinearRegressions() now work without resamplings
 allowing users to run them on their own data.
 - vignette YAML frontmatter fixed.


# BioTIMEr 0.3.0 - 29.11.2025

## Major Improvement

- The package now uses `data.table` in the background for major speed
  and memory usage improvements. Resampling the whole BioTIME database used to
  take > 1 hour and now takes < 1 minute.
- methods: gridding and resampling functions now handle `data.frame`,
  `data.table` and `tibble` objects with dedicated functions.
- getAlphaMetrics and getBetaMetrics are faster and use 100x less memory.

## New Features

- In the `resampling` function:

  - new argument `summarise`, TRUE by default keeps previous behaviour.

    If TRUE, the abundance and/or biomass is summed per rarefyID while if FALSE
    the abundance and/or biomass will be summed per rarefyID/SAMPLE_DESC and gives
    more columns.

- In the getAlphaMetrics and getBetaMetrics functions:

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

# BioTIMEr 0.2.6

* Patch. test modification to adapt to vegan update 2.7-2

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
