#' Alpha diversity metrics
#'
#' Calculates a set of standard alpha diversity metrics
#' @param x (\code{data.frame}) BioTIME data in the format of the output of the
#'    \code{\link{resampling}} function.
#' @param measure (\code{character}) chosen currency defined by a single
#'    column name.
#'
#' @details
#' The function \code{getAlphaMetrics} computes nine alpha diversity metrics for
#' a given community data frame, where \code{measure} is a character input
#' specifying the abundance or biomass field used for the calculations. For each
#' row of the data frame with data, \code{getAlphaMetrics} calculates
#' the following metrics:
#'
#' - Species richness (\code{S}) as the total number of species in each year with
#' currency > 0.
#'
#' - Numerical abundance (\code{N}) as the total currency (sum) in each year
#' (either total abundance or total biomass).
#'
#' - Maximum Numerical abundance (maxN) as the highest currency value reported
#' in each year.
#'
#' - Shannon or Shannon–Weaver index is calculated as \eqn{\sum_{i}p_{i}log_{b}p_{i}},
#' where \eqn{p_{i}} is the proportional abundance of species i and b is the base
#' of the logarithm (natural logarithms), while exponential Shannon is given by
#' \code{exp(Shannon)}.
#'
#' - Simpson's index is calculated as \eqn{1-sum(p_{i}^{2})}, while Inverse
#' Simpson as \eqn{1/sum(p_{i}^{2})}.
#'
#' - McNaughton's Dominance is calculated as the sum of the pi of the two most
#' abundant species.
#'
#' - Probability of intraspecific encounter or PIE is calculated as
#' \eqn{\left(\frac{N}{N-1}\right)\left(1-\sum_{i=1}^{S}\pi_{i}^{2}\right)}.
#'
#'  Note that the input data frame needs to be in the format of the output of the
#'  \code{\link{gridding}} function and/or \code{\link{resampling}} functions,
#'  which includes keeping the default BioTIME data column names. If such columns
#'  are not found an error is issued and the computations are halted.
#'
#' @returns Returns a \code{data.frame} with results for species richness (\code{S}), numerical
#'  abundance (\code{N}), maximum numerical abundance (\code{maxN}), Shannon Index (\code{Shannon}),
#'  Exponential Shannon (\code{expShannon}), Simpson's Index (Simpson), Inverse Simpson
#'  (\code{InvSimpson}), Probability of intraspecific encounter (\code{PIE}) and McNaughton's
#'  Dominance (\code{DomMc}) for each year and \code{assemblageID}.
#' @export
#'
#' @examples
#'   gridding(BTsubset_meta, BTsubset_data) |>
#'     resampling(measure = "BIOMASS", resamps = 1) |>
#'     getAlphaMetrics(measure = "BIOMASS") |>
#'     head(10)
#'
#'   # Metric values for several resamplings
#'   gridding(BTsubset_meta, BTsubset_data) |>
#'     resampling(measure = "BIOMASS", resamps = 2) |>
#'     getAlphaMetrics(measure = "BIOMASS") |>
#'     head(10)
#'
#'   # Mean and sd values of the metrics for several resamplings
#'   gridding(BTsubset_meta, BTsubset_data) |>
#'     resampling(measure = "BIOMASS", resamps = 2) |>
#'     getAlphaMetrics(measure = "BIOMASS") |>
#'     dplyr::summarise(
#'        dplyr::across(
#'           .cols = !resamp,
#'           .fns = c(mean = mean, sd = sd)),
#'        .by = c(assemblageID, YEAR)) |>
#'     tidyr::pivot_longer(
#'        col = dplyr::contains("_"),
#'        names_to = c("metric", "stat"),
#'        names_sep = "_",
#'        names_transform = as.factor) |>
#'     tidyr::pivot_wider(names_from = stat) |>
#'     head(10)
#'
getAlphaMetrics <- function(x, measure) {
  base::stopifnot(
    "'measure' must be either ABUNDANCE or BIOMASS" = length(measure) == 1L &&
      is.element(measure, c("BIOMASS", "ABUNDANCE"))
  )

  checkmate::assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c(measure, "resamp", "YEAR", "Species", "assemblageID")
  )

  x <- na.omit(x, cols = measure)
  # When measure = c("ABUNDANCE","BIOMASS"), only sites and years where there
  # are values for both biomass and abundance are kept.

  res <- x |>
    dplyr::filter(
      dplyr::n_distinct(YEAR) > 1L && dplyr::n_distinct(Species) > 1L,
      .by = c(resamp, assemblageID)
    ) |>
    dplyr::summarise(
      dplyr::across(
        .cols = dplyr::all_of(measure),
        .fns = ~ getAlpha(sort(.x, decreasing = TRUE))
      ),
      .by = c(resamp, assemblageID, YEAR)
    ) |>
    tidyr::unnest_wider(
      col = -c(resamp, assemblageID, YEAR),
      names_sep = "_"
    ) |>
    dplyr::rename_with(.fn = ~ sub("^.*_", "", .x, FALSE, TRUE))
  # tidyr::pivot_longer(
  #   cols = -c(resamp, assemblageID, YEAR),
  #   names_to = c("measure", "metric"),
  #   names_sep = "_",
  #   names_transform = as.factor
  # )

  class(res) <- c("alpha", class(res))

  return(res)
}

#' Alpha
#' @param x (\code{data.frame}) First column has to be year and following columns
#'    contain species abundances.
#' @keywords internal
#' @returns A data frame with results for S (species richness), N (numerical abundance),
#'    maximum N per year per assemblage, Shannon, Exponential Shannon, Simpson,
#'    Inverse Simpson, PIE (probability of intraspecific encounter) and
#'    McNaughton's Dominance.
#' @examples \dontrun{
#' # 1 site, 1 year in long format, ordered by ABUNDANCE or BIOMASS
#' x <- data.frame(species = letters[1:6], x = 6:1)
#' getAlpha(x$x)
#' }
getAlpha <- function(x) {
  S <- sum(x > 0)
  N <- sum(x)
  maxN <- max(x)

  DomMc <- if (length(x) != 1L) (x[[1L]] + x[[2L]]) / N else 1

  PIE <- (N / (N - 1)) * (1 - sum((x / N)^2))

  x <- x / N
  Shannon <- sum(-x * log(x), na.rm = TRUE)
  H <- sum(x * x, na.rm = TRUE) # Could be faster and correct if FALSE?

  return(
    data.frame(
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
#'    \code{\link{resampling}} functions.
#' @param measure (\code{character}) chosen currency defined by a single column name.
#'
#' @details
#' The function getBetaMetrics computes three beta diversity metrics for a given
#' community data frame, where \code{measure} is a character input specifying the
#' abundance or biomass field used for the calculations. \code{getBetaMetrics}
#' calls the \code{\link[vegan]{vegdist}} function which calculates for each row
#' the following metrics: Jaccard dissimilarity (\code{method = "jaccard"}),
#' Morisita-Horn dissimilarity (\code{method = "horn"}) and Bray-Curtis dissimilarity
#' (\code{method = "bray"}). Here, the dissimilarity metrics are calculated against
#' the baseline year of each assemblage time series i.e.
#' the first year of each time series.
#' Note that the input data frame needs to be in the format of the output of the
#'  \code{\link{gridding}} and/or \code{\link{resampling}} functions, which
#' includes keeping the default BioTIME data column names. If such columns are
#' not found an error is
#'  issued and the computations are halted.
#'
#' @returns Returns a \code{data.frame} with results for Jaccard dissimilarity
#' (\code{JaccardDiss}), Morisita-Horn dissimilarity (\code{MorisitaHornDiss}),
#' and Bray-Curtis dissimilarity (\code{BrayCurtsDiss}) for each year and
#' \code{assemblageID}.
#' @examples
#' gridding(BTsubset_meta, BTsubset_data) |>
#'   resampling(measure = "BIOMASS", verbose = FALSE, resamps = 1) |>
#'   getBetaMetrics(measure = "BIOMASS") |>
#'   head()
#' gridding(BTsubset_meta, BTsubset_data) |>
#'   resampling(measure = "BIOMASS", verbose = FALSE, resamps = 2) |>
#'   getBetaMetrics(measure = "BIOMASS") |>
#'   head()

getBetaMetrics <- function(x, measure) {
  base::stopifnot(
    "'measure' must be either ABUNDANCE or BIOMASS" = length(measure) == 1L &&
      is.element(measure, c("BIOMASS", "ABUNDANCE"))
  )

  checkmate::assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c(measure, "YEAR", "Species", "assemblageID")
  )

  x <- na.omit(x, cols = measure)

  xd <- x |>
    dplyr::group_by(resamp, assemblageID) |>
    dplyr::filter(
      dplyr::n_distinct(YEAR) > 1L && dplyr::n_distinct(Species) > 1L
    ) |>
    dplyr::reframe(
      dplyr::pick("YEAR", "Species", dplyr::all_of(measure)) |>
        tidyr::pivot_wider(
          names_from = "Species",
          values_from = dplyr::all_of(measure),
          values_fill = 0
        ) |>
        getBeta()
    )

  class(xd) <- c("beta", class(xd))
  return(xd)
}

#' Beta
#' @param x (\code{data.frame}) First column has to be year and following columns
#' contain species abundances.
#' @returns getBeta returns a data.frame with three beta diversity dissimilarity
#' metrics
#' @importFrom vegan vegdist
#' @keywords internal

getBeta <- function(x) {
  yr <- unique(x[, 1L])
  x <- x[, -1L]
  xb <- x
  xb[xb > 1] <- 1
  getj <- vegan::vegdist(xb, "jaccard") #10
  getmh <- vegan::vegdist(x, "horn") #8
  getbc <- vegan::vegdist(x, "bray") #4

  jacc <- c(1, getj[1L:nrow(x)])[-1]
  mh <- c(1, getmh[1L:nrow(x)])[-1]
  bc <- c(1, getbc[1L:nrow(x)])[-1]

  xf <- data.frame(
    YEAR = yr,
    JaccardDiss = jacc,
    MorisitaHornDiss = mh,
    BrayCurtisDiss = bc
  )
  return(xf)
}
