#' Plot slopes BioTIME
#'
#' @param x A data.frame with columns slopes, metric, taxa, assemblageID
#' @param metric If \code{divtype} is alpha, \code{metric} must be one of "S",
#'    "N", "maxN", "Shannon", "Simpson", "invSimpson", "PIE", "DomMc" or
#'    "expShannon".
#'    If \code{divtype} is beta, \code{metric} must be one of "JaccardDiss",
#'    "MorisitaHornDiss" or "BrayCurtisDiss".
#' @param cols Name of the column in x from which colouring groups will be based
#'   on.
#' @param taxa Necessary if method = "taxa", one of: "Amphibians & reptiles",
#'   "Birds", "Chromista", "Fish", "Fungi", "Mammals", "Plants"
#' @param method Character can be one of "metric", "taxa", "ind"
#' @param assemblageID Parameter description
#' @param divType "alpha" or "beta"
#' @returns A plot
#' @keywords internal

plotSlopes <- function(
  x,
  metric,
  cols,
  taxa = c(
    "Amphibians & reptiles",
    "Birds",
    "Chromista",
    "Fish",
    "Fungi",
    "Mammals",
    "Plants"
  ),
  method = c("metric", "taxa", "ind"),
  assemblageID,
  divType = c("alpha", "beta")
) {
  taxa <- match.arg(taxa)
  method <- match.arg(method)
  divType <- match.arg(divType)

  stopifnot(
    "The provided assemblageID is not valid" = assemblageID %in% x$assemblageID
  )

  base::switch(
    divType,
    alpha = {
      checkmate::assertChoice(
        x = metric,
        choices = c(
          "S",
          "N",
          "maxN",
          "Shannon",
          "Simpson",
          "invSimpson",
          "PIE",
          "DomMc",
          "expShannon"
        )
      )
      base::switch(
        method,
        metric = {
          xy <- subset(x, metric == metric)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::ggtitle(metric) +
            ggplot2::geom_histogram(
              bins = 25,
              colour = "grey70",
              ggplot2::aes(fill = "TAXA")
            ) +
            ggplot2::geom_vline(
              xintercept = 0,
              linetype = 2,
              colour = "firebrick"
            ) +
            ggplot2::scale_fill_manual(values = cols) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~"TAXA", scales = "free")
          return(p)
        }, # end method == metric
        taxa = {
          xy <- subset(x, "TAXA" == taxa)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::ggtitle(taxa) +
            ggplot2::geom_histogram(
              bins = 25,
              colour = "grey70",
              ggplot2::aes(fill = metric)
            ) +
            ggplot2::geom_vline(
              xintercept = 0,
              linetype = 2,
              colour = "firebrick"
            ) +
            ggplot2::scale_fill_manual(values = cols) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~metric, scale = "free")
          return(p)
        }, # end method == taxa
        ind = {
          xy <- subset(x, assemblageID == assemblageID)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "YEAR", y = "diversity")) +
            ggplot2::ggtitle(assemblageID) +
            ggplot2::geom_point(colour = "#00483d", size = 3) +
            ggplot2::ylab("Diversity") +
            ggplot2::stat_smooth(
              method = "lm",
              se = FALSE,
              linetype = 2,
              colour = "black"
            ) +
            themeBioTIME("none", 12, "black", "#d9d956") +
            ggplot2::facet_wrap(~metric, scales = "free")
          return(p)
        } # end method == ind
      )
    }, # end divType == alpha
    beta = {
      checkmate::assertChoice(
        x = metric,
        choices = c("JaccardDiss", "MorisitaHornDiss", "BrayCurtisDiss")
      )
      base::switch(
        method,
        metric = {
          xy <- subset(x, metric == metric)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::geom_histogram(
              bins = 25,
              colour = "grey70",
              ggplot2::aes(fill = "TAXA")
            ) +
            ggplot2::geom_vline(
              xintercept = 0,
              linetype = 2,
              colour = "firebrick"
            ) +
            ggplot2::scale_fill_manual(values = cols) +
            ggplot2::ggtitle(metric) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~"TAXA", scale = "free_y")
          return(p)
        }, # end method == metric
        taxa = {
          xy <- subset(x, "TAXA" == taxa)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::geom_histogram(
              bins = 25,
              colour = "grey70",
              ggplot2::aes(fill = metric)
            ) +
            ggplot2::geom_vline(
              xintercept = 0,
              linetype = 2,
              colour = "firebrick"
            ) +
            ggplot2::scale_fill_manual(values = cols) +
            ggplot2::ggtitle(taxa) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~metric)
          return(p)
        }, # end method == taxa
        ind = {
          xy <- subset(x, assemblageID == assemblageID)
          p <- ggplot2::ggplot(
            xy,
            ggplot2::aes(x = "YEAR", y = "dissimilarity")
          ) +
            ggplot2::ggtitle(assemblageID) +
            ggplot2::geom_point(colour = "#155f49", size = 3) +
            ggplot2::ylab("Dissimilarity") +
            ggplot2::stat_smooth(
              method = "lm",
              se = FALSE,
              linetype = 2,
              colour = "black"
            ) +
            themeBioTIME("none", 12, "black", "#86db9c") +
            ggplot2::facet_wrap(~metric)
          return(p)
        } # end method == ind
      )
    } # end divType == beta
  )
}


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
#' @importFrom ggplot2 theme_bw
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 element_line
#' @importFrom ggplot2 element_rect
#' @importFrom lifecycle deprecated
#' @importFrom lifecycle is_present
#' @importFrom lifecycle deprecate_warn
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
