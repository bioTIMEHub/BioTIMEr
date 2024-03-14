<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/bioTIMEHub/BioTIMEr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/bioTIMEHub/BioTIMEr/actions/workflows/R-CMD-check.yaml)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/BioTIMEr)](https://github.com/r-hub/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/BioTIMEr)](https://cran.r-project.org/package=BioTIMEr)
<!-- badges: end -->

# BioTIMEr

**BioTIMEr** is an R package which gives you functions to work with BioTIME communities and provides an subset of [the BioTIME database](https://biotime.st-andrews.ac.uk/).

**BioTIME** (the Global database of assemblage time series for quantifying and
understanding biodiversity change) is an international network and an open access
database, free to anyone, anywhere in the world to use for education, research, 
and conservation.

## Installation

```r
install.packages("BioTIMEr") # CRAN version
```

```r
pak::pkg_install("bioTIMEHub//BioTIMEr") # dev version
```

## Getting Started 

There are several long-form articles that can help get you started:

* [Getting Started](https://docs.ropensci.org/rgbif/articles/rgbif.html)
* [Getting Occurrence Data From GBIF](https://docs.ropensci.org/rgbif/articles/getting_occurrence_data.html)
* [Working With Taxonomic Names](https://docs.ropensci.org/rgbif/articles/taxonomic_names.html)

Most BioTIME users are interested in standardising the extent of the datasets.
Here using the data subset included inside the package.

```r 
library(BioTIMEr)
gridding(BTsubset_meta, BTsubset_data)
```

A likely following step would be to rarefy communities to a common sampling effort.

```r 
gridding(BTsubset_meta, BTsubset_data) %>% 
   resampling("ABUNDANCE")
```

## Citation 

Under the terms of the BioTIME data user agreement, users who download data agree to cite a DOI. Please see GBIF’s [citation guidelines](https://www.gbif.org/citation-guidelines) and [Citing GBIF Mediated Data](https://docs.ropensci.org/rgbif/articles/gbif_citations.html).

Please also cite **BioTIMEr** by running `citation(package = "BioTIMEr")`.

## Meta

* Please [report any issues or bugs](https://github.com/bioTIMEhub/BioTIMEr/issues).
* License: MIT
* Get citation information for `BioTIMEr` in R doing `citation(package = 'BioTIMEr')`
