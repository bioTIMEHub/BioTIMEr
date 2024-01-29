#' Alpha
#' @rdname BioTIME-alpha-metrics
#' @export
#' @param x (data.frame) First column has to be year and following columns
#' contain species abundances.
#' @param id definition of id
#' @importFrom vegan diversity
#' @author Faye Moyes
#' @examples
#' \dontrun{
#'   x <- data.frame(
#'     Year = rep(rep(2010:2015, each = 4), times = 4),
#'     matrix(data = rpois(384, 10), ncol = 4)
#'     )
#'     res <- getAlpha(x, rarefyID = 34)
#' }
#'
#' @returns A data frame with results for S (species richness), N (numerical abundance),
#' maximum N per year per assemblage, Shannon, Exponential Shannon, Simpson,
#' Inverse Simpson, PIE (probability of intraspecific encounter) and
#' McNaughton's Dominance.

getAlpha <- function(x, id) {
  base::stopifnot(!is.null(id))
  checkmate::assert_names(x = colnames(x)[[1L]], identical.to = "Year")

  yr <- unique(x[, 1L])
  x <- x[, -1L]

  return(data.frame(rarefyID = id,
                    Year = yr,
                    S = apply(x > 0, 1, sum),
                    N = apply(x, 1, sum),
                    maxN = apply(x, 1, max),
                    Shannon = vegan::diversity(x, "shannon"),
                    Simpson = vegan::diversity(x, "simpson"),
                    invSimpson = vegan::diversity(x, "inv"),
                    PIE = apply(x, 1, function(s) {
                      n <- sum(s)
                      (n / (n - 1)) * (1 - sum((s / n)^2))}),
                    DomMc = apply(x, 1, function(s) {
                      y <- sort(s, decreasing = TRUE)
                      (y[1] + y[2]) / sum(y)}),
                    expShannon = apply(x, 1, function(s) {
                      n <- sum(s)
                      exp(-sum(s / n * ifelse(s == 0, 0, log(s / n))))})
  )
  )
}

#' run the alpha function
#' @rdname BioTIME-alpha-metrics
#' @param x (data.frame) First column has to be year
#' @param ab character input for chosen currency - "A" = Abundance or "B" = Biomass
#' @returns getAlphaMetrics returns a data.frame with nine alpha diversity metrics
#' @author Faye Moyes
#' @export
#' @examples
#' \dontrun{
#'   x <- data.frame(
#'     Year = rep(rep(2010:2015, each = 4), times = 4),
#'     Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
#'     Abundance = rpois(24 * 8, 10),
#'     rarefyID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   res <- getAlphaMetrics(x, "A")
#' }

getAlphaMetrics <- function(x, ab) {
  checkmate::assert_choice(ab, c("A","B"))
  checkmate::assert_names(x = colnames(x),
                          must.include = c("Year","Species","rarefyID"),
                          subset.of = c("Year","Species","rarefyID",
                                        "Abundance","Biomass"))

  xd <- data.frame()

  base::switch(
    ab,
    A = {
      x <- subset(x, !is.na(Abundance))
      for (id in unique(x$rarefyID)) {
        df <- subset(x, rarefyID == id)
        if (dplyr::n_distinct(df$Year) > 1L && dplyr::n_distinct(df$Species) > 1L) {
          df <- dplyr::select(df, Year, Species, Abundance)
          y <- tidyr::pivot_wider(df, names_from = Species,
                                  values_from = Abundance)
          y[is.na(y)] <- 0
          xr <- getAlpha(y, id)
          xd <- rbind(xd, xr)
        } # end if
      } # end for
    }, # end base::switch
    B = {
      x <- subset(x, !is.na(Biomass))
      for (id in unique(x$rarefyID)) {
        df <- subset(x, rarefyID == id)
        if (dplyr::n_distinct(df$Year) > 1L && dplyr::n_distinct(df$Species) > 1L) {
          df <- dplyr::select(df, Year, Species, Biomass)
          y <- tidyr::pivot_wider(df, names_from = Species,
                                  values_from = Biomass)
          y[is.na(y)] <- 0
          xr <- getAlpha(y, id)
          xd <- rbind(xd, xr)
        } # end if
      } # end for
    }) # end base::switch
  return(xd)
}


#' Beta
#' @rdname BioTIME-beta-metrics
#' @param x (data.frame) First column has to contain year values and following
#' columns contain species abundances
#' @param id definition of id
#' @returns getBeta returns a data.frame with three beta diversity dissimilarity
#' metrics
#' @importFrom vegan vegdist
#' @author Faye Moyes
#' @export
#' @examples
#' \dontrun{
#' x <- data.frame(
#'   Year = rep(rep(2010:2015, each = 4), times = 4),
#'   Species = c(replicate(
#'    n = 8L,
#'    sample(letters, 24L, replace = FALSE))),
#'   Abundance = rpois(24 * 8, 10),
#'   ID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   res <- getBeta(x, "A")
#' }

getBeta <- function(x, id) {

  yr <- unique(x[, 1L])
  x <- x[, -1L]
  xb <- x
  xb[xb > 1] <- 1
  getj <- vegan::vegdist(xb, "jaccard")
  getmh <- vegan::vegdist(x, "horn")
  getbc <- vegan::vegdist(x, "bray")

  jacc <- c(1, getj[1:(nrow(x))])[-1]
  mh <- c(1, getmh[1:(nrow(x))])[-1]
  bc <- c(1, getbc[1:(nrow(x))])[-1]

  xf <- data.frame(Year = yr, rarefyID = id, JaccardDiss = jacc,
                   MorisitaHornDiss = mh, BrayCurtisDiss = bc)
  return(xf)
}

#' run the beta function
#' @export
#' @rdname BioTIME-beta-metrics
#' @param x (data.frame) Has to have columns Species, Year and Abundance or Biomass
#' @param ab character input for chosen currency - "A" = Abundance or "B" = Biomass
#' @returns getBetaDissimilarity returns a long data.frame with results for three beta metrics
#' @author Faye Moyes
#' @examples
#' \dontrun{
#' x <- data.frame(
#'   Year = rep(rep(2010:2015, each = 4), times = 4),
#'   Species = c(replicate(
#'    n = 8L,
#'    sample(letters, 24L, replace = FALSE))),
#'   Abundance = rpois(24 * 8, 10),
#'   rarefyID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'
#' res <- getBetaDissimilarity(x, "A")
#' }

getBetaDissimilarity <- function(x, ab) {

  xd <- data.frame()
  nyear <- tapply(x$Year, x$rarefyID, dplyr::n_distinct)
  nsp   <- tapply(x$Species, x$rarefyID, dplyr::n_distinct)

  base::switch(
    ab,
    A = {
      x <- subset(x, !is.na(Abundance))
      for (id in unique(x$rarefyID)) {
        df <- subset(x, rarefyID == id)
        if (nyear[[id]] < 2L || nsp[[id]] < 2L) {
          xr <- c(NA, id, NA, NA, NA)
        } else if (nyear[[id]] > 1L && nsp[[id]] > 1L) {
          df <- dplyr::select(df, Year, Species, Abundance)
          y <- tidyr::pivot_wider(df, names_from = Species,
                                  values_from = Abundance)
          y[is.na(y)] <- 0
          xr <- getBeta(y, id)
          xd <- rbind(xd, xr)
        } # end if
      } # end for
    }, # end switch
    B = {
      x <- subset(x, !is.na(Biomass))
      for (id in unique(x$rarefyID)) {
        df <- subset(x, rarefyID == id)
        if (nyear[[id]] < 2L || nsp[[id]] < 2L) {
          xr <- c(NA, id, NA, NA, NA)
        } else if (nyear[[id]] > 1L && nsp[[id]] > 1L) {
          df <- subset(x, rarefyID == id)
          df <- dplyr::select(df, Year, Species, Biomass)
          y <- tidyr::pivot_wider(df, names_from = Species,
                                  values_from = Biomass)
          y[is.na(y)] <- 0
          xr <- getBeta(y, id)
          xd <- rbind(xd, xr)
        } # end if
      } # end for
    }) # end base::switch

  xd <- subset(xd, !is.na(JaccardDiss))
  return(xd)
}
