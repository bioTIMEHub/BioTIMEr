#' Run the alpha function
#' @param x (data.frame) First column has to be year
#' @param ab character input for chosen currency - "A" = ABUNDANCE or "B" = BIOMASS
#' @returns getAlphaMetrics returns a data.frame with nine alpha diversity metrics
#' @author Faye Moyes
#' @export
#' @examples
#' \dontrun{
#'   x <- data.frame(
#'     YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'     Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
#'     ABUNDANCE = rpois(24 * 8, 10),
#'     assemblageID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   res <- getAlphaMetrics(x, "A")
#' }

getAlphaMetrics <- function(x, ab) {
  checkmate::assert_choice(ab, c("A","B"))
  checkmate::assert_numeric(x = base::ifelse(ab == "A", x$ABUNDANCE, x$BIOMASS),
                            lower = 0, any.missing = FALSE)
  checkmate::assert_names(x = colnames(x), what = "colnames",
                          must.include = c("YEAR","Species","assemblageID"),
                          subset.of = c("YEAR","Species","assemblageID",
                                        "STUDY_ID", "cell",
                                        "ABUNDANCE","BIOMASS"))

  xd <- data.frame()

  base::switch(
    ab,
    A = {
      x <- x[!is.na(x$ABUNDANCE), ]
      for (id in unique(x$assemblageID)) {
        df <- x[x$assemblageID == id, ]
        if (dplyr::n_distinct(df$YEAR) > 1L && dplyr::n_distinct(df$Species) > 1L) {
          y <- dplyr::select(df, "YEAR", "Species", "ABUNDANCE") %>%
            tidyr::pivot_wider(names_from = "Species",
                               values_from = "ABUNDANCE",
                               values_fill = 0)
          xd <- rbind(xd, getAlpha(x = y, id = id))
        } # end if
      } # end for
    }, # end base::switch
    B = {
      x <- x[!is.na(x$BIOMASS), ]
      for (id in unique(x$assemblageID)) {
        df <- x[x$assemblageID == id, ]
        if (dplyr::n_distinct(df$YEAR) > 1L && dplyr::n_distinct(df$Species) > 1L) {
          y <- dplyr::select(df, "YEAR", "Species", "BIOMASS") %>%
            tidyr::pivot_wider(names_from = "Species",
                               values_from = "BIOMASS",
                               values_fill = 0)
          xd <- rbind(xd, getAlpha(x = y, id = id))
        } # end if
      } # end for
    }) # end base::switch
  return(xd)
}

#' Alpha
#' @param x (data.frame) First column has to be year and following columns
#' contain species abundances.
#' @param id definition of id
#' @author Faye Moyes
#' @keywords internal
#' @examples
#' \dontrun{
#'   x <- data.frame(
#'     YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'     matrix(data = rpois(384, 10), ncol = 4)
#'     )
#'     res <- getAlpha(x, id = 34)
#' }
#'
#' @returns A data frame with results for S (species richness), N (numerical abundance),
#' maximum N per year per assemblage, Shannon, Exponential Shannon, Simpson,
#' Inverse Simpson, PIE (probability of intraspecific encounter) and
#' McNaughton's Dominance.

getAlpha <- function(x, id) {
  # base::stopifnot(!is.null(id))
  # checkmate::assert_names(x = colnames(x)[[1L]],
  #                         identical.to = "YEAR",
  #                         what = "colnames")

  yr <- unique(x[, 1L])
  x <- x[, -1L]

  S <-     apply(x > 0, 1, sum)
  N <-     apply(x, 1, sum)
  maxN <-  apply(x, 1, max)

  DomMc = apply(x, 1, function(s) {
    y <- sort(s, decreasing = TRUE)
    (y[[1L]] + y[[2L]]) / sum(y)})

  PIE = apply(x, 1, function(s) {
    n <- sum(s)
    (n / (n - 1)) * (1 - sum((s / n)^2))})

  x <- base::sweep(x, 1, N, "/")
  Shannon <- apply( -x * log(x), 1, sum, na.rm = TRUE)
  H <- apply(x * x, 1, sum, na.rm = TRUE)

  return(
    data.frame(
      assemblageID = id,
      YEAR = yr,
      S,
      N,
      maxN,

      Shannon,
      Simpson = 1 - H,
      invSimpson = 1 / H,
      PIE,
      DomMc,
      expShannon = exp(Shannon)
    )
  )
}

#' run the beta function
#' @export
#' @param x (data.frame) Has to have columns Species, YEAR, assemblageID,
#'   STUDY_ID, cell and ABUNDANCE or BIOMASS
#' @param ab character input for chosen currency - "A" = ABUNDANCE or "B" = BIOMASS
#' @returns getBetaMetrics returns a long data.frame with results for three beta
#'   metrics.
#' @author Faye Moyes
#' @examples
#' \dontrun{
#' x <- data.frame(
#'   YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'   Species = c(replicate(
#'    n = 8L,
#'    sample(letters, 24L, replace = FALSE))),
#'   ABUNDANCE = rpois(24 * 8, 10),
#'   assemblageID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'
#' res <- getBetaMetrics(x, "A")
#' }

getBetaMetrics <- function(x, ab) {
  checkmate::assert_choice(ab, c("A","B"))
  checkmate::assert_numeric(x = base::ifelse(ab == "A", x$ABUNDANCE, x$BIOMASS),
                            lower = 0, any.missing = FALSE)
  checkmate::assert_names(x = colnames(x), what = "colnames",
                          must.include = c("YEAR","Species","assemblageID"),
                          subset.of = c("YEAR","Species","assemblageID",
                                        "STUDY_ID", "cell",
                                        "ABUNDANCE","BIOMASS"))

  xd <- data.frame()
  nyear <- tapply(x$YEAR, x$assemblageID, dplyr::n_distinct)
  nsp   <- tapply(x$Species, x$assemblageID, dplyr::n_distinct)

  base::switch(
    ab,
    A = {
      x <- x[!is.na(x$ABUNDANCE), ]
      for (id in unique(x$assemblageID)) {
        df <- x[x$assemblageID == id, ]
        if (nyear[[id]] < 2L || nsp[[id]] < 2L) {
          xr <- c(NA, id, NA, NA, NA)
        } else if (nyear[[id]] > 1L && nsp[[id]] > 1L) {
          y <- dplyr::select(df, "YEAR", "Species", "ABUNDANCE") %>%
            tidyr::pivot_wider(names_from = "Species",
                               values_from = "ABUNDANCE",
                               values_fill = 0)
          xd <- rbind(xd, getBeta(x = y, id = id))
        } # end if
      } # end for
    }, # end switch
    B = {
      x <- x[!is.na(x$BIOMASS), ]
      for (id in unique(x$assemblageID)) {
        df <- x[x$assemblageID == id, ]
        if (nyear[[id]] < 2L || nsp[[id]] < 2L) {
          xr <- c(NA, id, NA, NA, NA)
        } else if (nyear[[id]] > 1L && nsp[[id]] > 1L) {
          y <- x[x$assemblageID == id, ] %>%
            dplyr::select("YEAR", "Species", "BIOMASS") %>%
            tidyr::pivot_wider(names_from = "Species",
                               values_from = "BIOMASS",
                               values_fill = 0)
          xd <- rbind(xd, getBeta(x = y, id = id))
        } # end if
      } # end for
    }) # end base::switch

  xd <- xd[!is.na(xd$JaccardDiss), ]
  return(xd)
}



#' Beta
#' @param x (data.frame) First column has to contain year values and following
#' columns contain species abundances
#' @param id definition of id
#' @returns getBeta returns a data.frame with three beta diversity dissimilarity
#' metrics
#' @importFrom vegan vegdist
#' @author Faye Moyes
#' @keywords internal
#' @examples
#' \dontrun{
#'   x <- data.frame(
#'     YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'     matrix(data = rpois(384, 2), ncol = 4)
#'   )
#'   res <- getBeta(x, "A")
#' }

getBeta <- function(x, id) {

  yr <- unique(x[, 1L])
  x <- x[, -1L]
  xb <- x
  xb[xb > 1] <- 1
  getj <- vegan::vegdist(xb, "jaccard") #10
  getmh <- vegan::vegdist(x, "horn") #8
  getbc <- vegan::vegdist(x, "bray") #4

  jacc <- c(1, getj[1L:nrow(x)])[-1]
  mh <-  c(1, getmh[1L:nrow(x)])[-1]
  bc <-  c(1, getbc[1L:nrow(x)])[-1]

  xf <- data.frame(YEAR = yr, assemblageID = id, JaccardDiss = jacc,
                   MorisitaHornDiss = mh, BrayCurtisDiss = bc)
  return(xf)
}
