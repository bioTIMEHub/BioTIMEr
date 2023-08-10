#' Alpha v1
#' @rdname BioTIME-metrics
#' @export
#' @param x (data.frame) First column has to be year
#' @param id definition of id
#' @author Faye Moyes
#' @examples
#' x <- data.frame(
#'   Year = rep(rep(2010:2015, each = 4), times = 4),
#'   Species = unlist(lapply(
#'     X = 1L:8L,
#'     function(x) letters[sample(length(letters), 24L, replace = FALSE)])),
#'   Abundance = rpois(24 * 8, 10),
#'   ID = rep(LETTERS[1L:8L], each = 24)
#' )
#' xd <- data.frame()
#'
#' for (id in unique(x$ID)) {
#'   t11 <- base::subset(x, ID == id)
#'   t1 <- dplyr::select(t11, Year, Species, Abundance)
#'   xr <- getAlphav1(doPivot(t1), id)
#'   xd <- rbind(xd, xr)
#' }
#'

getAlphav1 <- function(x, id) {

  yr <- unique(x[, 1L])
  x <- x[, -1L]
  getq1 <- vegan::diversity(x, "shannon")
  getq2 <- vegan::diversity(x, "simpson")
  getInvS <- vegan::diversity(x, "inv")
  getH0 <- hillR::hill_taxa(x, q = 0)
  getH1 <- hillR::hill_taxa(x, q = 1)
  getH2 <- hillR::hill_taxa(x, q = 2)

  q1 <- c(1, getq1[1:(nrow(x))])[-1L]
  q2 <- c(1, getq2[1:(nrow(x))])[-1L]
  invS <- c(1, getInvS[1:(nrow(x))])[-1L]
  h0 <- c(1, getH0[1:(nrow(x))])[-1L]
  h1 <- c(1, getH1[1:(nrow(x))])[-1L]
  h2 <- c(1, getH2[1:(nrow(x))])[-1L]

  return(
    data.frame(Year = yr, ID = id,
               q1 = (exp(1/q1)),
               q2 = (1/q2),
               invS = invS,
               h0 = h0, h1 = h1, h2 = h2)
  )
}


#' Alpha v2
#' @rdname BioTIME-metrics
#' @export
#' @author Faye Moyes
#' @examples
#' xd <- data.frame()
#'
#' for (id in unique(x$ID)) {
#' t11 <- base::subset(x, ID == id)
#' t1 <- dplyr::select(t11, Year, Species, Abundance)
#' xr <- getAlphav2(doPivot(t1), id)
#' xd <- rbind(xd, xr)
#' }

getAlphav2 <- function(x, id){
  yr <- unique(x[, 1])
  x <- x[, -1]

  return(
    data.frame(Year = yr, ID = id,
               S = apply(x > 0, 1, sum),
               N = apply(x, 1, sum),
               mx = apply(x, 1, max),
               PIE = apply(x, 1, function(s) {
                 n <- sum(s);(n/(n - 1)) * (1 - sum((s/n)^2))}),
               DomMc = apply(x, 1, function(s){
                 y <- sort(s, decreasing = T)
                 (y[1] + y[2]) / sum(y)}),
               expShan = apply(x, 1, function(s) {
                 n <- sum(s)
                 exp(-sum(s/n*ifelse(s == 0, 0, log(s/n))))})
    )
  )
}

#' Beta v2
#' @rdname BioTIME-metrics
#' @export
#' @import vegan
#' @author Faye Moyes
#' @examples
#' xd <- data.frame()
#'
#' for (id in unique(x$ID)) {
#'   t11 <- subset(x, ID == id)
#'   t1 <- dplyr::select(t11, Year, Species, Abundance)
#'   xr <- getBetav2(doPivot(t1), id)
#'   xd <- rbind(xd, xr)
#' }
#'

getBetav2 <- function(x, id) {

  yr <- unique(x[, 1])
  x <- x[, -1]
  x2 <- x
  x2[x2 > 1] <- 1
  getj <- vegan::vegdist(x2, "jaccard")
  getmh <- vegan::vegdist(x, "horn")

  jacc <- c(1, getj[1:(nrow(x))])[-1]
  mh <- c(1, getmh[1:(nrow(x))])[-1]

  return(
    data.frame(Year = yr, ID = id,
               jaccD = jacc, mhorn = mh)
  )
}

#' Convert table long to wide
#' @export
#' @param x (data.frame) Has to have columns Species and Abundance
#' @import tidyr
#' @return Wide x with species in columns.
#' @author Faye Moyes
doPivot  <-  function(x) {
  m1 <- as.data.frame(tidyr::pivot_wider(x, names_from = Species,
                                         values_from = Abundance))
  m1[is.na(m1)] <- 0
  return(m1)
}
