#' ggplot2 theme for BioTIME plots
#' @export
#' @inheritParams ggplot2::theme
#' @param font.size Size of axes labels, legend text and title (+1), and
#' title (+2).
#' @param axis.colour Colour name for the axes, ticks and axis labels.
#' @param axis.color US spelling for \code{axis.colour}.
#' @param strip.background Colour name. Passed to \code{\link[ggplot2]{theme}}
#' as \code{fill} colour for the \code{strip.background} element.
#' @param lp Deprecated in favour of \code{legend.position}.
#' @param fontSize Deprecated in Favour of font.size
#' @param colx Deprecated in favour of \code{axis.colour}.
#' @param coly Deprecated in favour of \code{strip.background}.
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 element_line
#' @importFrom ggplot2 element_rect
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 theme_bw
#' @importFrom lifecycle deprecate_warn
#' @importFrom lifecycle deprecated
#' @importFrom lifecycle is_present
#'
#' @examples \dontrun{
#'   fig1 <- ggplot2::ggplot() +
#'          themeBioTIME(legend.position = "none", font.size = 12,
#'            axis.colour = "black", strip.background = "grey90")
#' }

themeBioTIME <- function(
  legend.position,
  font.size,
  axis.colour,
  strip.background,
  axis.color = axis.colour,
  fontSize = deprecated(),
  colx = deprecated(),
  coly = deprecated(),
  lp = deprecated()
) {
  # Checking arguments
  if (is_present(lp)) {
    deprecate_warn(
      when = "0.2.5",
      what = "themeBioTIME(lp)",
      with = "themeBioTIME(legend.position)"
    )
    legend.position <- lp
  }
  if (is_present(fontSize)) {
    deprecate_warn(
      when = "0.2.5",
      what = "themeBioTIME(fontSize)",
      with = "themeBioTIME(font.size)"
    )
    font.size <- fontSize
  }
  if (is_present(colx)) {
    deprecate_warn(
      when = "0.2.5",
      what = "themeBioTIME(colx)",
      with = "themeBioTIME(axis.colour)"
    )
    axis.colour <- colx
  }
  if (is_present(coly)) {
    deprecate_warn(
      when = "0.2.5",
      what = "themeBioTIME(coly)",
      with = "themeBioTIME(strip.background)"
    )
    strip.background <- coly
  }

  checkmate::assert_choice(
    legend.position,
    c("none", "left", "right", "bottom", "top", "inside")
  )
  checkmate::assert_number(font.size, lower = 0)
  checkmate::assert_string(axis.colour)
  checkmate::assert_string(strip.background)

  # Setting the theme
  theme_bw() +
    theme(
      axis.text = element_text(size = font.size, color = axis.colour),
      axis.title = element_text(size = font.size + 1, face = "bold"),
      axis.line = element_line(color = axis.colour),
      axis.ticks = element_line(color = axis.colour),

      legend.position = legend.position,
      legend.text = element_text(size = font.size),
      legend.title = element_text(size = font.size + 1),
      legend.direction = "vertical",

      plot.title = element_text(
        size = font.size + 2,
        face = "bold",
        hjust = 0.5
      ),

      plot.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),

      strip.text = element_text(size = font.size - 2),
      strip.background = element_rect(fill = strip.background)
    )
}
