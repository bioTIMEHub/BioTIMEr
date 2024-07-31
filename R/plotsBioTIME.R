#' Plot slopes BioTIME
#'
#' @rdname BioTIME-plots
#' @param x Parameter description
#' @param metric Parameter description
#' @param cols Parameter description
#' @param taxa Parameter description
#' @param method Parameter description
#' @param assemblageID Parameter description
#' @param divType Parameter description
#' @returns A plot
#' @keywords internal


plotSlopes <- function(x, metric, cols, taxa, method, assemblageID, divType) {

  checkmate::assertChoice(x = taxa,
                          choices = c("Amphibians & reptiles", "Birds", "Chromista",
                                      "Fish", "Fungi", "Mammals", "Plants"))
  checkmate::assertChoice(x = method, choices = c("metric", "taxa", "ind"))
  checkmate::assertChoice(x = divType, choices = c("beta", "alpha"))
  base::stopifnot("The provided assemblageID is not valid" =
                    base::is.element(assemblageID, x$assemblageID))

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
#' @examples
#' \donttest{
#' fig1 <- ggplot2::ggplot() +
#'           themeBioTIME("none", 12, "black", "grey90")
#' }

themeBioTIME <- function(lp, fontSize, colx, coly) {
  ggplot2::theme_bw() +
    ggplot2::theme(
      axis.text = ggplot2::element_text(size = fontSize, color = colx),
      axis.title = ggplot2::element_text(size = fontSize + 1, face = "bold"),
      legend.position = lp,
      legend.text = ggplot2::element_text(size = fontSize),
      legend.title = ggplot2::element_text(size = fontSize + 1),
      legend.direction = "vertical",
      plot.title = ggplot2::element_text(size = fontSize + 2,
                                         face = "bold",
                                         hjust = 0.5),
      plot.background = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(size = fontSize - 2),
      strip.background = ggplot2::element_rect(fill = coly),
      axis.line = ggplot2::element_line(color = colx)
    )
}
