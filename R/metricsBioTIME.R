#' Alpha diversity metrics
#'
#' Calculates a set of standard alpha diversity metrics
#' @param x (\code{data.frame}) BioTIME data table in the format of the output of the
#' \code{\link{gridding}} function and/or \code{\link{resampling}} function.
#' @param measure (\code{character}) chosen currency defined by a single column name.
#'
#' @details
#' The function \code{getAlphaMetrics} computes nine alpha diversity metrics for
#' a given community data frame, where \code{measure} is a character input
#' specifying the abundance or biomass field used for the calculations. For each
#' row of the data frame with data, \code{getAlphaMetrics} calculates
#' the following metrics:
#'
#' - Species richness (\code{S}) as the total number of species in each year with currency > 0.
#'
#' - Numerical abundance (\code{N}) as the total currency (sum) in each year
#' (either total abundance or total biomass).
#'
#' - Maximum Numerical abundance (MaxN) as the highest currency value reported in each year.
#'
#' - Shannon or Shannon–Weaver index is calculated as \eqn{\sum_{i}p_{i}log_{b}p_{i}}, where \eqn{p_{i}} is the proportional abundance of species i and b is the base of the logarithm (natural logarithms), while exponential Shannon is given by \code{exp(Shannon)}.
#'
#' - Simpson's index is calculated as \eqn{1-sum(p_{i}^{2})}, while Inverse Simpson as \eqn{1/sum(p_{i}^{2})}.
#'
#' - McNaughton's Dominance is calculated as the sum of the pi of the two most abundant species.
#'
#' - Probability of intraspecific encounter or PIE is calculated as \eqn{\left(\frac{N}{N-1}\right)\left(1-\sum_{i=1}^{S}\pi_{i}^{2}\right)}.
#'
#' Note that the input data frame needs to be in the format of the output of the
#'  \code{\link{gridding}} function and/or \code{\link{resampling}} functions,
#'  which includes keeping the default BioTIME data column names. If such columns
#'  are not found an error is issued and the computations are halted.
#'
#' @returns Returns a data frame with results for species richness (\code{S}), numerical
#'  abundance (\code{N}), maximum numerical abundance (\code{MaxN}), Shannon Index (\code{Shannon}),
#'  Exponential Shannon (\code{expShannon}), Simpson's Index (Simpson), Inverse Simpson
#'  (\code{InvSimpson}), Probability of intraspecific encounter (\code{PIE}) and McNaughton's
#'  Dominance (\code{DomMc}) for each year and \code{assemblageID}.

#' @export
#' @examples
#'   x <- data.frame(
#'     resamp = 1L,
#'     YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'     Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
#'     ABUNDANCE = rpois(24 * 8, 10),
#'     assemblageID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   res <- getAlphaMetrics(x, measure = "ABUNDANCE")

getAlphaMetrics <- function(x, measure) {
  checkmate::assert_names(x = colnames(x), what = "colnames",
                          must.include = c(measure, "YEAR", "Species", "assemblageID")
  )

  xd <- data.frame()

  x <- x[!is.na(x[, measure]), ]
  for (id in unique(x$assemblageID)) {
    df <- x[x$assemblageID == id, ]
    if (dplyr::n_distinct(df$YEAR) > 1L && dplyr::n_distinct(df$Species) > 1L) {
      y <- df %>%
        dplyr::select("YEAR", "Species", dplyr::all_of(measure)) %>%
        tidyr::pivot_wider(names_from = "Species",
                           values_from = dplyr::all_of(measure),
                           values_fill = 0)
      xd <- rbind(xd, getAlpha(x = y, id = id))
    } # end if
  } # end for

  return(xd)
}



#' Alpha
#' @param x (\code{data.frame}) First column has to be year and following columns
#' contain species abundances.
#' @param id (\code{character})One AssemblageID
#' @keywords internal
#' @returns A data frame with results for S (species richness), N (numerical abundance),
#' maximum N per year per assemblage, Shannon, Exponential Shannon, Simpson,
#' Inverse Simpson, PIE (probability of intraspecific encounter) and
#' McNaughton's Dominance.

getAlpha <- function(x, id) {
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

#' Beta diversity metrics
#'
#' Calculates a set of standard beta diversity metrics
#' @export
#' @param x (\code{data.frame}) BioTIME data table in the format of the output of the
#'  \code{\link{gridding}} function and/or \code{\link{resampling}} functions.
#' @param measure (\code{character}) chosen currency defined by a single column name.
#'
#' @details
#' The function getBetaMetrics computes three beta diversity metrics for a given community data frame, where \code{measure} is a character input specifying the abundance or biomass field used for the calculations. \code{getBetaMetrics} calls the \code{\link[vegan]{vegdist}} function which calculates for each row the following metrics: Jaccard dissimilarity (\code{method = "jaccard"}), Morisita-Horn dissimilarity (\code{method = "horn"}) and Bray-Curtis dissimilarity (\code{method = "bray"}). Here, the dissimilarity metrics are calculated against the baseline year of each assemblage time series i.e.
#' the first year of each time series.
#' Note that the input data frame needs to be in the format of the output of the
#'  \code{\link{gridding}} and/or \code{\link{resampling}} functions, which includes keeping the default BioTIME data column names. If such columns are not found an error is
#'  issued and the computations are halted.
#'
#' @returns Returns a \code{data.frame} with results for Jaccard dissimilarity (\code{JaccardDiss}), Morisita-Horn dissimilarity (\code{MorisitaHornDiss}), and Bray-Curtis dissimilarity (\code{BrayCurtsDiss}) for each year and \code{assemblageID}.
#' @examples
#' x <- data.frame(
#'   resamp = 1L,
#'   YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'   Species = c(replicate(
#'    n = 8L,
#'    sample(letters, 24L, replace = FALSE))),
#'   ABUNDANCE = rpois(24 * 8, 10),
#'   assemblageID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'
#' res <- getBetaMetrics(x, measure = "ABUNDANCE")

getBetaMetrics <- function(x, measure) {
  checkmate::assert_names(x = colnames(x), what = "colnames",
                          must.include = c(measure, "YEAR", "Species", "assemblageID")
  )

  xd <- data.frame()

  x <- x[!is.na(x[, measure]), ]
  nyear <- tapply(x$YEAR, x$assemblageID, dplyr::n_distinct)
  nsp   <- tapply(x$Species, x$assemblageID, dplyr::n_distinct)

  for (id in unique(x$assemblageID)) {
    df <- x[x$assemblageID == id, ]
    if (nyear[[id]] < 2L || nsp[[id]] < 2L) {
      xd <- rbind(xd, data.frame(YEAR = unique(df$YEAR),
                                 assemblageID = id,
                                 JaccardDiss = NA,
                                 MorisitaHornDiss = NA,
                                 BrayCurtisDiss = NA))
    } else if (nyear[[id]] > 1L && nsp[[id]] > 1L) {
      rbeta <- df %>%
        dplyr::select("YEAR", "Species", dplyr::all_of(measure)) %>%
        tidyr::pivot_wider(names_from = "Species",
                           values_from = dplyr::all_of(measure),
                           values_fill = 0) %>%
        getBeta(id = id)
      xd <- rbind(xd, rbeta)
    } # end if
  } # end for

  return(xd)
}



#' Beta
#' @param x (\code{data.frame}) First column has to be year and following columns
#' contain species abundances.
#' @param id (\code{character})One AssemblageID
#' @returns getBeta returns a data.frame with three beta diversity dissimilarity
#' metrics
#' @importFrom vegan vegdist
#' @keywords internal

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
