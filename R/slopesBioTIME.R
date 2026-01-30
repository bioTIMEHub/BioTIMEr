#' Get Linear Regressions BioTIME
#'
#' Fits linear regression models to \code{\link{getAlphaMetrics}} or
#' \code{\link{getBetaMetrics}} outputs
#' @export
#' @param x (\code{data.frame}) BioTIME data table in the format of the output
#' of \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} functions
#' @param pThreshold (\code{numeric}) P-value threshold for statistical
#' significance
#'
#' @returns Returns a single long \code{data.frame} with results of linear
#' regressions (slope, p-value, significance, intercept) for each
#' \code{assemblageID}.
#'
#' @details The function \code{getLinearRegression} fits simple linear
#' regression models (see \code{\link[stats]{lm}} for details) for a given
#' output ('data') of either \code{\link{getAlphaMetrics}} or
#' \code{\link{getBetaMetrics}} function. The typical model has the form
#' \code{metric ~ year}. Note that assemblages with less than 3 time points
#' and/or single species time series are removed.
#'
#' @importFrom stats lm
#' @importFrom stats na.omit
#' @importFrom checkmate assert_choice
#' @importFrom checkmate assert_number
#' @importFrom checkmate assert_names
#'
#' @examples
#'
#' x <- gridding(BTsubset_meta, BTsubset_data) |>
#' resampling(measure = "BIOMASS", verbose = FALSE, resamps = 2)
#'
#'   alpham <- getAlphaMetrics(x, "BIOMASS")
#'
#' getLinearRegressions(x = alpham, pThreshold = 0.01) |> head(10)
#'
#'   betam <- getBetaMetrics(x = x, "BIOMASS")
#'
#' getLinearRegressions(x = betam) |> head(10)
#'
getLinearRegressions <- function(x, pThreshold = 0.05) {
  UseMethod("getLinearRegressions")
}

#' @export
getLinearRegressions.alpha <- function(x, pThreshold = 0.05) {
  assert_number(
    pThreshold,
    na.ok = FALSE,
    null.ok = FALSE,
    finite = TRUE,
    lower = 0,
    upper = 1
  )

  assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c(
      "assemblageID",
      "YEAR",
      "S",
      "N",
      "maxN",
      "Shannon",
      "expShannon",
      "Simpson",
      "invSimpson",
      "PIE",
      "DomMc"
    )
  )
  class(x) <- setdiff(class(x), "alpha")
  x <- base::subset(x, x$S != 1)

  dftx <- slopes_core(x, pThreshold)

  return(dftx |> as.data.frame())
}

#' @export
getLinearRegressions.beta <- function(x, pThreshold = 0.05) {
  assert_names(
    x = colnames(x),
    what = "colnames",
    must.include = c(
      "assemblageID",
      "YEAR",
      "JaccardDiss",
      "MorisitaHornDiss",
      "BrayCurtisDiss"
    )
  )
  class(x) <- setdiff(class(x), "beta")
  x <- na.omit(
    x,
    cols = c("JaccardDiss", "MorisitaHornDiss", "BrayCurtisDiss")
  )

  dftx <- slopes_core(x, pThreshold)

  return(dftx |> as.data.frame())
}

#' @keywords internal
#' @importFrom broom tidy
#' @importFrom dplyr filter
#' @importFrom dplyr bind_rows
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr rename
#' @importFrom dplyr lag
#' @importFrom tidyr pivot_wider

slopes_core <- function(x, pThreshold) {
  # See benchmarks.R # counting one year studies
  three_year_assemblages <- tapply(x$YEAR, x$assemblageID, function(y) {
    data.table::uniqueN(y) < 3L
  })

  if (any(three_year_assemblages)) {
    # See benchmarks.R  # Row filtering ----
    x <- x |>
      filter(
        is.element(
          assemblageID,
          names(three_year_assemblages)[which(!three_year_assemblages)]
        )
      )
  }

  sapply(
    unique(x$assemblageID),
    function(id) {
      string_formula <- sprintf(
        "cbind(%s) ~ YEAR",
        toString(setdiff(names(x), c("assemblageID", "YEAR")))
      )

      lm(
        string_formula,
        data = subset(x, x$assemblageID == id)
      ) |>
        tidy()
    },
    simplify = FALSE,
    USE.NAMES = TRUE
  ) |>
    bind_rows(.id = "assemblageID") |>
    pivot_wider(names_from = "term", values_from = "estimate") |>
    rename(
      metric = "response",
      pvalue = "p.value",
      intercept = "(Intercept)",
      slope = "YEAR"
    ) |>
    mutate(
      "significance" = data.table::fifelse(
        test = pvalue < pThreshold,
        yes = 1L,
        no = 0L
      ),
      metric = as.factor(metric),
      intercept = lag(intercept)
    ) |>
    filter(!is.na(intercept)) |>
    select(
      "assemblageID",
      "metric",
      "slope",
      "pvalue",
      "significance",
      "intercept"
    )
}
