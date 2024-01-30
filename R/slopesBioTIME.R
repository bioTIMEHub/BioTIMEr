#' Get Linear Regressions BioTIME
#'
#' @export
#' @param x output from getAlphaMetrics() or getBetaDissimilarity() functions
#' @param divType calculate regressions of alpha or beta results
#' @returns a dataframe with yearly diversity results merged with results of
#' linear regressions (intercept, slope, p-value, significance)
#' @importFrom dplyr %>%
#' @examples
#'   x <- data.frame(
#'     Year = rep(rep(2010:2015, each = 4), times = 4),
#'     Species = c(replicate(n = 8L, sample(letters, 24L, replace = FALSE))),
#'     Abundance = rpois(24 * 8, 10),
#'     rarefyID = rep(LETTERS[1L:8L], each = 24)
#'   )
#'   alpham <- getAlphaMetrics(x, "A")
#'   getLinearRegressions(x = alpham, divType = "alpha")
#'   betam <- getBetaDissimilarity(x = x, "A")
#'   getLinearRegressions(x = betam, divType = "beta")
#'

getLinearRegressions <- function(x, divType) {

  checkmate::assert_choice(divType, choices = c("beta", "alpha"))

  base::switch(
    divType,
    alpha = {
      checkmate::assert_names(
        x = colnames(x),
        must.include = c("rarefyID", "Year", "S", "N", "Simpson",
                         "invSimpson", "DomMc", "PIE", "expShannon",
                         "Shannon"))

      x <- dplyr::filter(x, S != 1)

      y <- x %>%
        dplyr::group_by(rarefyID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(Year)) %>%
        dplyr::filter(nsp < 3)

      x <- dplyr::anti_join(x, y, by = "rarefyID")

      dft <- data.frame()
      for (id in unique(x$rarefyID)) {
        dfits <- c()
        f1 <- subset(x, rarefyID == id)
        fitd <- stats::lm(f1$S ~ f1$Year, )
        fits <- stats::lm(f1$N ~ f1$Year)
        fitt <- stats::lm(f1$Simpson ~ f1$Year)
        fite <- stats::lm(f1$invSimpson ~ f1$Year)
        fitf <- stats::lm(f1$DomMc ~ f1$Year)
        fitg <- stats::lm(f1$PIE ~ f1$Year)
        fith <- stats::lm(f1$expShannon ~ f1$Year)
        fiti <- stats::lm(f1$Shannon ~ f1$Year)

        suppressWarnings({
          dfits <- c(dfits, id,
                     fitd$coef[[2L]], summary(fitd)$coefficients[2, 4],
                     fits$coef[[2L]], summary(fits)$coefficients[2, 4],
                     fitt$coef[[2L]], summary(fitt)$coefficients[2, 4],
                     fite$coef[[2L]], summary(fite)$coefficients[2, 4],
                     fitf$coef[[2L]], summary(fitf)$coefficients[2, 4],
                     fitg$coef[[2L]], summary(fitg)$coefficients[2, 4],
                     fith$coef[[2L]], summary(fith)$coefficients[2, 4],
                     fiti$coef[[2L]], summary(fiti)$coefficients[2, 4],
                     fitd$coef[[1L]], fits$coef[[1L]], fitt$coef[[1L]],
                     fite$coef[[1L]], fitf$coef[[1L]], fitg$coef[[1L]],
                     fith$coef[[1L]], fiti$coef[[1L]])
          dft <- rbind(dft, dfits)
        })
      }
      variables <- c("S", "N", "simp", "invS", "domM", "PIE", "expSh", "shan")
      colnames(dft) <- c("rarefyID",
                         paste0(rep(variables, each = 2L), c("S", "Pval")),
                         paste0(variables, "I"))

      dft[, 2L:25L] <- apply(dft[, 2L:25L], 2,
                             function(x) as.numeric(as.character(x)))
      dft <- dft %>% dplyr::mutate(
        sp =  dplyr::if_else(SPval < .05, 1, 0),
        np =  dplyr::if_else(NPval < .05, 1, 0),
        sip = dplyr::if_else(simpPval < .05, 1, 0),
        isp = dplyr::if_else(invSPval < .05, 1, 0),
        dmp = dplyr::if_else(domMPval < .05, 1, 0),
        pp =  dplyr::if_else(PIEPval < .05, 1, 0),
        esp = dplyr::if_else(expShPval < .05, 1, 0),
        shp = dplyr::if_else(shanPval < .05, 1, 0)
      )

      ###############################################
      d1 <- dplyr::select(dft, rarefyID, S = SS, N = NS, Simpson = simpS,
                          invSimpson = invSS, DomMc = domMS,
                          PIE = PIES, expShannon = expShS, Shannon = shanS) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "slopes")

      d2 <- dplyr::select(dft, rarefyID, S = SPval, N = NPval, Simpson = simpPval,
                          invSimpson = invSPval, DomMc = domMPval,
                          PIE = PIEPval, expShannon = expShPval,
                          Shannon = shanPval) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "p-values")

      d4 <- dplyr::select(dft, rarefyID, S = sp, N = np, Simpson = sip,
                          invSimpson = isp, DomMc = dmp, PIE = pp,
                          expShannon = esp, Shannon = shp) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "significance")

      d8 <- dplyr::select(dft, rarefyID, S = SI, N = NI, Simpson = simpI,
                          invSimpson = invSI, DomMc = domMI,
                          PIE = PIEI, expShannon = expShI, Shannon = shanI) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "intercept")

      d6 <- tidyr::pivot_longer(x, -c(rarefyID, Year),
                                names_to = "metric",
                                values_to = "diversity")

      dftx <- dplyr::left_join(d6, d1, by = c("rarefyID", "metric")) %>%
        dplyr::left_join(d2, by = c("rarefyID", "metric")) %>%
        dplyr::left_join(d4, by = c("rarefyID", "metric")) %>%
        dplyr::left_join(d8, by = c("rarefyID", "metric")) %>%
        as.data.frame()
    },
    ###############################################
    beta = {
      checkmate::assert_names(
        x = colnames(x),
        must.include = c("Year", "rarefyID", "JaccardDiss", "MorisitaHornDiss",
                         "BrayCurtisDiss"))

      x <- dplyr::filter(x, !is.na(JaccardDiss))

      y <- x %>%
        dplyr::group_by(rarefyID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(Year)) %>%
        dplyr::filter(nsp < 3)

      x <- dplyr::anti_join(x, y, by = "rarefyID")

      dft <- data.frame()
      for (id in unique(x$rarefyID)) {
        dfits <- c()
        f1 <- dplyr::filter(x, rarefyID == id)
        fitd <- stats::lm(f1$JaccardDiss ~ f1$Year)
        fits <- stats::lm(f1$MorisitaHornDiss ~ f1$Year)
        fitt <- stats::lm(f1$BrayCurtisDiss ~ f1$Year)

        suppressWarnings({
          dfits <- c(dfits, id,
                     fitd$coef[[2L]], summary(fitd)$coefficients[2, 4],
                     fits$coef[[2L]], summary(fits)$coefficients[2, 4],
                     fitt$coef[[2L]], summary(fitt)$coefficients[2, 4],
                     fitd$coef[[1L]], fits$coef[[1L]], fitt$coef[[1L]])
          dft <- rbind(dft, dfits)
        })
      }
      colnames(dft) <- c("rarefyID", "jdS", "jdPval", "mhS", "mhPval",
                         "bcS", "bcPval", "jdI", "mhI", "bcI")
      dft[, 2L:10L] <- apply(dft[, 2L:10L], 2,
                             function(x) as.numeric(as.character(x)))
      dft <- dft %>% dplyr::mutate(
        jdp = dplyr::if_else(jdPval < .05, 1, 0),
        mhp = dplyr::if_else(mhPval < .05, 1, 0),
        bcp = dplyr::if_else(bcPval < .05, 1, 0)
      )

      #####################################
      d1 <- dplyr::select(dft, rarefyID, JaccardDiss = jdS,
                          MorisitaHornDiss = mhS, BrayCurtisDiss = bcS) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "slopes")

      d2 <- dplyr::select(dft, rarefyID, JaccardDiss = jdPval,
                          MorisitaHornDiss = mhPval,
                          BrayCurtisDiss = bcPval) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "p-values")

      d4 <- dplyr::select(dft, rarefyID, JaccardDiss = jdp,
                          MorisitaHornDiss = mhp,
                          BrayCurtisDiss = bcp) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "significance")

      d8 <- dplyr::select(dft, rarefyID, JaccardDiss = jdI,
                          MorisitaHornDiss = mhI, BrayCurtisDiss = bcI) %>%
        tidyr::pivot_longer(-rarefyID, names_to = "metric",
                            values_to = "intercept")

      d6 <- tidyr::pivot_longer(x, -c(rarefyID, Year),
                                names_to = "metric",
                                values_to = "dissimilarity")

      dftx <- dplyr::left_join(d6, d1, by = c("rarefyID", "metric")) %>%
        dplyr::left_join(d2, by = c("rarefyID", "metric")) %>%
        dplyr::left_join(d4, by = c("rarefyID", "metric")) %>%
        dplyr::left_join(d8, by = c("rarefyID", "metric")) %>%
        as.data.frame()
      #####################################
    })
  return(dftx)
}

