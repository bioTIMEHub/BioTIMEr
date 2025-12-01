# ggplot2 theme for BioTIME plots

ggplot2 theme for BioTIME plots

## Usage

``` r
themeBioTIME(
  legend.position,
  font.size,
  axis.colour,
  strip.background,
  axis.color = axis.colour,
  fontSize = deprecated(),
  colx = deprecated(),
  coly = deprecated(),
  lp = deprecated()
)
```

## Arguments

- legend.position:

  the default position of legends ("none", "left", "right", "bottom",
  "top", "inside")

- font.size:

  Size of axes labels, legend text and title (+1), and title (+2).

- axis.colour:

  Colour name for the axes, ticks and axis labels.

- strip.background:

  Colour name. Passed to
  [`theme`](https://ggplot2.tidyverse.org/reference/theme.html) as
  `fill` colour for the `strip.background` element.

- axis.color:

  US spelling for `axis.colour`.

- fontSize:

  Deprecated in Favour of font.size

- colx:

  Deprecated in favour of `axis.colour`.

- coly:

  Deprecated in favour of `strip.background`.

- lp:

  Deprecated in favour of `legend.position`.

## Examples

``` r
if (FALSE) { # \dontrun{
  fig1 <- ggplot2::ggplot() +
         themeBioTIME(legend.position = "none", font.size = 12,
           axis.colour = "black", strip.background = "grey90")
} # }
```
