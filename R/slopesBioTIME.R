#' Get Linear Regressions BioTIME
#'
#' Fits linear regression models to \code{\link{getAlphaMetrics}} or
#' \code{\link{getBetaMetrics}} outputs
#' @export
#' @param x (\code{data.frame}) BioTIME data table in the format of the output
#' of \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} functions
#' @param p_threshold (\code{numeric}) P-value threshold for statistical
#' significance
#' @param pThreshold \code{r lifecycle::badge("deprecated")} Use
#'   \code{p_threshold} instead.
#'
#' @returns Returns a single long \code{data.frame} with results of linear
#' regressions (slope, p-value, significance, intercept) for each
#' \code{assemblageID}.
#'
#' @details The function \code{getLinearRegression} fits simple linear
#' regression models (see \code{\link[stats]{lm}} for details) for a given
#' output ('data') of either \code{\link{getAlphaMetrics}} or
#' \code{\link{getBetaMetrics}} function. The typical model has the form
#' \code{metric ~ year}. For alpha metrics, years with a single species
#' (\code{S == 1}) are removed first. Assemblages with less than 3 time points
#' (after this removal) are then removed. Each metric is fitted separately, so a
#' missing value in one metric (for example \code{PIE}) does not remove that
#' year from the other metrics. A metric with fewer than 3 non-missing years has
#' no regression and is left out of the result.
#'
#' @importFrom stats lm
#' @importFrom checkmate assert_choice
#' @importFrom checkmate assert_names
#' @importFrom checkmate assert_number
#' @importFrom lifecycle deprecated deprecate_warn is_present
#'
#' @examples
#'
#' x <- gridding(BTsubset_meta, BTsubset_data) |>
#' resampling(measure = "BIOMASS", verbose = FALSE, n_resamples = 2)
#'
#'   alpham <- getAlphaMetrics(x, "BIOMASS")
#'
#' getLinearRegressions(x = alpham, p_threshold = 0.01) |> head(10)
#'
#'   betam <- getBetaMetrics(x = x, "BIOMASS")
#'
#' getLinearRegressions(x = betam) |> head(10)
#'
getLinearRegressions <- function(
  x,
  p_threshold = 0.05,
  pThreshold = deprecated()
) {
  if (lifecycle::is_present(pThreshold)) {
    lifecycle::deprecate_warn(
      when = "0.3.3",
      what = "getLinearRegressions(pThreshold)",
      with = "getLinearRegressions(p_threshold)"
    )
    p_threshold <- pThreshold
  }
  assert_number(
    p_threshold,
    na.ok = FALSE,
    null.ok = FALSE,
    finite = TRUE,
    lower = 0,
    upper = 1
  )
  if (inherits(x, "alpha")) {
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
    # Years with a single species are not used for alpha metrics (rule present
    # since the first version of this function, 2023-09-28)
    x <- base::subset(x, x$S != 1)
    return(slopes_core(x, p_threshold) |> as.data.frame())
  }

  if (inherits(x, "beta")) {
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
    x <- x[
      !is.na(x[["JaccardDiss"]]) &
        !is.na(x[["MorisitaHornDiss"]]) &
        !is.na(x[["BrayCurtisDiss"]]),
    ]
    return(slopes_core(x, p_threshold) |> as.data.frame())
  }

  stop("x must be of class 'alpha' or 'beta'")
}


#' @keywords internal
#' @importFrom data.table fifelse
#' @importFrom data.table uniqueN
#' @importFrom dplyr any_of
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom dplyr rename
#' @importFrom dplyr select
#' @importFrom stats lm
#' @importFrom tidyr nest
#' @importFrom tidyr unnest

slopes_core <- function(x, p_threshold) {
  # See benchmarks/benchmarks.R # counting one year studies
  three_year_assemblages <- tapply(x$YEAR, x$assemblageID, function(y) {
    uniqueN(y) < 3L
  })

  if (any(three_year_assemblages)) {
    # See benchmarks/benchmarks.R  # Row filtering
    x <- x |>
      filter(
        is.element(
          assemblageID,
          names(three_year_assemblages)[which(!three_year_assemblages)]
        )
      )
  }

  metrics <- setdiff(names(x), c("assemblageID", "resamp", "YEAR"))

  # One model per metric: a joint cbind() model drops a year from every metric
  # as soon as one metric is NA in that year (e.g. PIE when N <= 1). One row per
  # metric is built directly from the coefficients, so constant series (NaN
  # p-value) cannot break the pairing of intercept and slope.
  fit_metrics <- function(df) {
    lapply(metrics, function(metric) {
      if (sum(!is.na(df[[metric]])) < 3L) {
        return(NULL)
      }
      # summary()$coefficients instead of broom::tidy(): same numbers, but
      # tidy() was about 75% of the run time
      coefficients <- summary(lm(df[[metric]] ~ YEAR, data = df))$coefficients
      list(
        metric = metric,
        slope = coefficients["YEAR", "Estimate"],
        pvalue = coefficients["YEAR", "Pr(>|t|)"],
        intercept = coefficients["(Intercept)", "Estimate"]
      )
    }) |>
      data.table::rbindlist()
  }

  x |>
    nest(.by = any_of(c("assemblageID", "resamp"))) |>
    rename("temporary_column" = "data") |>
    mutate(models = lapply(temporary_column, fit_metrics)) |>
    select(-"temporary_column") |>
    unnest(cols = "models") |>
    mutate(
      "significance" = fifelse(
        test = pvalue < p_threshold,
        yes = 1L,
        no = 0L
      ),
      metric = as.factor(metric)
    ) |>
    select(any_of(c(
      "assemblageID",
      "resamp",
      "metric",
      "slope",
      "pvalue",
      "significance",
      "intercept"
    )))
}
