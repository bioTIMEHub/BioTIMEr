# Slope tables contain floating-point noise for constant series (slopes of
# about 1e-16, p-values of about 1e-14) that changes with the BLAS and the
# platform. Zero those and keep a few significant digits so that snapshots
# only record values that are stable across machines.
.round_for_snapshot <- function(x, digits = 4L, zero_below = 1e-10) {
  dplyr::mutate(
    x,
    dplyr::across(
      .cols = dplyr::where(is.numeric),
      .fns = \(v) signif(replace(v, abs(v) < zero_below & !is.na(v), 0), digits)
    )
  )
}
