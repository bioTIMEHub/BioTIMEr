#' Plot slopes BioTIME
#'
#' @export
#' @rdname BioTIME-plots
#' @param x Parameter description
#' @param metric Parameter description
#' @param cols Parameter description
#' @param taxa Parameter description
#' @param method Parameter description
#' @param rf Parameter description
#' @param divType Parameter description
#' @returns A plot
#' @examples
#' \dontrun{
#' library(dplyr)
#' library(tidyr)
#' library(ggplot2)
#'
#' load("./data/subBTmeta.RData")
#' meta  <-  subBTmeta
#' meta2 <- select(meta, STUDY_ID, TAXA, REALM)
#'
#' alphaSl <- as.data.frame(alphaSl %>% separate(., rarefyID,
#'                                             into= c("STUDY_ID", "cell"), sep="_", remove=F))
#'
#' ameta <- merge(alphaSl, meta2, by="STUDY_ID")
#'
#' betaSl <- as.data.frame(betaSl %>% separate(., rarefyID,
#'                                           into= c("STUDY_ID", "cell"), sep="_", remove=F))
#'
#' bmeta <- merge(betaSl, meta2, by="STUDY_ID")
#
#' bio <- c("#00483d","#127c8e","#31b9c2","#86db9c","#d9d956" ,"#c0f176","#ffff67", "#cf7941")
#' bioCol <- c("#cf7941", "#127c8e","#86db9c","#d9d956")
#'
#' plm <- plotSlopes(bmeta, "JaccardDiss", bioCol, "Fish", "metric", "18_9044316", "beta")
#'
#' plt <- plotSlopes(ameta, "N", bio, "Fish", "taxa","18_9044316", "alpha")
#'
#' plrf <- plotSlopes(bmeta, "N", bioCol, "Fish", "ind","18_9044316", "beta")
#' }


plotSlopes <- function(x, metric, cols, taxa, method, rf, divType) {

  checkmate::assertChoice(method, choices = c("metric", "taxa", "ind"))
  checkmate::assertChoice(divType, choices = c("beta", "alpha"))

  base::switch(
    divType,
    beta = base::switch(
      method,
      metric = {
        xy <- subset(x, metric == metric)
        p <- ggplot2::ggplot(xy, ggplot2::aes(x = slopes)) +
          ggplot2::geom_histogram(bins = 25, colour = "grey70", ggplot2::aes(fill = TAXA)) +
          ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          ggplot2::scale_fill_manual(values = cols) + ggplot2::ggtitle(metric) +
          themeBioTIME("none", 12, "black", "grey90") +
          ggplot2::facet_wrap(~TAXA, scale = "free_y")
        return(p)
      },
      taxa = {
        xy <- subset(x, TAXA == taxa)
        p <- ggplot2::ggplot(xy, ggplot2::aes(x = slopes)) +
          ggplot2::geom_histogram(bins = 25, colour = "grey70", ggplot2::aes(fill = metric)) +
          ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          ggplot2::scale_fill_manual(values = cols) + ggplot2::ggtitle(taxa) +
          themeBioTIME("none", 12, "black", "grey90") +
          ggplot2::facet_wrap(~metric)
        return(p)
      },
      ind = {
        xy <- subset(x, rarefyID == rf)
        p <- ggplot2::ggplot(xy, ggplot2::aes(x = Year, y = dissimilarity)) +
          ggplot2::ggtitle(rf) +
          ggplot2::geom_point(colour = "#155f49", size = 3) +
          ggplot2::ylab("Dissimilarity") +
          ggplot2::stat_smooth(method = "lm", se = FALSE, linetype = 2, colour = "black") +
          themeBioTIME("none", 12, "black", "#86db9c") +
          ggplot2::facet_wrap(~metric)
        return(p)
      }),

    alpha = base::switch(
      method,
      metric = {
        xy <- subset(x, metric == metric)
        p <- ggplot2::ggplot(xy, ggplot2::aes(x = slopes)) +
          ggplot2::ggtitle(metric) +
          ggplot2::geom_histogram(bins = 25, colour = "grey70", ggplot2::aes(fill = TAXA)) +
          ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          ggplot2::scale_fill_manual(values = cols) +
          themeBioTIME("none", 12, "black", "grey90") +
          ggplot2::facet_wrap(~TAXA, scales = "free")
        return(p)
      },
      taxa = {
        xy <- subset(x, TAXA == taxa)
        p <- ggplot2::ggplot(xy, ggplot2::aes(x = slopes)) +
          ggplot2::ggtitle(taxa) +
          ggplot2::geom_histogram(bins = 25, colour = "grey70", ggplot2::aes(fill = metric)) +
          ggplot2::geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          ggplot2::scale_fill_manual(values = cols) +
          themeBioTIME("none", 12, "black", "grey90") +
          ggplot2::facet_wrap(~metric, scale = "free")
        return(p)
      },
      ind = {
        xy <- subset(x, rarefyID == rf)
        p <- ggplot2::ggplot(xy, ggplot2::aes(x = Year, y = diversity)) +
          ggplot2::ggtitle(rf) +
          ggplot2::geom_point(colour = "#00483d", size = 3) + ggplot2::ylab("Diversity") +
          ggplot2::stat_smooth(method = "lm", se = FALSE, linetype = 2, colour = "black") +
          themeBioTIME("none", 12, "black", "#d9d956") +
          ggplot2::facet_wrap(~metric, scales = "free")
        return(p)
      })
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
#' \dontrun{
#' fig1 <- ggplot2::ggplot() +
#'           themeBioTIME()
#' }

themeBioTIME <- function(lp, fontSize, colx, coly) {
  ggplot2::theme_bw() +
    ggplot2::theme(axis.text = ggplot2::element_text(size = fontSize, color = colx),
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
