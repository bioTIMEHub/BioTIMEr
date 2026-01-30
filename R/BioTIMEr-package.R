#' @keywords internal
#' @description
#' The BioTIMEr package is developed in GitHub
#' (https://github.com/bioTIMEHub/BioTIMEr). To see the preferable citation of
#' the package, type citation("BioTIMEr"). The associated vignette includes an
#' introduction to the functions, how to apply them as well as some hints on how
#' to quantify and visualise temporal biodiversity change for a given BioTIME
#' dataset.
#'
"_PACKAGE"
.datatable.aware <- TRUE

## usethis namespace: start
utils::globalVariables(c(
  ".",
  ".data",
  "..measure",
  ".SD",
  ":=",
  "assemblageID",
  "SAMPLE_DESC",
  "STUDY_ID",
  "YEAR",
  "Species",
  "minsamp",
  "resamp",
  "metric",
  "intercept",
  "pvalue"
))
## usethis namespace: end
NULL
