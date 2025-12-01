# Rarefy BioTIME data Applies sample-based rarefaction to standardise the number of samples per year within a cell-level time series.

Rarefy BioTIME data Applies sample-based rarefaction to standardise the
number of samples per year within a cell-level time series.

## Usage

``` r
resampling_core(x, measure, summarise)
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

- summarise:

  (`logical`). `TRUE` by default. If `FALSE`, the function returns
  abundance and/or biomass summed at the SAMPLE_DESC level git
  pull(i.e., per sample), rather than per species per year.

## Value

Returns a single long form data frame containing the total currency of
interest (sum) for each species in each year.
