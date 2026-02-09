#' Function splitting SAMPLE_DESC in various columns based on SAMPLE_DESC_NAME
#' @param x SAMPLE_DESC or a column that contains data values to split
#' @param format SAMPLE_DESC_NAME or a column containing the structure or format
#'    to organise codes into columns.
#' @param pattern A string to split \code{x} and \code{format} by. Passed to
#'     \code{\link[stringi]{stri_split_fixed}}.
#'
#' @returns A \code{data.frame}
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
#'
#' @importFrom data.table rbindlist
#' @importFrom stats setNames
#' @importFrom stringi stri_split_fixed
#' @export
# See benchmarks.R for a benchmarking of this function vs other versions
parser_BioTIME <- function(x, format, pattern) {
  checkmate::assert_character(x, any.missing = FALSE)
  checkmate::assert_character(format, any.missing = FALSE)
  checkmate::assert_string(pattern, na.ok = FALSE, null.ok = FALSE)

  formats <- stri_split_fixed(str = format, pattern = pattern)
  x <- stri_split_fixed(str = x, pattern = pattern)

  res <- lapply(seq_along(x), function(i) {
    x[[i]] |> t() |> as.data.frame() |> setNames(nm = formats[[i]])
  }) |>
    rbindlist(fill = TRUE) |>
    as.data.frame()

  if (anyNA(colnames(res))) {
    warning("Unmatched valus between x and format, NA column created.")
  }
  return(res)
}
