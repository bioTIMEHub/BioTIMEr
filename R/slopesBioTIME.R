#' Get Linear Regressions BioTIME
#'
#' @export
#' @param x output from getAlphaMetrics() or getBetaDissimilarity() functions
#' @param divType calculate regressions of alpha or beta results
#' @returns a dataframe with yearly diversity results merged with results of linear regressions (intercept, slope, p-value, significance)
#' @importFrom dplyr %>%

getLinearRegressions <- function(x, divType) {

  checkmate::assertChoice(divType, choices = c("beta", "alpha"))
  # suppressWarnings({

  dft <- data.frame()
  base::switch(
    divType,
    alpha = {

      x <- subset(x, S != 1)

      y <- x %>%
        dplyr::group_by(rarefyID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(Year)) %>%
        as.data.frame()

      y2 <- subset(y, nsp < 3)
      x <- subset(x, !rarefyID %in% y2$rarefyID)

      for (id in unique(x$rarefyID)) {
        dfits <- c()
        f1 <- subset(x, rarefyID == id)
        fitd <- stats::lm(f1$S ~ f1$Year)
        fits <- stats::lm(f1$N ~ f1$Year)
        fitt <- stats::lm(f1$Simpson ~ f1$Year)
        fite <- stats::lm(f1$InvSimpson ~ f1$Year)
        fitf <- stats::lm(f1$DomMc ~ f1$Year)
        fitg <- stats::lm(f1$PIE ~ f1$Year)
        fith <- stats::lm(f1$expShannon ~ f1$Year)
        fiti <- stats::lm(f1$Shannon ~ f1$Year)
        dfits <- c(dfits, id, fitd$coef[2], summary(fitd)$coefficients[2,4],
                   fits$coef[2], summary(fits)$coefficients[2,4], fitt$coef[2],
                   summary(fitt)$coefficients[2,4], fite$coef[2], summary(fite)$coefficients[2,4],
                   fitf$coef[2], summary(fitf)$coefficients[2,4], fitg$coef[2],
                   summary(fitg)$coefficients[2,4], fith$coef[2], summary(fith)$coefficients[2,4],
                   fiti$coef[2],summary(fiti)$coefficients[2,4], fitd$coef[1],
                   fits$coef[1], fitt$coef[1], fite$coef[1], fitf$coef[1],
                   fitg$coef[1], fith$coef[1], fiti$coef[1])
        dft <- rbind(dft, dfits)

      }
      colnames(dft) <- c("rarefyID", "SSl", "SPval", "NS", "NPval",
                         "simpS", "simpPval", "invSSl", "invSPval", "domMS",
                         "domMPval", "PIES", "PIEPval", "expShS", "expShPval",
                         "shanS", "shanPval", "SSI", "NI", "simpI",
                         "invSI", "domMI", "PIEI", "expShI", "shanI")

      k <- c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25)
      dft[,k] <- apply(dft[,k], 2, function(x) as.numeric(as.character(x)))
      dft$sp <- ifelse(dft$SPval < .05, 1, 0)
      dft$np <- ifelse(dft$NPval < .05, 1, 0)
      dft$sip <- ifelse(dft$simpPval < .05, 1, 0)
      dft$isp <- ifelse(dft$invSPval < .05, 1, 0)
      dft$dmp <- ifelse(dft$domMPval < .05, 1, 0)
      dft$pp <- ifelse(dft$PIEPval < .05, 1, 0)
      dft$esp <- ifelse(dft$expShPval < .05, 1, 0)
      dft$shp <- ifelse(dft$shanPval < .05, 1, 0)
      ###############################################
      b1 <- dplyr::select(dft, rarefyID, S = SSl, N = NS, Simpson = simpS,
                          InvSimpson = invSSl, DomMc = domMS,
                          PIE = PIES, expShannon = expShS, Shannon = shanS)

      d1 <- tidyr::pivot_longer(b1, -rarefyID, names_to = "metric",
                                values_to = "slopes") %>%
        as.data.frame()
      b2 <- dplyr::select(dft, rarefyID, S = SPval, N = NPval, Simpson = simpPval,
                          InvSimpson = invSPval, DomMc = domMPval,
                          PIE = PIEPval, expShannon = expShPval, Shannon = shanPval)

      d2 <- tidyr::pivot_longer(b2, -rarefyID, names_to = "metric",
                                values_to = "p-values") %>%
        as.data.frame()
      d3 <- merge(d1, d2, by = c("rarefyID", "metric"))
      b3 <- dplyr::select(dft, rarefyID, S = sp, N = np, Simpson = sip,
                          InvSimpson = isp, DomMc = dmp, PIE = pp,
                          expShannon = esp, Shannon = shp)

      d4 <- tidyr::pivot_longer(b3, -rarefyID, names_to = "metric",
                                values_to = "significance") %>%
        as.data.frame()
      d5 <- merge(d3, d4, by = c("rarefyID", "metric"))
      b4 <- dplyr::select(dft, rarefyID, S = SSI, N = NI, Simpson = simpI,
                          InvSimpson = invSI, DomMc = domMI,
                          PIE = PIEI, expShannon = expShI, Shannon = shanI)

      d8 <- tidyr::pivot_longer(b4, -rarefyID, names_to = "metric",
                                values_to = "intercept") %>%
        as.data.frame()
      d7 <- merge(d5, d8, by = c("rarefyID", "metric"))
      d6 <- tidyr::pivot_longer(x, -c(rarefyID, Year),
                                names_to = "metric",
                                values_to = "diversity") %>%
        as.data.frame()
      dftx <- merge(d6, d7, by = c("rarefyID", "metric"))
      ###############################################
    },
    beta = {

      x <- subset(x, !is.na(JaccardDiss))

      y <- x %>%
        dplyr::group_by(rarefyID) %>%
        dplyr::summarise(nsp = dplyr::n_distinct(Year)) %>%
        as.data.frame()
      y2 <- subset(y, nsp < 3)
      x <- subset(x, !rarefyID %in% y2$rarefyID)

      for (id in unique(x$rarefyID)){
        dfits <- c()
        f1 <- subset(x, rarefyID == id)
        fitd <- stats::lm(f1$JaccardDiss ~ f1$Year)
        fits <- stats::lm(f1$MorisitaHornDiss ~ f1$Year)
        fitt <- stats::lm(f1$BrayCurtisDiss ~ f1$Year)
        dfits <- c(dfits, id, fitd$coef[2], summary(fitd)$coefficients[2,4],
                   fits$coef[2], summary(fits)$coefficients[2,4], fitt$coef[2],
                   summary(fitt)$coefficients[2,4], fitd$coef[1], fits$coef[1],
                   fitt$coef[1])
        dft <- rbind(dft, dfits)

      }
      colnames(dft) <- c("rarefyID", "jdS", "jdPval", "mhS", "mhPval",
                         "bcS", "bcPval", "jdI", "mhI", "bcI")
      k <- c(2,3,4,5,6,7,8,9,10)
      dft[,k] <- apply(dft[,k], 2, function(x) as.numeric(as.character(x)))
      dft$jdp <- ifelse(dft$jdPval < .05, 1, 0)
      dft$mhp <- ifelse(dft$mhPval < .05, 1, 0)
      dft$bcp <- ifelse(dft$bcPval < .05, 1, 0)
      #####################################
      b1 <- dplyr::select(dft, rarefyID, JaccardDiss = jdS, MorisitaHornDiss = mhS,
                          BrayCurtisDiss = bcS)

      d1 <- tidyr::pivot_longer(b1, -rarefyID, names_to = "metric",
                                values_to = "slopes") %>%
        as.data.frame()

      b2 <- dplyr::select(dft, rarefyID, JaccardDiss = jdPval,
                          MorisitaHornDiss = mhPval,
                          BrayCurtisDiss = bcPval)
      d2 <- tidyr::pivot_longer(b2, -rarefyID, names_to = "metric",
                                values_to = "p-values") %>%
        as.data.frame()
      d3 <- merge(d1, d2, by = c("rarefyID", "metric"))

      b3 <- dplyr::select(dft, rarefyID, JaccardDiss = jdp,
                          MorisitaHornDiss = mhp,
                          BrayCurtisDiss = bcp)

      d4 <- tidyr::pivot_longer(b3, -rarefyID, names_to = "metric",
                                values_to = "significance") %>%
        as.data.frame()
      d5 <- merge(d3, d4, by = c("rarefyID", "metric"))

      b4 <- dplyr::select(dft, rarefyID, JaccardDiss = jdI,
                          MorisitaHornDiss = mhI, BrayCurtisDiss = bcI)

      d8 <- tidyr::pivot_longer(b4, -rarefyID, names_to = "metric",
                                values_to = "intercept") %>%
        as.data.frame()
      d7 <- merge(d5, d8, by = c("rarefyID", "metric"))
      d6 <- tidyr::pivot_longer(x, -c(rarefyID, Year),
                                names_to = "metric",
                                values_to = "dissimilarity") %>%
        as.data.frame()
      dftx <- merge(d6, d7, by = c("rarefyID", "metric"))
      #####################################
    })
  return(dftx)
  # })
}

