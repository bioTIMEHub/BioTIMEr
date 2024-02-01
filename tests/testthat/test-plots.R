
# themeBioTIME
# test_that("themeBioTIME works as expected",{
#   set.seed(42)
#   data <- as.data.frame(
#     matrix(data = rpois(384, 10), ncol = 4)
#   )
#   data$PIE <- apply(data, 1, function(s) {
#     n <- sum(s)
#     (n / (n - 1)) * (1 - sum((s / n)^2))})
#   data$YEAR <- rep(rep(2010:2015, each = 4), times = 4)
#   p <- ggplot2::ggplot(data = data, ggplot2::aes(PIE, group = YEAR)) +
#     ggplot2::geom_boxplot() +
#     ggplot2::ggtitle(label = "This is a snapshotted test plot") +
#     themeBioTIME("none", 12, "black", "grey90")
#
#   vdiffr::expect_doppelganger(p)
# })
