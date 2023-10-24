#' Alpha
#' @rdname BioTIME-metrics
#' @export
#' @param x (data.frame) First column has to be year
#' @param id definition of id
#' @importFrom vegan diversity
#' @author Faye Moyes
#' @examples
#' \dontrun{
#' x<-data.frame(
#' Year=rep(rep(2010:2015, each=4), times=4),
#' Species=unlist(lapply(
#' X=1L:8L,
#' function(x) letters[sample(length(letters), 24L, replace=FALSE)])),
#' Abundance=rpois(24  *  8, 10),
#' ID=rep(LETTERS[1L:8L], each=24)
#' )
#'
#' res <- getAlphaMetrics(x)
#' }
#'
#' @returns A data frame with results for S (species richness), N (numerical abundance),
#' maximum N per year per assemblage, Shannon, Exponential Shannon, Simpson,
#' Inverse Simpson, PIE (probability of intraspecific encounter) and McNaughton's Dominance

getAlpha <- function(x, id) {

  yr <- unique(x[, 1])
  x <- x[, -1]

  q1 <- diversity(x, "shannon")
  q2 <- diversity(x, "simpson")
  invS <- diversity(x, "inv")

  data.frame(rarefyID = id, Year = yr, S = apply(x > 0, 1, sum),
             N = apply(x, 1, sum), maxN = apply(x, 1, max),
             Shannon = q1, Simpson = q2, InvSimpson = invS,
             PIE = apply(x, 1, function(s) {
               n <- sum(s)
               (n / (n - 1)) * (1 - sum((s / n)^2))}),
             DomMc = apply(x, 1, function(s) {
               y <- sort(s, decreasing = T)
               (y[1] + y[2]) / sum(y)}),
             expShannon = apply(x, 1, function(s) {
               n <- sum(s)
             exp(-sum(s / n * ifelse(s == 0, 0, log(s / n))))})
  )
}

#' run the alpha function
#' @rdname BioTIME-metrics
#' @param x (data.frame) First column has to be year
#' @param ab character input for chosen currency - "A" = Abundance or "B" = Biomass
#' @returns data.frame with nine alpha diversity metrics
#' @author Faye Moyes
#' @examples
#' \dontrun{
#' res <- getAlphaMetrics(x, "B")
#' }

getAlphaMetrics <- function(x, ab) {

  xd <- data.frame()

  if (ab == "A") {
    x <- subset(x, !is.na(Abundance))
    for(id in unique(x$rarefyID)) {
      df <- subset(x, rarefyID = id)
      if (dplyr::n_distinct(df$Year) > 1L && dplyr::n_distinct(df$Species) > 1L) {
        df <- dplyr::select(df, Year, Species, Abundance)
        y <- as.data.frame(tidyr::pivot_wider(df, names_from = Species,
                                       values_from = Abundance))
        y[is.na(y)] <- 0
        xr <- getAlpha(y, id)
        xd <- rbind(xd, xr)
      }
    }
  }
  if (ab == "B") {
    x <- subset(x, !is.na(Biomass))
    for(id in unique(x$rarefyID)) {
      df <- subset(x, rarefyID == id)
      if (dplyr::n_distinct(df$Year) > 1L && dplyr::n_distinct(df$Species) > 1L) {
        df <- dplyr::select(df, Year, Species, Biomass)
        y <- as.data.frame(tidyr::pivot_wider(df, names_from = Species,
                                       values_from = Biomass))
        y[is.na(y)] <- 0
        xr <- getAlpha(y, id)
        xd <- rbind(xd, xr)
      }
    }
  }
  return(xd)
}


#' Beta
#' @rdname BioTIME-metrics
#' @export
#' @param x (data.frame) Has to have columns Species and Abundance
#' @param id definition of id
#' @returns data.frame with three beta diversity dissimilarity metrics
#' @importFrom vegan vegdist
#' @author Faye Moyes
#' @examples
#' \dontrun{
#' res <- getBetaDissimilarity(x, "A")
#' where x is a long form data frame
#' }

getBeta <- function(x, id) {

  yr <- unique(x[, 1])
  x <- x[,-1]
  xb <- x
  xb[xb > 1] <- 1
  getj <- vegdist(xb, "jaccard")
  getmh <- vegdist(x, "horn")
  getbc <- vegdist(x, "bray")

  jacc <- c(1, getj[1:(nrow(x))])[-1]
  mh <- c(1, getmh[1:(nrow(x))])[-1]
  bc <- c(1, getbc[1:(nrow(x))])[-1]

  xf <- data.frame(Year = yr, rarefyID = id, JaccardDiss = jacc,
                   MorisitaHornDiss = mh, BrayCurtisDiss = bc)
  return(xf)
}

#' run the beta function
#' @export
#' @rdname BioTIME-metrics
#' @param x (data.frame) Has to have columns Species and Abundance
#' @param ab character input for chosen currency - "A" = Abundance or "B" = Biomass
#' @returns long with results for three beta metrics
#' @author Faye Moyes

getBetaDissimilarity <- function(x, ab) {

  xd <- data.frame()

  if (ab == "A") {
    x <- subset(x, !is.na(Abundance))
    for (id in unique(x$rarefyID)) {
      df <- subset(x, rarefyID == id)
      nyear <- dplyr::n_distinct(df$Year)
      nsp <- dplyr::n_distinct(df$Species)
      if (nyear < 2L || nsp < 2L) {
        xr <- c(NA, id, NA, NA, NA)
      }
      if (nyear > 1L && nsp > 1L) {
        df <- dplyr::select(df, Year, Species, Abundance)
        y <- as.data.frame(tidyr::pivot_wider(df, names_from = Species,
                                       values_from = Abundance))
        y[is.na(y)] <- 0
        xr <- getBeta(y, id)
        xd <- rbind(xd, xr)
      }
    }
  }
  if (ab == "B") {
    x <- subset(x, !is.na(Biomass))
    for (id in unique(x$rarefyID)) {
      df <- subset(x, rarefyID == id)
      nyear <- dplyr::n_distinct(df$Species)
      nsp <- dplyr::n_distinct(df$Species)
      if (nyear < 2L || nsp < 2L) {
        xr <- c(NA, id, NA, NA, NA)
      }
      if (nyear > 1L && nsp > 1L) {
        df <- subset(x, rarefyID == id)
        df <- dplyr::select(df, Year, Species, Biomass)
        y <- as.data.frame(tidyr::pivot_wider(df, names_from = Species,
                                       values_from = Biomass))
        y[is.na(y)] <- 0
        xr <- getBeta(y, id)
        xd <- rbind(xd, xr)
      }
    }
  }

  xd <- subset(xd, !is.na(JaccardDiss))
  return(xd)
}

