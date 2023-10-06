#' Plot slopes BioTIME
#'
#' @export
#' @param x Parameter description
#' @param metric Parameter description
#' @param cols Parameter description
#' @param taxa Parameter description
#' @param method Parameter description
#' @param rf Parameter description
#' @param divType Parameter description
#' @return A plot
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

  switch(
    divType,
    beta = switch(
      method,
      metric = {
        xy <- subset(x, metric == metric)
        p <- ggplot(xy, aes(x = slopes)) +
          geom_histogram(bins = 25, colour = "grey70", aes(fill = TAXA)) +
          geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          scale_fill_manual(values = cols) + ggtitle(metric) +
          themeBioTIME("none", 12, "black", "grey90") +
          facet_wrap(~TAXA, scale = "free_y")
        return(p)
      },
      taxa = {
        xy <- subset(x, TAXA == taxa)
        p <- ggplot(xy, aes(x = slopes)) +
          geom_histogram(bins = 25, colour = "grey70", aes(fill = metric)) +
          geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          scale_fill_manual(values = cols) + ggtitle(taxa) +
          themeBioTIME("none", 12, "black", "grey90") +
          facet_wrap(~metric)
        return(p)
      },
      ind = {
        xy <- subset(x, rarefyID == rf)
        p <- ggplot(xy, aes(x = Year, y = dissimilarity)) + ggtitle(rf) +
          geom_point(colour = "#155f49", size = 3) + ylab("Dissimilarity") +
          stat_smooth(method = "lm", se = FALSE, linetype = 2, colour = "black") +
          themeBioTIME("none", 12, "black", "#86db9c") +
          facet_wrap(~metric)
        return(p)
      }),

    alpha = switch(
      method,
      metric = {
        xy <- subset(x, metric == metric)
        p <- ggplot(xy, aes(x = slopes)) + ggtitle(metric) +
          geom_histogram(bins = 25, colour = "grey70", aes(fill = TAXA)) +
          geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          scale_fill_manual(values = cols) +
          themeBioTIME("none", 12, "black", "grey90") +
          facet_wrap(~TAXA, scales = "free")
        return(p)
      },
      taxa = {
        xy <- subset(x, TAXA == taxa)
        p <- ggplot(xy, aes(x = slopes)) + ggtitle(taxa) +
          geom_histogram(bins = 25, colour = "grey70", aes(fill = metric)) +
          geom_vline(xintercept = 0, linetype = 2, colour = "firebrick") +
          scale_fill_manual(values = cols) +
          themeBioTIME("none", 12, "black", "grey90") +
          facet_wrap(~metric, scale = "free")
        return(p)
      },
      ind = {
        xy <- subset(x, rarefyID == rf)
        p <- ggplot(xy, aes(x = Year, y = diversity)) + ggtitle(rf) +
          geom_point(colour = "#00483d", size = 3) + ylab("Diversity") +
          stat_smooth(method = "lm", se = FALSE, linetype = 2, colour = "black") +
          themeBioTIME("none", 12, "black", "#d9d956") +
          facet_wrap(~metric, scales = "free")
        return(p)
      })
  )
}
