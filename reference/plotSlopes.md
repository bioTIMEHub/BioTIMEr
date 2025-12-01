# Plot slopes BioTIME

Plot slopes BioTIME

## Usage

``` r
plotSlopes(
  x,
  metric,
  cols,
  taxa = c("Amphibians & reptiles", "Birds", "Chromista", "Fish", "Fungi", "Mammals",
    "Plants"),
  method = c("metric", "taxa", "ind"),
  assemblageID,
  divType = c("alpha", "beta")
)
```

## Arguments

- x:

  A data.frame with columns slopes, metric, taxa, assemblageID

- metric:

  If `divtype` is alpha, `metric` must be one of "S", "N", "maxN",
  "Shannon", "Simpson", "invSimpson", "PIE", "DomMc" or "expShannon". If
  `divtype` is beta, `metric` must be one of "JaccardDiss",
  "MorisitaHornDiss" or "BrayCurtisDiss".

- cols:

  Name of the column in x from which colouring groups will be based on.

- taxa:

  Necessary if method = "taxa", one of: "Amphibians & reptiles",
  "Birds", "Chromista", "Fish", "Fungi", "Mammals", "Plants"

- method:

  Character can be one of "metric", "taxa", "ind"

- assemblageID:

  Parameter description

- divType:

  "alpha" or "beta"

## Value

A plot
