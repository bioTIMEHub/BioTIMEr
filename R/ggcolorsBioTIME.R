# Function to implement BioTIME palettes as scales in ggplot
# Author: Cher Chow
# Updated: 20 November 2020
# Palette at the end of the script

#' Scale construction for ggplot use
#' @rdname BioTIME-palette
#' @export
#' @param palette One of: `realms`, `gradient`, `cool`, `warm`, default to `realms`.
#' @param discrete See Details. default to `FALSE`
#' @param reverse Default to `FALSE`
#' @param ... Passed to \code{\link[ggplot2]{discrete_scale}} or \code{\link[ggplot2]{scale_color_gradient}}
#' @returns If \code{discrete} is \code{TRUE}, the function returns a colour palette produced by 
#'     \code{\link[ggplot2]{discrete_scale}} and if \code{discrete} is \code{FALSE}, the function
#'     returns a colour palette produced by \code{\link[ggplot2]{scale_color_gradient}}.
#' @details
#' USAGE NOTE: Remember to change these arguments when plotting colours continuously.
#' @author Cher F. Y. Chow
#' @importFrom ggplot2 discrete_scale
#' @importFrom ggplot2 scale_fill_gradientn

scale_color_biotime <- function(palette = "realms", discrete = TRUE,
                                reverse = FALSE, ...) {
  checkmate::assert_choice(x = palette, choices = c("realms", "gradient",
                                                    "cool", "warm"))
  checkmate::assert_logical(x = discrete, max.len = 1L, null.ok = FALSE)
  checkmate::assert_logical(x = reverse, max.len = 1L, null.ok = FALSE)

  pal <- biotime_cols(palette = palette, reverse = reverse)
  if (discrete) {
    ggplot2::discrete_scale("color", paste("biotime_", palette, sep = ''),
                            palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

# UK English friendly :)
#' @rdname BioTIME-palette
#' @export
scale_colour_biotime <- scale_color_biotime

#' Scale construction for filling in ggplot
#' @rdname BioTIME-palette
#' @returns If \code{discrete} is \code{TRUE}, the function returns a colour palette produced by 
#'     \code{\link[ggplot2]{discrete_scale}} and if \code{discrete} is \code{FALSE}, the function
#'     returns a colour palette produced by \code{\link[ggplot2]{scale_color_gradient}}.
#' @export
#' @inherit scale_color_biotime author
#' @inherit scale_color_biotime details
#' @importFrom ggplot2 discrete_scale
#' @importFrom ggplot2 scale_fill_gradientn

scale_fill_biotime <- function(palette = "realms",
                               discrete = TRUE,
                               reverse = FALSE, ...) {
  checkmate::assert_choice(x = palette, choices = c("realms", "gradient",
                                                    "cool", "warm"))
  checkmate::assert_logical(x = discrete, max.len = 1L, null.ok = FALSE)
  checkmate::assert_logical(x = reverse, max.len = 1L, null.ok = FALSE)

  pal <- biotime_cols(palette = palette, reverse = reverse)
  if (discrete) {
    ggplot2::discrete_scale("fill",
                            paste("biotime_", palette, sep = ''),
                            palette = pal,
                            ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}


## BioTIME palettes set up
biotime_palettes <- list(
  'realms' = c("#155f49","#66c1d1","#d9d956","#cf7941"),
  'gradient' = c("#00483d","#127c8e","#31b9c2","#86db9c","#c0f176","#ffff67"),
  'cool' = c("#155f49","#67b6c4"),
  'warm' = c("#d9d956","#cf7941"))

intPalette <- function(colors, ...) {
  ramp <- grDevices::colorRamp(colors, ...)
  function(n) {
    if (n > length(colors)) {x <- ramp(seq.int(0, 1, length.out = n))
    if (ncol(x) == 4L)
      grDevices::rgb(x[, 1L], x[, 2L], x[, 3L], x[, 4L], maxColorValue = 255)
    else grDevices::rgb(x[, 1L], x[, 2L], x[, 3L], maxColorValue = 255)}
    else colors[sort(sample(x = c(1:length(colors)), size = n, replace = FALSE))]
  }
}

biotime_cols <- function(palette = "gradient", reverse = FALSE, ...) {
  pal <- biotime_palettes[[palette]]
  if (reverse) pal <- rev(pal)
  intPalette(pal, ...) # interpolates palette colours
}
