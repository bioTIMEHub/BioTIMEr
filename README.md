<!-- badges: start -->
[![Lifecycle: stable](https://img.shields.io/badge/Lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/bioTIMEHub/BioTIMEr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/bioTIMEHub/BioTIMEr/actions/workflows/R-CMD-check.yaml)
[![cran version](https://www.r-pkg.org/badges/version/BioTIMEr)](https://cran.r-project.org/package=BioTIMEr)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/BioTIMEr)](https://github.com/r-hub/cranlogs.app)
[![codecov.io](https://codecov.io/github/bioTIMEHub/BioTIMEr/coverage.svg?branch=main)](https://app.codecov.io/github/bioTIMEHub/BioTIMEr?branch=main)

<!-- badges: end -->

# BioTIMEr

**BioTIMEr** is an R package which gives you functions to work with BioTIME communities and provides an subset of [the BioTIME database](https://biotime.st-andrews.ac.uk/).

**BioTIME** (the Global database of assemblage time series for quantifying and
understanding biodiversity change) is an international network and an open access
database, free to anyone, anywhere in the world to use for education, research,
and conservation.

For a complete description of the database, please refer to our open access publication entitled [_BioTIME 2.0: Expanding and Improving a Database of Biodiversity Time Series._](https://doi.org/10.1111/geb.70003)

## Installation

```r
install.packages("BioTIMEr") # CRAN version
```

```r
remotes::github_install("bioTIMEHub/BioTIMEr") # dev version
```

## Getting Started

Most BioTIME users are interested in standardising the extent of the datasets.
Here using the data subset included inside the package.

```r
library(BioTIMEr)
gridding(BTsubset_meta, BTsubset_data)
```

A likely following step would be to rarefy communities to a common sampling effort.

```r
gridding(BTsubset_meta, BTsubset_data) |>
   resampling("ABUNDANCE")
```

## Citation

Under the terms of the BioTIME data user agreement, users who download data agree to cite all underlying DOIs.

Please also cite **BioTIMEr** by running `citation(package = "BioTIMEr")`.

## Meta

* Please [report any issues or bugs](https://github.com/bioTIMEhub/BioTIMEr/issues).
* License: MIT
* Get citation information for `BioTIMEr` in R doing `citation(package = 'BioTIMEr')`
