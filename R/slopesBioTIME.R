#' Get Linear Regressions BioTIME
#'
#' Fits linear regression models to \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} outputs
#' @export
#' @param x (`data.frame`) BioTIME data table in the format of the output of  \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}}
#'  functions
#' @param divType (`character`) string specifying the nature of the metrics in
#' the data; either `divType = "alpha"` or `divType = "beta"` are supported
#' @param pThreshold (`numeric`) P-value threshold for statistical significance
#'
#' @returns Returns a single long `data.frame` with results of linear regressions
#' (slope, p-value, significance, intercept) for each `assemblageID`.
#'
#' @details
#' The function `getLinearRegressions` fits simple linear regression models
#' (see \code{\link[stats]{lm}} for details) for a given output ('data') of
#' either \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}} function.
#' `divType` needs to be specified in agreement with x.
#' The typical model has the form `metric ~ year`. Note that assemblages with
#' less than 3 time points and/or single species time series are removed.
#'
#' @importFrom dplyr %>%
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

  checkmate::assert_choice(divType, choices = c("alpha", "beta"))
  checkmate::assert_number(pThreshold, na.ok = FALSE, null.ok = FALSE,
                           finite = TRUE, lower = 0, upper = 1)

  base::switch(
    divType,
    alpha = {
      checkmate::assert_names(
        x = colnames(x), what = "colnames",
        must.include = c("assemblageID", "YEAR", "S", "N", "maxN",
                         "Shannon", "expShannon", "Simpson",
                         "invSimpson", "PIE", "DomMc"))

      x <- subset(x, x$S != 1)

      y <- x %>%
        dplyr::group_by(.data$assemblageID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(.data$YEAR)) %>%
        dplyr::filter(.data$nsp < 3)

      x <- dplyr::anti_join(x, y, by = "assemblageID")

      dft <- data.frame()
      for (id in unique(x$assemblageID)) {
        dfits <- c()
        f1 <- subset(x, x$assemblageID == id)
        fitS <- stats::lm(f1$S ~ f1$YEAR, )
        fitN <- stats::lm(f1$N ~ f1$YEAR)
        fitm <- stats::lm(f1$maxN ~ f1$YEAR)
        fitSh <- stats::lm(f1$Shannon ~ f1$YEAR)
        fiteSh <- stats::lm(f1$expShannon ~ f1$YEAR)
        fitSi <- stats::lm(f1$Simpson ~ f1$YEAR)
        fitiS <- stats::lm(f1$invSimpson ~ f1$YEAR)
        fitP <- stats::lm(f1$PIE ~ f1$YEAR)
        fitD <- stats::lm(f1$DomMc ~ f1$YEAR)

        suppressWarnings({
          dfits <- c(dfits, id,
                     fitS$coef[[2L]], summary(fitS)$coefficients[2L, 4L],
                     fitN$coef[[2L]], summary(fitN)$coefficients[2L, 4L],
                     fitm$coef[[2L]], summary(fitm)$coefficients[2L, 4L],
                     fitSh$coef[[2L]], summary(fitSh)$coefficients[2L, 4L],
                     fiteSh$coef[[2L]], summary(fiteSh)$coefficients[2L, 4L],
                     fitSi$coef[[2L]], summary(fitSi)$coefficients[2L, 4L],
                     fitiS$coef[[2L]], summary(fitiS)$coefficients[2L, 4L],
                     fitP$coef[[2L]], summary(fitP)$coefficients[2L, 4L],
                     fitD$coef[[2L]], summary(fitD)$coefficients[2L, 4L],
                     fitS$coef[[1L]], fitN$coef[[1L]], fitm$coef[[1L]],
                     fitSh$coef[[1L]], fiteSh$coef[[1L]], fitSi$coef[[1L]],
                     fitiS$coef[[1L]], fitP$coef[[1L]], fitD$coef[[1L]])
          dft <- rbind(dft, dfits)
        })
      }
      variables <- c("S", "N", "maxN", "shan", "expSh", "simp", "invS", "PIE", "domM")
      colnames(dft) <- c("assemblageID",
                         paste0(rep(variables, each = 2L), c("S", "Pval")),
                         paste0(variables, "I"))

      dft[, -1L] <- apply(dft[, -1L], 2,
                          function(x) as.numeric(as.character(x)))
      dft <- dft %>% dplyr::mutate(
        sp =  dplyr::if_else(.data$SPval < pThreshold, 1, 0),
        np =  dplyr::if_else(.data$NPval < pThreshold, 1, 0),
        maxNp = dplyr::if_else(.data$maxNPval < pThreshold, 1, 0),
        shp = dplyr::if_else(.data$shanPval < pThreshold, 1, 0),
        esp = dplyr::if_else(.data$expShPval < pThreshold, 1, 0),
        sip = dplyr::if_else(.data$simpPval < pThreshold, 1, 0),
        isp = dplyr::if_else(.data$invSPval < pThreshold, 1, 0),
        pp =  dplyr::if_else(.data$PIEPval < pThreshold, 1, 0),
        dmp = dplyr::if_else(.data$domMPval < pThreshold, 1, 0),
      )

      ###############################################
      d1 <- dplyr::select(dft, "assemblageID", S = "SS", N = "NS", maxN = "maxNS",
                          Shannon = "shanS", expShannon = "expShS",
                          Simpson = "simpS", invSimpson = "invSS",
                          PIE = "PIES", DomMc = "domMS") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "slope")

      d2 <- dplyr::select(dft, "assemblageID", S = "SPval", N = "NPval", maxN = "maxNPval",
                          Shannon = "shanPval", expShannon = "expShPval",
                          Simpson = "simpPval", invSimpson = "invSPval",
                          PIE = "PIEPval", DomMc = "domMPval") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "pvalue")

      d4 <- dplyr::select(dft, "assemblageID", S = "sp", N = "np", maxN = "maxNp",
                          Shannon = "shp", expShannon = "esp",
                          Simpson = "sip", invSimpson = "isp",
                          PIE = "pp", DomMc = "dmp") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "significance")

      d8 <- dplyr::select(dft, "assemblageID", S = "SI", N = "NI", maxN = "maxNI",
                          Shannon = "shanI", expShannon = "expShI",
                          Simpson = "simpI", invSimpson = "invSI",
                          PIE = "PIEI", DomMc = "domMI") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "intercept")

      dftx <- dplyr::left_join(d1, d2, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d4, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d8, by = c("assemblageID", "metric")) %>%
        dplyr::mutate(metric = factor(.data$metric,
                                      levels = c("S", "N", "maxN",
                                                 "Shannon","expShannon",
                                                 'Simpson', "invSimpson",
                                                 "PIE", "DomMc"))) %>%
        as.data.frame()
    },


    ###############################################
    beta = {
      checkmate::assert_names(
        x = colnames(x), what = "colnames",
        must.include = c("YEAR", "assemblageID", "JaccardDiss", "MorisitaHornDiss",
                         "BrayCurtisDiss"))

      x <- subset(x, !is.na(x$JaccardDiss) &
                    !is.na(x$MorisitaHornDiss) &
                    !is.na(x$BrayCurtisDiss))

      y <- x %>%
        dplyr::group_by(.data$assemblageID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(.data$YEAR)) %>%
        dplyr::filter(.data$nsp < 3)

      x <- dplyr::anti_join(x, y, by = "assemblageID")

      dft <- data.frame()
      for (id in unique(x$assemblageID)) {
        dfits <- c()
        f1 <- dplyr::filter(x, .data$assemblageID == id)
        fitd <- stats::lm(f1$JaccardDiss ~ f1$YEAR)
        fits <- stats::lm(f1$MorisitaHornDiss ~ f1$YEAR)
        fitt <- stats::lm(f1$BrayCurtisDiss ~ f1$YEAR)

        suppressWarnings({
          dfits <- c(dfits, id,
                     fitd$coef[[2L]], summary(fitd)$coefficients[2L, 4L],
                     fits$coef[[2L]], summary(fits)$coefficients[2L, 4L],
                     fitt$coef[[2L]], summary(fitt)$coefficients[2L, 4L],
                     fitd$coef[[1L]], fits$coef[[1L]], fitt$coef[[1L]])
          dft <- rbind(dft, dfits)
        })
      }
      colnames(dft) <- c("assemblageID", "jdS", "jdPval", "mhS", "mhPval",
                         "bcS", "bcPval", "jdI", "mhI", "bcI")
      dft[, 2L:10L] <- apply(dft[, 2L:10L], 2,
                             function(x) as.numeric(as.character(x)))
      dft <- dft %>% dplyr::mutate(
        jdp = dplyr::if_else(.data$jdPval < pThreshold, 1, 0),
        mhp = dplyr::if_else(.data$mhPval < pThreshold, 1, 0),
        bcp = dplyr::if_else(.data$bcPval < pThreshold, 1, 0)
      )

      #####################################
      d1 <- dplyr::select(dft, "assemblageID", JaccardDiss = "jdS",
                          MorisitaHornDiss = "mhS", BrayCurtisDiss = "bcS") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "slope")

      d2 <- dplyr::select(dft, "assemblageID", JaccardDiss = "jdPval",
                          MorisitaHornDiss = "mhPval",
                          BrayCurtisDiss = "bcPval") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "pvalue")

      d4 <- dplyr::select(dft, "assemblageID", JaccardDiss = "jdp",
                          MorisitaHornDiss = "mhp",
                          BrayCurtisDiss = "bcp") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "significance")

      d8 <- dplyr::select(dft, "assemblageID", JaccardDiss = "jdI",
                          MorisitaHornDiss = "mhI",
                          BrayCurtisDiss = "bcI") %>%
        tidyr::pivot_longer(-"assemblageID", names_to = "metric",
                            values_to = "intercept")

      dftx <- dplyr::left_join(d1, d2, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d4, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d8, by = c("assemblageID", "metric")) %>%
        dplyr::mutate(metric = factor(.data$metric,
                                      levels = c("JaccardDiss",
                                                 "MorisitaHornDiss",
                                                 "BrayCurtisDiss"))) %>%
        as.data.frame()
    })
  return(dftx)
}

