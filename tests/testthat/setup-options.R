# Snapshots record printed tables, so the printing options must not depend on
# the .Rprofile of whoever runs the tests (testthat resets width and colours,
# but not digits). Restored when the test run ends.
withr::local_options(
  digits = 7,
  scipen = 0,
  OutDec = ".",
  .local_envir = testthat::teardown_env()
)
