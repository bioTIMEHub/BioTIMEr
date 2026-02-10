# Get Linear Regressions BioTIME

Fits linear regression models to
[`getAlphaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getAlphaMetrics.md)
or
[`getBetaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getBetaMetrics.md)
outputs

## Usage

``` r
getLinearRegressions(x, pThreshold = 0.05)
```

## Arguments

- x:

  (`data.frame`) BioTIME data table in the format of the output of
  [`getAlphaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getAlphaMetrics.md)
  or
  [`getBetaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getBetaMetrics.md)
  functions

- pThreshold:

  (`numeric`) P-value threshold for statistical significance

## Value

Returns a single long `data.frame` with results of linear regressions
(slope, p-value, significance, intercept) for each `assemblageID`.

## Details

The function `getLinearRegression` fits simple linear regression models
(see [`lm`](https://rdrr.io/r/stats/lm.html) for details) for a given
output ('data') of either
[`getAlphaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getAlphaMetrics.md)
or
[`getBetaMetrics`](https://biotimehub.github.io/BioTIMEr/reference/getBetaMetrics.md)
function. The typical model has the form `metric ~ year`. Note that
assemblages with less than 3 time points and/or single species time
series are removed.

## Examples

``` r
x <- gridding(BTsubset_meta, BTsubset_data) |>
resampling(measure = "BIOMASS", verbose = FALSE, resamps = 2)
#> OK: all SL studies have 1 grid cell

  alpham <- getAlphaMetrics(x, "BIOMASS")

getLinearRegressions(x = alpham, pThreshold = 0.01) |> head(10)
#>    assemblageID resamp     metric        slope    pvalue significance
#> 1    211_516855      1          S  1.500000000 0.1266662            0
#> 2    211_516855      1          N 18.348500000 0.6357123            0
#> 3    211_516855      1       maxN 14.902000000 0.6961681            0
#> 4    211_516855      1    Shannon  0.055774734 0.8580449            0
#> 5    211_516855      1    Simpson  0.017254117 0.9047428            0
#> 6    211_516855      1 invSimpson  0.020322014 0.9645909            0
#> 7    211_516855      1        PIE  0.009028165 0.9568211            0
#> 8    211_516855      1      DomMc -0.017477562 0.7837327            0
#> 9    211_516855      1 expShannon  0.122926561 0.8761060            0
#> 10   211_517585      1          S -8.700000000 0.1725536            0
#>       intercept
#> 1   -2965.50000
#> 2  -36331.13250
#> 3  -29503.41200
#> 4    -109.75711
#> 5     -33.84553
#> 6     -38.49779
#> 7     -17.50177
#> 8      35.53591
#> 9    -241.19673
#> 10  17255.80000

  betam <- getBetaMetrics(x = x, "BIOMASS")

getLinearRegressions(x = betam) |> head(10)
#>    assemblageID resamp           metric        slope     pvalue significance
#> 1    211_516855      1      JaccardDiss -0.006367447 0.74234834            0
#> 2    211_516855      1 MorisitaHornDiss  0.011920612 0.78389600            0
#> 3    211_516855      1   BrayCurtisDiss  0.004807841 0.97981053            0
#> 4    211_517585      1      JaccardDiss  0.015416622 0.77731944            0
#> 5    211_517585      1 MorisitaHornDiss  0.104372717 0.49531250            0
#> 6    211_517585      1   BrayCurtisDiss  0.035029596 0.65180325            0
#> 7    211_521960      1      JaccardDiss -0.008385096 0.49498658            0
#> 8    211_521960      1 MorisitaHornDiss -0.043911928 0.26525963            0
#> 9    211_521960      1   BrayCurtisDiss -0.012431358 0.35914543            0
#> 10   211_523410      1      JaccardDiss  0.021379582 0.08672435            0
#>      intercept
#> 1    13.305944
#> 2   -23.560350
#> 3    -8.898865
#> 4   -29.793800
#> 5  -206.597644
#> 6   -68.649001
#> 7    17.423041
#> 8    87.861314
#> 9    25.497286
#> 10  -41.693148
```
