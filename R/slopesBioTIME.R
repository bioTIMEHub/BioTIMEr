#' Get Linear Regressions BioTIME
#'
#' @export
#' @param x output from \code{\link{getAlphaMetrics}} or \code{\link{getBetaMetrics}}
#'  functions
#' @param divType (character) Can be "alpha" or "beta"
#' @param pThreshold (numeric)
#' @returns a dataframe with yearly diversity results merged with results of
#' linear regressions (intercept, slope, p-value, significance)
#' @importFrom dplyr %>%
#' @examples
#'   x <- data.frame(
#'     resamp = 1L,
#'     YEAR = rep(rep(2010:2015, each = 4), times = 4),
#'     Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
#'     ABUNDANCE = rpois(24 * 8, 10),
#'     assemblageID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   alpham <- getAlphaMetrics(x, "A")
#'   getLinearRegressions(x = alpham, divType = "alpha", pThreshold = 0.01)
#'   betam <- getBetaMetrics(x = x, "A")
#'   getLinearRegressions(x = betam, divType = "beta")
#'

getLinearRegressions <- function(x, divType, pThreshold = 0.05) {

  checkmate::assert_choice(divType, choices = c("alpha", "beta"))
  checkmate::assert_number(pThreshold, na.ok = FALSE, null.ok = FALSE,
                           finite = TRUE, lower = 0)

  base::switch(
    divType,
    alpha = {
      checkmate::assert_names(
        x = colnames(x), what = "colnames",
        must.include = c("assemblageID", "YEAR", "S", "N", "Simpson",
                         "invSimpson", "DomMc", "PIE", "expShannon",
                         "Shannon"))

      x <- subset(x, S != 1)

      y <- x %>%
        dplyr::group_by(assemblageID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(YEAR)) %>%
        dplyr::filter(nsp < 3)

      x <- dplyr::anti_join(x, y, by = "assemblageID")

      dft <- data.frame()
      for (id in unique(x$assemblageID)) {
        dfits <- c()
        f1 <- subset(x, assemblageID == id)
        fitd <- stats::lm(f1$S ~ f1$YEAR, )
        fits <- stats::lm(f1$N ~ f1$YEAR)
        fitt <- stats::lm(f1$Simpson ~ f1$YEAR)
        fite <- stats::lm(f1$invSimpson ~ f1$YEAR)
        fitf <- stats::lm(f1$DomMc ~ f1$YEAR)
        fitg <- stats::lm(f1$PIE ~ f1$YEAR)
        fith <- stats::lm(f1$expShannon ~ f1$YEAR)
        fiti <- stats::lm(f1$Shannon ~ f1$YEAR)

        suppressWarnings({
          dfits <- c(dfits, id,
                     fitd$coef[[2L]], summary(fitd)$coefficients[2L, 4L],
                     fits$coef[[2L]], summary(fits)$coefficients[2L, 4L],
                     fitt$coef[[2L]], summary(fitt)$coefficients[2L, 4L],
                     fite$coef[[2L]], summary(fite)$coefficients[2L, 4L],
                     fitf$coef[[2L]], summary(fitf)$coefficients[2L, 4L],
                     fitg$coef[[2L]], summary(fitg)$coefficients[2L, 4L],
                     fith$coef[[2L]], summary(fith)$coefficients[2L, 4L],
                     fiti$coef[[2L]], summary(fiti)$coefficients[2L, 4L],
                     fitd$coef[[1L]], fits$coef[[1L]], fitt$coef[[1L]],
                     fite$coef[[1L]], fitf$coef[[1L]], fitg$coef[[1L]],
                     fith$coef[[1L]], fiti$coef[[1L]])
          dft <- rbind(dft, dfits)
        })
      }
      variables <- c("S", "N", "simp", "invS", "domM", "PIE", "expSh", "shan")
      colnames(dft) <- c("assemblageID",
                         paste0(rep(variables, each = 2L), c("S", "Pval")),
                         paste0(variables, "I"))

      dft[, 2L:25L] <- apply(dft[, 2L:25L], 2,
                             function(x) as.numeric(as.character(x)))
      dft <- dft %>% dplyr::mutate(
        sp =  dplyr::if_else(SPval < pThreshold, 1, 0),
        np =  dplyr::if_else(NPval < pThreshold, 1, 0),
        sip = dplyr::if_else(simpPval < pThreshold, 1, 0),
        isp = dplyr::if_else(invSPval < pThreshold, 1, 0),
        dmp = dplyr::if_else(domMPval < pThreshold, 1, 0),
        pp =  dplyr::if_else(PIEPval < pThreshold, 1, 0),
        esp = dplyr::if_else(expShPval < pThreshold, 1, 0),
        shp = dplyr::if_else(shanPval < pThreshold, 1, 0)
      )

      ###############################################
      d1 <- dplyr::select(dft, assemblageID, S = SS, N = NS, Simpson = simpS,
                          invSimpson = invSS, DomMc = domMS,
                          PIE = PIES, expShannon = expShS, Shannon = shanS) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "slope")

      d2 <- dplyr::select(dft, assemblageID, S = SPval, N = NPval, Simpson = simpPval,
                          invSimpson = invSPval, DomMc = domMPval,
                          PIE = PIEPval, expShannon = expShPval,
                          Shannon = shanPval) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "p-values")

      d4 <- dplyr::select(dft, assemblageID, S = sp, N = np, Simpson = sip,
                          invSimpson = isp, DomMc = dmp, PIE = pp,
                          expShannon = esp, Shannon = shp) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "significance")

      d8 <- dplyr::select(dft, assemblageID, S = SI, N = NI, Simpson = simpI,
                          invSimpson = invSI, DomMc = domMI,
                          PIE = PIEI, expShannon = expShI, Shannon = shanI) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "intercept")

      d6 <- tidyr::pivot_longer(x, -c(assemblageID, YEAR),
                                names_to = "metric",
                                values_to = "diversity")

      dftx <- dplyr::left_join(d6, d1, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d2, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d4, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d8, by = c("assemblageID", "metric")) %>%
        as.data.frame()
    },
    ###############################################
    beta = {
      checkmate::assert_names(
        x = colnames(x), what = "colnames",
        must.include = c("YEAR", "assemblageID", "JaccardDiss", "MorisitaHornDiss",
                         "BrayCurtisDiss"))

      x <- dplyr::filter(x, !is.na(JaccardDiss) &
                           !is.na(MorisitaHornDiss) &
                           !is.na(BrayCurtisDiss))

      y <- x %>%
        dplyr::group_by(assemblageID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(YEAR)) %>%
        dplyr::filter(nsp < 3)

      x <- dplyr::anti_join(x, y, by = "assemblageID")

      dft <- data.frame()
      for (id in unique(x$assemblageID)) {
        dfits <- c()
        f1 <- dplyr::filter(x, assemblageID == id)
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
        jdp = dplyr::if_else(jdPval < pThreshold, 1, 0),
        mhp = dplyr::if_else(mhPval < pThreshold, 1, 0),
        bcp = dplyr::if_else(bcPval < pThreshold, 1, 0)
      )

      #####################################
      d1 <- dplyr::select(dft, assemblageID, JaccardDiss = jdS,
                          MorisitaHornDiss = mhS, BrayCurtisDiss = bcS) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "slope")

      d2 <- dplyr::select(dft, assemblageID, JaccardDiss = jdPval,
                          MorisitaHornDiss = mhPval,
                          BrayCurtisDiss = bcPval) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "p-values")

      d4 <- dplyr::select(dft, assemblageID, JaccardDiss = jdp,
                          MorisitaHornDiss = mhp,
                          BrayCurtisDiss = bcp) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "significance")

      d8 <- dplyr::select(dft, assemblageID, JaccardDiss = jdI,
                          MorisitaHornDiss = mhI, BrayCurtisDiss = bcI) %>%
        tidyr::pivot_longer(-assemblageID, names_to = "metric",
                            values_to = "intercept")

      d6 <- tidyr::pivot_longer(x, -c(assemblageID, YEAR),
                                names_to = "metric",
                                values_to = "dissimilarity")

      dftx <- dplyr::left_join(d6, d1, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d2, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d4, by = c("assemblageID", "metric")) %>%
        dplyr::left_join(d8, by = c("assemblageID", "metric")) %>%
        as.data.frame()
    })
  return(dftx)
}

