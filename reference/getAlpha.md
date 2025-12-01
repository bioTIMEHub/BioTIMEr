# Alpha

Alpha

## Usage

``` r
getAlpha(x)
```

## Arguments

- x:

  (`data.frame`) First column has to be year and following columns
  contain species abundances.

## Value

A data frame with results for S (species richness), N (numerical
abundance), maximum N per year per assemblage, Shannon, Exponential
Shannon, Simpson, Inverse Simpson, PIE (probability of intraspecific
encounter) and McNaughton's Dominance.

## Examples

``` r
if (FALSE) { # \dontrun{
# 1 site, 1 year in long format, ordered by ABUNDANCE or BIOMASS
x <- data.frame(species = letters[1:6], x = 6:1)
getAlpha(x$x)
} # }
```
