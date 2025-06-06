#' Plot slopes BioTIME
#'
#' @rdname BioTIME-plots
#' @param x Parameter description
#' @param metric If `divtype` is alpha, `metric` must be one of "S", "N", "maxN",
#'    "Shannon", "Simpson", "invSimpson", "PIE", "DomMc","expShannon".
#'    If `divtype` is beta, `metric` must be one of "JaccardDiss", "MorisitaHornDiss",
#'    "BrayCurtisDiss"
#' @param cols Parameter description
#' @param taxa Parameter description
#' @param method Character can be one of "metric", "taxa", "ind"
#' @param assemblageID Parameter description
#' @param divType "alpha" or "beta"
#' @returns A plot
#' @keywords internal


plotSlopes <- function(x,
                       metric,
                       cols,
                       taxa = c("Amphibians & reptiles", "Birds", "Chromista",
                                "Fish", "Fungi", "Mammals", "Plants"),
                       method = c("metric", "taxa", "ind"),
                       assemblageID,
                       divType = c("alpha", "beta")) {

  taxa <- match.arg(taxa)
  method <- match.arg(method)
  divType <- match.arg(divType)

  stopifnot("The provided assemblageID is not valid" =
              assemblageID %in% x$assemblageID)

  base::switch(
    divType,
    alpha = {
      checkmate::assertChoice(
        x = metric,
        choices = c("S", "N", "maxN", "Shannon", "Simpson",
                    "invSimpson", "PIE", "DomMc","expShannon"))
      base::switch(
        method,
        metric = {
          xy <- subset(x, metric == metric)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::ggtitle(metric) +
            ggplot2::geom_histogram(bins = 25, colour = "grey70",
                                    ggplot2::aes(fill = "TAXA")) +
            ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
            ggplot2::scale_fill_manual(values = cols) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~"TAXA", scales = "free")
          return(p)
        }, # end method == metric
        taxa = {
          xy <- subset(x, "TAXA" == taxa)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::ggtitle(taxa) +
            ggplot2::geom_histogram(bins = 25, colour = "grey70",
                                    ggplot2::aes(fill = metric)) +
            ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
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
            ggplot2::stat_smooth(method = "lm", se = FALSE,
                                 linetype = 2, colour = "black") +
            themeBioTIME("none", 12, "black", "#d9d956") +
            ggplot2::facet_wrap(~metric, scales = "free")
          return(p)
        } # end method == ind
      )}, # end divType == alpha
    beta = {
      checkmate::assertChoice(
        x = metric,
        choices = c("JaccardDiss", "MorisitaHornDiss", "BrayCurtisDiss"))
      base::switch(
        method,
        metric = {
          xy <- subset(x, metric == metric)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::geom_histogram(bins = 25, colour = "grey70",
                                    ggplot2::aes(fill = "TAXA")) +
            ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
            ggplot2::scale_fill_manual(values = cols) +
            ggplot2::ggtitle(metric) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~"TAXA", scale = "free_y")
          return(p)
        }, # end method == metric
        taxa = {
          xy <- subset(x, "TAXA" == taxa)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "slopes")) +
            ggplot2::geom_histogram(bins = 25, colour = "grey70",
                                    ggplot2::aes(fill = metric)) +
            ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
            ggplot2::scale_fill_manual(values = cols) +
            ggplot2::ggtitle(taxa) +
            themeBioTIME("none", 12, "black", "grey90") +
            ggplot2::facet_wrap(~metric)
          return(p)
        }, # end method == taxa
        ind = {
          xy <- subset(x, assemblageID == assemblageID)
          p <- ggplot2::ggplot(xy, ggplot2::aes(x = "YEAR", y = "dissimilarity")) +
            ggplot2::ggtitle(assemblageID) +
            ggplot2::geom_point(colour = "#155f49", size = 3) +
            ggplot2::ylab("Dissimilarity") +
            ggplot2::stat_smooth(method = "lm", se = FALSE,
                                 linetype = 2, colour = "black") +
            themeBioTIME("none", 12, "black", "#86db9c") +
            ggplot2::facet_wrap(~metric)
          return(p)
        } # end method == ind
      )} # end divType == beta
  )
}



#' ggplot2 theme for BioTIME plots
#' @export
#' @rdname BioTIME-plots
#' @param lp description
#' @param fontSize description
#' @param colx description
#' @param coly description
#' @importFrom ggplot2 theme_bw
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 element_line
#' @importFrom ggplot2 element_rect
#' @examples
#' \donttest{
#' fig1 <- ggplot2::ggplot() +
#'           themeBioTIME("none", 12, "black", "grey90")
#' }

themeBioTIME <- function(lp, fontSize, colx, coly) {
  checkmate::assert_choice(lp, c("none", "left", "right", "bottom", "top"))
  checkmate::assert_number(fontSize, lower = 1)
  checkmate::assert_string(colx)
  checkmate::assert_string(coly)

  theme_bw() +
    theme(
      axis.text = element_text(size = fontSize, color = colx),
      axis.title = element_text(size = fontSize + 1, face = "bold"),
      legend.position = lp,
      legend.text = element_text(size = fontSize),
      legend.title = element_text(size = fontSize + 1),
      legend.direction = "vertical",
      plot.title = element_text(size = fontSize + 2,
                                         face = "bold",
                                         hjust = 0.5),
      plot.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      strip.text = element_text(size = fontSize - 2),
      strip.background = element_rect(fill = coly),
      axis.line = element_line(color = colx)
    )
}
