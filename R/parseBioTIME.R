#' Function splitting SAMPLE_DESC in various columns based on SAMPLE_DESC_NAME
#' @param x SAMPLE_DESC or a column that contains data values to split
#' @param format SAMPLE_DESC_NAME or a column containing the structure or format
#'    to organise codes into columns.
#' @param sep A string to split \code{x} and \code{format} by. Passed to
#'     \code{\link[stringi]{stri_split_fixed}}.
#' @param verbose if FALSE, discrpeancies between \code{c} and \code{format}
#'    will not be shown.
#'
#' @returns A \code{data.frame} with column names extracted from the
#' \code{format} strings. If there were mismatches between \code{x} and
#' \code{format} strings, \code{error_x} and \code{error_format} columns show
#' problematic values.
#'
#' @rdname parsing-SAMPLE_DESC_NAME
#' @examples
#'    x <- c("T1_23.1212_56.2346_1995_12_30", "786_-60.4567_0.346_2027")
#'    format <- c("transect_lon_lat_year_month_day", "depth_lat_lon_year")
#'    parseBioTIME(x, format, "_")
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
#'   parseBioTIME(dt$code, dt$name, "_")
#'
#'   dplyr::mutate(dt, parseBioTIME(code, name, "_"))
#'
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_logical
#' @importFrom checkmate assert_string
#' @importFrom data.table rbindlist
#' @importFrom stats setNames
#' @importFrom stringi stri_split_fixed
#' @export
# See benchmarks.R for a benchmarking of this function vs other versions

parseBioTIME <- function(x, format, sep, verbose = TRUE) {
  assert_character(x, any.missing = FALSE)
  assert_character(format, any.missing = FALSE)
  assert_string(sep, na.ok = FALSE, null.ok = FALSE)
  assert_logical(verbose, any.missing = FALSE, len = 1L)

  formats <- stri_split_fixed(str = format, pattern = sep)
  x <- stri_split_fixed(str = x, pattern = sep)

  res <- lapply(seq_along(x), function(i) {
    if (length(x[[i]]) == length(formats[[i]])) {
      x[[i]] |>
        t() |>
        as.data.frame() |>
        setNames(nm = formats[[i]])
    } else {
      data.frame(
        error_x = paste(x[[i]], collapse = sep),
        error_format = paste(formats[[i]], collapse = sep)
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

#' Removing specific elements of SAMPLE_DESC
#' @param x SAMPLE_DESC or a vector of strings of the form
#'    'T1_23.1212_56.2346_1995_12_30'
#' @param format SAMPLE_DESC_NAME or a vector of strings of the form
#'    'depth_lat_lon_year'
#' @param sep \code{string}
#' @param exclude \code{character} vector of elements to remove
#' @returns a vector of the same length as \code{x} with strings from \code{x}
#'    where values in \code{exclude} were removed.
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_string
#' @importFrom data.table rbindlist
#' @importFrom stringi stri_split_fixed
#'
#' @rdname parsing-SAMPLE_DESC_NAME
#'
#' @export
#'
#' @examples
#' x <- c("T1_23.1212_56.2346_1995_12_30", "786_-60.4567_0.346_2027")
#' format <- c("transect_lon_lat_year_month_day", "depth_lat_lon_year")
#' exclude <- c("YEAR", "year", "month", "day")
#' sep = "_"
#' simplify_SAMPLE_DESC(x, format, "_", "year")

# ignore.case = FALSE great idea but problematic because we change format before
# pasting it back together.

simplify_SAMPLE_DESC <- function(x, format, sep, exclude) {
  assert_character(x, any.missing = FALSE)
  assert_character(format, any.missing = FALSE)
  assert_string(sep, na.ok = FALSE, null.ok = FALSE)
  assert_character(exclude, any.missing = FALSE)
  # assert_logical(ignore.case, len = 1L, any.missing = FALSE)

  formats <- stri_split_fixed(str = format, pattern = sep)
  x <- stri_split_fixed(str = x, pattern = sep)

  if (length(x) != length(formats)) {
    stop("Length of 'x' and 'format' must match.")
  }

  mismatched <- which(lengths(x) != lengths(formats))
  if (length(mismatched) > 0L) {
    stop(sprintf(
      "Token count mismatch in rows: %s",
      paste(mismatched, collapse = ", ")
    ))
  }

  sapply(
    seq_along(formats),
    function(i) {
      sel <- which(!is.element(formats[[i]], exclude))
      formats[[i]] <- paste(formats[[i]][sel], collapse = "_")
      x[[i]] <- paste(x[[i]][sel], collapse = "_")
    },
    simplify = TRUE
  )
}
