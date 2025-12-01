# Rarefy BioTIME data to an equal number of samples per year

Takes the output of
[`gridding`](https://biotimehub.github.io/BioTIMEr/reference/gridding.md)
and applies sample-based rarefaction to standardise the number of
samples per year within each cell-level time series (i.e. assemblageID).

## Usage

``` r
resampling(
  x,
  measure,
  resamps = 1L,
  conservative = FALSE,
  summarise = TRUE,
  verbose = TRUE
)
```

## Arguments

- x:

  (`data.frame`) BioTIME gridded data to be resampled (in the format of
  the output of the
  [`gridding`](https://biotimehub.github.io/BioTIMEr/reference/gridding.md)
  function).

- measure:

  (`character`) currency to be retained during the sample-based
  rarefaction. Can be either defined by a single column name or a vector
  of two or more column names.

- resamps:

  (`integer`) number of repetitions. Default is 1.

- conservative:

  (`logical`). `FALSE` by default. If `TRUE`, whenever a `NA` is found
  in the measure field(s), the whole sample is removed instead of the
  missing observations only.

- summarise:

  (`logical`). `TRUE` by default. If `FALSE`, the function returns
  abundance and/or biomass summed at the SAMPLE_DESC level git
  pull(i.e., per sample), rather than per species per year.

- verbose:

  if TRUE, a warning will be shown when one-year-long time series are
  found in btf and excluded.

## Value

Returns a single long form `data.frame` containing the total currency or
currencies of interest (sum) for each species in each year within each
rarefied time series (i.e. `assemblageID`). An extra integer column
called `resamp` indicates the specific iteration.

## Details

Sample-based rarefaction prevents temporal variation in sampling effort
from affecting diversity estimates (see Gotelli N.J., Colwell R.K. 2001
Quantifying biodiversity: procedures and pitfalls in the measurement and
comparison of species richness. Ecology Letters 4(4), 379-391) by
selecting an equal number of samples across all years in a time series.
`resampling` counts the number of unique samples taken in each year
(sampling effort), identifies the minimum number of samples across all
years, and then uses this minimum to randomly resample each year down to
that number. Thus, standardising the sampling effort between years,
standard biodiversity metrics can be calculated based on an equal number
of samples (e.g. using
[`getAlphaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getAlphaMetrics.md),
[`getAlphaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getAlphaMetrics.md)).
`measure` is a `character` input specifying the chosen currency to be
used during the sample-based rarefaction. It can be a single column name
or a vector of two or more column names - e.g. for BioTIME,
`measure="ABUNDANCE"`, `measure="BIOMASS"` or
`measure = c("ABUNDANCE", "BIOMASS")`.

By default, any observations with `NA` within the currency field(s) are
removed. You can choose to remove the full sample where such
observations are present by setting `conservative` to `TRUE`. `resamps`
can be used to define multiple iterations, effectively creating multiple
alternative datasets as in each iteration different samples will be
randomly selected for the years where number of samples \> minimum. Note
that the function always returns a single data frame, i.e. if `resamps`
\> 1, the returned data frame is the result of individual data frames
concatenated together, one from each iteration identified by a numerical
unique identifier 1:resamps.

## Examples

``` r
if (FALSE) { # \dontrun{
  set.seed(42)
  x <- gridding(BTsubset_meta, BTsubset_data)
  resampling(x, measure = "BIOMASS", summarise = TRUE)
  resampling(x, measure = "ABUNDANCE", verbose = FALSE)
  resampling(x, measure = c("ABUNDANCE","BIOMASS"))
  # Without summarising the species abundances are summed at the SAMPLE_DESC level
  resampling(x, measure = "BIOMASS", summarise = FALSE, conservative = FALSE)
} # }
```
