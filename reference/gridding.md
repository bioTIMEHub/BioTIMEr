# gridding BioTIME data

grids BioTIME data into a discrete global grid based on the location of
the samples (latitude/longitude).

## Usage

``` r
gridding(meta, btf, res = 12, resByData = FALSE, verbose = TRUE)
```

## Arguments

- meta:

  (`data.frame`, `tibble` or `data.table`) BioTIME metadata.

- btf:

  (`data.frame`, `tibble` or `data.table`) BioTIME data.

- res:

  (`integer`) cell resolution. Must be in the range \[0,30\]. Larger
  values represent finer resolutions. Default: 12 (~96 sq km). Passed to
  [`dgconstruct`](https://rdrr.io/pkg/dggridR/man/dgconstruct.html).

- resByData:

  (`logical`) FALSE by default. If TRUE, the function
  [`dg_closest_res_to_area`](https://rdrr.io/pkg/dggridR/man/dg_closest_res_to_area.html)
  is called to adapt `res` to the data extent. The new `res` value is
  used even if a value is provided byt the user.

- verbose:

  if TRUE, a warning will be shown when one-year-long time series are
  found in btf and excluded.

## Value

Returns a `'data.frame'`, with selected columns from the `btf` and
`meta` data frames, an extra integer column called `'cell'` and two
character columns called 'StudyMethod' and 'assemblageID' (concatenation
of `STUDY_ID` and `cell`).

## Details

Each BioTIME study contains distinct samples which were collected with a
consistent methodology over time, and each with unique coordinates and
date. These samples can be fixed plots (i.e. SL or 'single-location'
studies where measures are taken from a set of specific georeferenced
sites at any given time) or wide-ranging surveys, transects, tows, and
so on (i.e. ML or 'multi-location' studies where measures are taken from
multiple sampling locations over large extents that may or may not align
from year to year, see `runResampling`. `gridding` is a function
designed to deal with the issue of varying spatial extent between
studies by using a global grid of hexagonal cells derived from
[`dgconstruct`](https://rdrr.io/pkg/dggridR/man/dgconstruct.html) and
assigning the individual samples to the cells across the grid based on
its latitude and longitude. Specifically, each sample is assigned a
different combination of study ID and grid cell resulting in a unique
identifier for each assemblage time series within each cell
(assemblageID). This allows for the integrity of each study and each
sample to be maintained, while large extent studies are split into local
time series at the grid cell level. By default meta represents a long
form data frame containing the data information for BioTIME studies and
`btf` is a data frame containing long form data from a main BioTIME
query (see Example). `res` defines the global grid cell resolution, thus
determining the size of the cells (see `vignette("dggridR")`).
`res = 12` was found to be the most appropriate value when working on
the whole BioTIME database(corresponding to ~96 km2 cell area), but the
user can define their own grid resolution (e.g. `res = 14`, or when
`resbyData = TRUE` allow the function to find the best `res` based on
the average study extent.

## Examples

``` r
if (FALSE) { # \dontrun{
  gridded_data <- gridding(meta = BTsubset_meta, btf = BTsubset_data)
  gridded_data <- gridding(meta = dplyr::as_tibble(BTsubset_meta),
                           btf = dplyr::as_tibble(BTsubset_data))
  gridded_data <- gridding(meta = data.table::as.data.table(BTsubset_meta),
                           btf = data.table::as.data.table(BTsubset_data))
} # }
```
