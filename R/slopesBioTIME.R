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
#' \code{metric ~ year}. Note that assemblages with less than 3 time points
#' and/or single species time series are removed.
#'
#' @importFrom stats lm
#' @importFrom stats na.omit
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
  if (inherits(x, "alpha")) {
    assert_number(
      p_threshold,
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
    x <- na.omit(
      x,
      cols = c("JaccardDiss", "MorisitaHornDiss", "BrayCurtisDiss")
    )
    return(slopes_core(x, p_threshold) |> as.data.frame())
  }

  stop("x must be of class 'alpha' or 'beta'")
}


#' @keywords internal
#' @importFrom broom tidy
#' @importFrom data.table fifelse
#' @importFrom data.table uniqueN
#' @importFrom dplyr any_of
#' @importFrom dplyr bind_rows
#' @importFrom dplyr filter
#' @importFrom dplyr lag
#' @importFrom dplyr mutate
#' @importFrom dplyr rename
#' @importFrom dplyr select
#' @importFrom stats lm
#' @importFrom tidyr pivot_wider
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

  string_formula <- sprintf(
    "cbind(%s) ~ YEAR",
    toString(setdiff(names(x), c("assemblageID", "resamp", "YEAR")))
  )

  x |>
    nest(.by = any_of(c("assemblageID", "resamp"))) |>
    rename("temporary_column" = "data") |>
    mutate(
      models = lapply(temporary_column, function(df) {
        lm(string_formula, data = df) |> tidy()
      })
    ) |>
    select(-"temporary_column") |>
    unnest(cols = "models") |>
    pivot_wider(names_from = "term", values_from = "estimate") |>
    rename(
      metric = "response",
      pvalue = "p.value",
      intercept = "(Intercept)",
      slope = "YEAR"
    ) |>
    mutate(
      "significance" = fifelse(
        test = pvalue < p_threshold,
        yes = 1L,
        no = 0L
      ),
      metric = as.factor(metric),
      # lag() moves the intercept (row N) to align with the slope (row N+1),
      # because pivot_wider produces two rows per metric: one for "(Intercept)"
      # and one for "YEAR", with the other estimate column as NA in each row.
      intercept = lag(intercept)
    ) |>
    filter(!is.na(intercept)) |>
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
