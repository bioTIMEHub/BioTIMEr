# Alpha diversity metrics

Calculates a set of standard alpha diversity metrics

## Usage

``` r
getAlphaMetrics(x, measure)
```

## Arguments

- x:

  (`data.frame`) BioTIME data in the format of the output of the
  [`resampling`](https://biotimehub.github.io/BioTIMEr/reference/resampling.md)
  function.

- measure:

  (`character`) chosen currency defined by a single column name.

## Value

Returns a `data.frame` with results for species richness (`S`),
numerical abundance (`N`), maximum numerical abundance (`maxN`), Shannon
Index (`Shannon`), Exponential Shannon (`expShannon`), Simpson's Index
(Simpson), Inverse Simpson (`InvSimpson`), Probability of intraspecific
encounter (`PIE`) and McNaughton's Dominance (`DomMc`) for each year and
`assemblageID`.

## Details

The function `getAlphaMetrics` computes nine alpha diversity metrics for
a given community data frame, where `measure` is a character input
specifying the abundance or biomass field used for the calculations. For
each row of the data frame with data, `getAlphaMetrics` calculates the
following metrics:

\- Species richness (`S`) as the total number of species in each year
with currency \> 0.

\- Numerical abundance (`N`) as the total currency (sum) in each year
(either total abundance or total biomass).

\- Maximum Numerical abundance (maxN) as the highest currency value
reported in each year.

\- Shannon or Shannon–Weaver index is calculated as
\\\sum\_{i}p\_{i}log\_{b}p\_{i}\\, where \\p\_{i}\\ is the proportional
abundance of species i and b is the base of the logarithm (natural
logarithms), while exponential Shannon is given by `exp(Shannon)`.

\- Simpson's index is calculated as \\1-sum(p\_{i}^{2})\\, while Inverse
Simpson as \\1/sum(p\_{i}^{2})\\.

\- McNaughton's Dominance is calculated as the sum of the pi of the two
most abundant species.

\- Probability of intraspecific encounter or PIE is calculated as
\\\left(\frac{N}{N-1}\right)\left(1-\sum\_{i=1}^{S}\pi\_{i}^{2}\right)\\.

Note that the input data frame needs to be in the format of the output
of the
[`gridding`](https://biotimehub.github.io/BioTIMEr/reference/gridding.md)
function and/or
[`resampling`](https://biotimehub.github.io/BioTIMEr/reference/resampling.md)
functions, which includes keeping the default BioTIME data column names.
If such columns are not found an error is issued and the computations
are halted.

## Examples

``` r
  # Mean and sd values of the metrics for several resamplings
  gridding(BTsubset_meta, BTsubset_data) |>
    resampling(measure = "BIOMASS", resamps = 2) |>
    getAlphaMetrics(measure = "BIOMASS") |>
    dplyr::summarise(
       dplyr::across(
          .cols = !resamp,
          .fns = c(mean = mean, sd = sd)),
       .by = c(assemblageID, YEAR)) |>
    tidyr::pivot_longer(
       col = dplyr::contains("_"),
       names_to = c("metric", "stat"),
       names_sep = "_",
       names_transform = as.factor) |>
    tidyr::pivot_wider(names_from = stat) |>
    head(10)
#> OK: all SL studies have 1 grid cell
#> Warning: NA values found and removed.
#> Only a subset of `x` is used.
#> # A tibble: 10 × 5
#>    assemblageID  YEAR metric       mean    sd
#>    <chr>        <int> <fct>       <dbl> <dbl>
#>  1 211_504467    1984 S          11         0
#>  2 211_504467    1984 N          11.8       0
#>  3 211_504467    1984 maxN        2.9       0
#>  4 211_504467    1984 Shannon     2.02      0
#>  5 211_504467    1984 Simpson     0.850     0
#>  6 211_504467    1984 invSimpson  6.66      0
#>  7 211_504467    1984 PIE         0.929     0
#>  8 211_504467    1984 DomMc       0.409     0
#>  9 211_504467    1984 expShannon  7.55      0
#> 10 211_504467    1985 S           5         0
```
