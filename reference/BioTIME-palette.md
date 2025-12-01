# Scale construction for ggplot use

Scale construction for ggplot use

Scale construction for filling in ggplot

## Usage

``` r
scale_color_biotime(palette = "realms", discrete = TRUE, reverse = FALSE, ...)

scale_colour_biotime(palette = "realms", discrete = TRUE, reverse = FALSE, ...)

scale_fill_biotime(palette = "realms", discrete = TRUE, reverse = FALSE, ...)
```

## Arguments

- palette:

  One of: \`realms\`, \`gradient\`, \`cool\`, \`warm\`, default to
  \`realms\`.

- discrete:

  See Details. default to \`FALSE\`

- reverse:

  Default to \`FALSE\`

- ...:

  Passed to
  [`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  or
  [`scale_color_gradient`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)

## Value

If `discrete` is `TRUE`, the function returns a colour palette produced
by
[`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
and if `discrete` is `FALSE`, the function returns a colour palette
produced by
[`scale_color_gradient`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

If `discrete` is `TRUE`, the function returns a colour palette produced
by
[`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
and if `discrete` is `FALSE`, the function returns a colour palette
produced by
[`scale_color_gradient`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Details

USAGE NOTE: Remember to change these arguments when plotting colours
continuously.

## Author

Cher F. Y. Chow
