#' Get Linear Regressions BioTIME
#'
#' Fits linear regression models to \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} outputs
#' @export
#' @param x (\code{data.frame}) BioTIME data table in the format of the output
#' of  \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} functions
#' @param divType (\code{character}) string specifying the nature of the metrics in
#' the data; either \code{divType = "alpha"} or \code{divType = "beta"} are supported
#' @param pThreshold (\code{numeric}) P-value threshold for statistical significance
#'
#' @returns Returns a single long \code{data.frame} with results of linear regressions
#' (slope, p-value, significance, intercept) for each \code{assemblageID}.
#'
#' @details
#' The function \code{getLinearRegression} fits simple linear regression models
#' (see \code{\link[stats]{lm}} for details) for a given output ('data') of
#' either \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} function.
#' \code{divType} needs to be specified in agreement with \code{x}.
#' The typical model has the form \code{metric ~ year}. Note that assemblages with
#' less than 3 time points and/or single species time series are removed.
#' @importFrom stats lm
#' @importFrom stats na.omit
#' @importFrom checkmate assert_choice
#' @importFrom checkmate assert_number
#' @importFrom checkmate assert_names
#'
#' @examples
#'   library(BioTIMEr)
#'   x <- data.frame(
#'     resamp = 1L,
#'     YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'     Species = c(replicate(n = 8L * 6L, sample(letters[1L:10L], 4L, replace = FALSE))),
#'     ABUNDANCE = rpois(24 * 8, 10),
#'     assemblageID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   alpham <- getAlphaMetrics(x, "ABUNDANCE")
#'   getLinearRegressions(x = alpham, divType = "alpha", pThreshold = 0.01)
#'   betam <- getBetaMetrics(x = x, "ABUNDANCE")
#'   getLinearRegressions(x = betam, divType = "beta")
#'

getLinearRegressions <- function(x, divType, pThreshold = 0.05) {
  assert_choice(divType, choices = c("alpha", "beta"))
  assert_number(
    pThreshold,
    na.ok = FALSE,
    null.ok = FALSE,
    finite = TRUE,
    lower = 0,
    upper = 1
  )

  base::switch(
    divType,
    alpha = {
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

      x <- base::subset(x, x$S != 1)
      dftx <- slopes_core(x, pThreshold)
    },

    ###############################################
    beta = {
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

      x <- na.omit(
        x,
        cols = c("JaccardDiss", "MorisitaHornDiss", "BrayCurtisDiss")
      )

      dftx <- slopes_core(x, pThreshold)
    }
  )
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
  metric <- intercept <- pvalue <- NULL # to avoid CRAN NOTE
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
