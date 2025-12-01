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
  x <- data.frame(
    resamp = 1L,
    YEAR = rep(rep(2010:2015, each = 4), times = 4),
    Species = c(replicate(n = 8L * 6L, sample(letters[1L:10L], 4L, replace = FALSE))),
    ABUNDANCE = rpois(24 * 8, 10),
    assemblageID = rep(LETTERS[1L:8L], each = 24)
  )
  alpham <- getAlphaMetrics(x, "ABUNDANCE")
  getLinearRegressions(x = alpham, pThreshold = 0.01) |> head(10)
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#>    assemblageID     metric         slope     pvalue significance   intercept
#> 1             A     resamp -7.769943e-17 0.15830242            0    1.000000
#> 2             A          S -3.107977e-16 0.15830242            0    4.000000
#> 3             A          N -1.285714e+00 0.11140387            0 2628.666667
#> 4             A       maxN -8.571429e-01 0.02754026            0 1738.333333
#> 5             A    Shannon  7.882316e-03 0.02894903            0  -14.504070
#> 6             A    Simpson  3.794763e-03 0.02419558            0   -6.900193
#> 7             A invSimpson  5.412274e-02 0.02416741            0 -105.120103
#> 8             A        PIE  4.459757e-03 0.01247305            0   -8.220043
#> 9             A      DomMc -1.699026e-02 0.01814172            0   34.786969
#> 10            A expShannon  3.056364e-02 0.02888373            0  -57.616190

  betam <- getBetaMetrics(x = x, "ABUNDANCE")
  getLinearRegressions(x = betam) |> head(10)
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#> Warning: essentially perfect fit: summary may be unreliable
#>    assemblageID           metric         slope    pvalue significance intercept
#> 1             A           resamp -7.769943e-17 0.1583024            0   1.00000
#> 2             A      JaccardDiss  5.442177e-03 0.8540797            0 -10.19048
#> 3             A MorisitaHornDiss  2.926540e-02 0.5241308            0 -58.21054
#> 4             A   BrayCurtisDiss  2.744839e-02 0.4200657            0 -54.54639
#> 5             B           resamp -7.769943e-17 0.1583024            0   1.00000
#> 6             B      JaccardDiss -5.551020e-02 0.2250488            0 112.32381
#> 7             B MorisitaHornDiss -4.206310e-02 0.2035292            0  85.06557
#> 8             B   BrayCurtisDiss -4.220078e-02 0.2102584            0  85.46654
#> 9             C           resamp -7.769943e-17 0.1583024            0   1.00000
#> 10            C      JaccardDiss  2.258503e-02 0.7028507            0 -44.71111
```
