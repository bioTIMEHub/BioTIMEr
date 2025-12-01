# Beta diversity metrics

Calculates a set of standard beta diversity metrics

## Usage

``` r
getBetaMetrics(x, measure)
```

## Arguments

- x:

  (`data.frame`) BioTIME data table in the format of the output of the
  [`resampling`](https://biotimehub.github.io/BioTIMEr/reference/resampling.md)
  functions.

- measure:

  (`character`) chosen currency defined by a single column name.

## Value

Returns a `data.frame` with results for Jaccard dissimilarity
(`JaccardDiss`), Morisita-Horn dissimilarity (`MorisitaHornDiss`), and
Bray-Curtis dissimilarity (`BrayCurtsDiss`) for each year and
`assemblageID`.

## Details

The function getBetaMetrics computes three beta diversity metrics for a
given community data frame, where `measure` is a character input
specifying the abundance or biomass field used for the calculations.
`getBetaMetrics` calls the
[`vegdist`](https://vegandevs.github.io/vegan/reference/vegdist.html)
function which calculates for each row the following metrics: Jaccard
dissimilarity (`method = "jaccard"`), Morisita-Horn dissimilarity
(`method = "horn"`) and Bray-Curtis dissimilarity (`method = "bray"`).
Here, the dissimilarity metrics are calculated against the baseline year
of each assemblage time series i.e. the first year of each time series.
Note that the input data frame needs to be in the format of the output
of the
[`gridding`](https://biotimehub.github.io/BioTIMEr/reference/gridding.md)
and/or
[`resampling`](https://biotimehub.github.io/BioTIMEr/reference/resampling.md)
functions, which includes keeping the default BioTIME data column names.
If such columns are not found an error is issued and the computations
are halted.

## Examples

``` r
gridding(BTsubset_meta, BTsubset_data) |>
  resampling(measure = "BIOMASS", verbose = FALSE, resamps = 2) |>
  getBetaMetrics(measure = "BIOMASS") |>
  head()
#> OK: all SL studies have 1 grid cell
#> # A tibble: 6 × 6
#>   resamp assemblageID  YEAR JaccardDiss MorisitaHornDiss BrayCurtisDiss
#>    <int> <chr>        <int>       <dbl>            <dbl>          <dbl>
#> 1      1 211_504467    1984       0.593           0.384           0.500
#> 2      1 211_504467    1985      NA              NA              NA    
#> 3      1 211_516855    1982       0.741           0.107           0.372
#> 4      1 211_516855    1983       0.726           0.0925          0.941
#> 5      1 211_516855    1984       0.700           0.0258          0.794
#> 6      1 211_516855    1985       0.661           0.159           0.926
```
