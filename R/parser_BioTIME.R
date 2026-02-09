#' Function splitting SAMPLE_DESC in various columns based on SAMPLE_DESC_NAME
#' @param x SAMPLE_DESC or a column that contains data values to split
#' @param format SAMPLE_DESC_NAME or a column containing the structure or format
#'    to organise codes into columns.
#' @param pattern A string to split \code{x} and \code{format} by. Passed to
#'     \code{\link[stringi]{stri_split_fixed}}.
#'
#' @returns A \code{data.frame} with column names extracted from the
#' \code{format} strings. If there were mismatches between \code{x} and
#' \code{format} strings, \code{error_x} and \code{error_format} columns show
#' problematic values.
#'
#' @examples
#'    x <- c("T1_23.1212_56.2346_1995_12_30", "786_-60.4567_0.346_2027")
#'    format <- c("transect_lon_lat_year_month_day", "depth_lat_lon_year")
#'    parser_BioTIME(x, format, "_")
#'
#'   dt <- data.frame(
#'     code = rep(
#'       c("T1_23.1212_56.2346_1995_12_30","786_-60.4567_0.346_2027"),
#'       each = 10
#'     ),
#'     name = rep(
#'       c("transect_lon_lat_year_month_day", "depth_lat_lon_year"),
#'       each = 10
#'     )
#'   )
#'
#'   parser_BioTIME(dt$code, dt$name, "_")
#'
#'   dplyr::mutate(dt, parser_BioTIME(code, name, "_"))
#'
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_logical
#' @importFrom checkmate assert_string
#' @importFrom data.table rbindlist
#' @importFrom stats setNames
#' @importFrom stringi stri_split_fixed
#' @export
# See benchmarks.R for a benchmarking of this function vs other versions

parser_BioTIME <- function(x, format, pattern, verbose = TRUE) {
  assert_character(x, any.missing = FALSE)
  assert_character(format, any.missing = FALSE)
  assert_string(pattern, na.ok = FALSE, null.ok = FALSE)
  assert_logical(verbose, any.missing = FALSE, len = 1L)

  formats <- stri_split_fixed(str = format, pattern = pattern)
  x <- stri_split_fixed(str = x, pattern = pattern)

  res <- lapply(seq_along(x), function(i) {
    if (length(x[[i]]) == length(formats[[i]])) {
      x[[i]] |>
        t() |>
        as.data.frame() |>
        setNames(nm = formats[[i]])
    } else {
      data.frame(
        error_x = paste(x[[i]], collapse = pattern),
        error_format = paste(formats[[i]], collapse = pattern)
      )
    }
  }) |>
    rbindlist(fill = TRUE) |>
    as.data.frame()

  if (
    verbose &&
      (any(grepl(pattern = "error_", x = colnames(res), fixed = TRUE)) ||
        # grepl(pattern = "error_format", x = colnames(res)) ||
        anyNA(colnames(res)))
  ) {
    warning(
      "Unmatched valus between x and format, inspect `error_x` and `error_format` columns."
    )
  }
  return(res)
}
