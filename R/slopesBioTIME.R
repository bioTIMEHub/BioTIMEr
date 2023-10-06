#' Get Linear Regressions BioTIME
#'
#' @export
#' @param x Parameter description
#' @param divType Parameter description
#' @return A plot


getLinearRegressions<-function(x, divType) {

  checkmate::assertChoice(divType, choices = c("beta", "alpha"))
  suppressWarnings({

  dft<-data.frame()

  if (divType=="alpha") {

    x<-subset(x, S!=1)

    y<-as.data.frame(x %>% group_by(rarefyID) %>%
                       summarise(nsp=n_distinct(Year)))
    y2<-subset(y, nsp<3)
    x<-subset(x, !rarefyID %in% y2$rarefyID)

    for(id in unique(x$rarefyID)){
      dfits<-c()
      f1<-subset(x, rarefyID==id)
      fitd<-lm(f1$S~f1$Year)
      fits<-lm(f1$N~f1$Year)
      fitt<-lm(f1$Simpson~f1$Year)
      fite<-lm(f1$InvSimpson~f1$Year)
      fitf<-lm(f1$DomMc~f1$Year)
      fitg<-lm(f1$PIE~f1$Year)
      fith<-lm(f1$expShannon~f1$Year)
      fiti<-lm(f1$Shannon~f1$Year)
      dfits<-c(dfits, id, fitd$coef[2], summary(fitd)$coefficients[2,4],
             fits$coef[2], summary(fits)$coefficients[2,4], fitt$coef[2],
             summary(fitt)$coefficients[2,4], fite$coef[2], summary(fite)$coefficients[2,4],
             fitf$coef[2], summary(fitf)$coefficients[2,4], fitg$coef[2],
             summary(fitg)$coefficients[2,4], fith$coef[2], summary(fith)$coefficients[2,4],
             fiti$coef[2],summary(fiti)$coefficients[2,4], fitd$coef[1],
             fits$coef[1], fitt$coef[1], fite$coef[1], fitf$coef[1],
             fitg$coef[1], fith$coef[1], fiti$coef[1])
      dft<-rbind(dft, dfits)

      colnames(dft)<-c("rarefyID", "SSl", "SPval", "NS", "NPval",
                     "simpS", "simpPval", "invSSl", "invSPval", "domMS",
                     "domMPval", "PIES", "PIEPval", "expShS", "expShPval",
                     "shanS", "shanPval", "SSI", "NI", "simpI",
                     "invSI", "domMI", "PIEI", "expShI", "shanI")
    }
    k<-c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25)
    dft[,k]<-apply(dft[,k], 2, function(x) as.numeric(as.character(x)))
    dft$sp<-ifelse(dft$SPval<.05, 1, 0)
    dft$np<-ifelse(dft$NPval<.05, 1, 0)
    dft$sip<-ifelse(dft$simpPval<.05, 1, 0)
    dft$isp<-ifelse(dft$invSPval<.05, 1, 0)
    dft$dmp<-ifelse(dft$domMPval<.05, 1, 0)
    dft$pp<-ifelse(dft$PIEPval<.05, 1, 0)
    dft$esp<-ifelse(dft$expShPval<.05, 1, 0)
    dft$shp<-ifelse(dft$shanPval<.05, 1, 0)
    ###############################################
    b1<-select(dft, rarefyID, SSl, NS, simpS, invSSl, domMS,
               PIES, expShS, shanS)
    colnames(b1)<-c("rarefyID", "S", "N", "Simpson", "InvSimpson",
                    "DomMc", "PIE", "expShannon", "Shannon")
    d1<-as.data.frame(pivot_longer(b1, -rarefyID, names_to="metric",
                                   values_to="slopes"))
    b2<-select(dft, rarefyID, SPval, NPval, simpPval, invSPval, domMPval,
               PIEPval, expShPval, shanPval)
    colnames(b2)<-c("rarefyID", "S", "N", "Simpson", "InvSimpson",
                    "DomMc", "PIE", "expShannon", "Shannon")
    d2<-as.data.frame(pivot_longer(b2, -rarefyID, names_to="metric",
                                   values_to="p-values"))
    d3<-merge(d1, d2, by=c("rarefyID", "metric"))
    b3<-select(dft, rarefyID, sp, np, sip, isp, dmp, pp, esp, shp)
    colnames(b3)<-c("rarefyID", "S", "N", "Simpson", "InvSimpson",
                    "DomMc", "PIE", "expShannon", "Shannon")
    d4<-as.data.frame(pivot_longer(b3, -rarefyID, names_to="metric",
                                   values_to="significance"))
    d5<-merge(d3, d4, by=c("rarefyID", "metric"))
    b4<-select(dft, rarefyID, SSI, NI, simpI, invSI, domMI,
               PIEI, expShI, shanI)
    colnames(b4)<-c("rarefyID", "S", "N", "Simpson", "InvSimpson",
                    "DomMc", "PIE", "expShannon", "Shannon")
    d8<-as.data.frame(pivot_longer(b4, -rarefyID, names_to="metric",
                                   values_to="intercept"))
    d7<-merge(d5, d8, by=c("rarefyID", "metric"))
    d6<-as.data.frame(pivot_longer(x, -c(rarefyID, Year),
                                   names_to="metric", values_to="diversity"))
    dftx<-merge(d6, d7, by=c("rarefyID", "metric"))
    ###############################################
  }

  if (divType=="beta") {

    x<-subset(x, !is.na(JaccardDiss))

    y<-as.data.frame(x %>% group_by(rarefyID) %>%
                       summarise(nsp=n_distinct(Year)))
    y2<-subset(y, nsp<3)
    x<-subset(x, !rarefyID %in% y2$rarefyID)

    for(id in unique(x$rarefyID)){
      dfits<-c()
      f1<-subset(x, rarefyID==id)
      fitd<-lm(f1$JaccardDiss~f1$Year)
      fits<-lm(f1$MorisitaHornDiss~f1$Year)
      fitt<-lm(f1$BrayCurtisDiss~f1$Year)
      dfits<-c(dfits, id, fitd$coef[2], summary(fitd)$coefficients[2,4],
               fits$coef[2], summary(fits)$coefficients[2,4], fitt$coef[2],
               summary(fitt)$coefficients[2,4], fitd$coef[1], fits$coef[1],
               fitt$coef[1])
      dft<-rbind(dft, dfits)

      colnames(dft)<-c("rarefyID", "jdS", "jdPval", "mhS", "mhPval",
                       "bcS", "bcPval", "jdI", "mhI", "bcI")
    }
    k<-c(2,3,4,5,6,7,8,9,10)
    dft[,k]<-apply(dft[,k], 2, function(x) as.numeric(as.character(x)))
    dft$jdp<-ifelse(dft$jdPval<.05, 1, 0)
    dft$mhp<-ifelse(dft$mhPval<.05, 1, 0)
    dft$bcp<-ifelse(dft$bcPval<.05, 1, 0)
    #####################################
    b1<-select(dft, rarefyID, jdS, mhS, bcS)
    colnames(b1)<-c("rarefyID", "JaccardDiss", "MorisitaHornDiss",
                    "BrayCurtisDiss")
    d1<-as.data.frame(pivot_longer(b1, -rarefyID, names_to="metric",
                                   values_to="slopes"))
    b2<-select(dft, rarefyID, jdPval, mhPval, bcPval)
    colnames(b2)<-c("rarefyID", "JaccardDiss", "MorisitaHornDiss",
                    "BrayCurtisDiss")
    d2<-as.data.frame(pivot_longer(b2, -rarefyID, names_to="metric",
                                   values_to="p-values"))
    d3<-merge(d1, d2, by=c("rarefyID", "metric"))
    b3<-select(dft, rarefyID, jdp, mhp, bcp)
    colnames(b3)<-c("rarefyID", "JaccardDiss", "MorisitaHornDiss",
                    "BrayCurtisDiss")
    d4<-as.data.frame(pivot_longer(b3, -rarefyID, names_to="metric",
                                   values_to="significance"))
    d5<-merge(d3, d4, by=c("rarefyID", "metric"))
    b4<-select(dft, rarefyID, jdI, mhI, bcI)
    colnames(b4)<-c("rarefyID", "JaccardDiss", "MorisitaHornDiss",
                    "BrayCurtisDiss")
    d8<-as.data.frame(pivot_longer(b4, -rarefyID, names_to="metric",
                                   values_to="intercept"))
    d7<-merge(d5, d8, by=c("rarefyID", "metric"))
    d6<-as.data.frame(pivot_longer(x, -c(rarefyID, Year),
              names_to="metric", values_to="dissimilarity"))
    dftx<-merge(d6, d7, by=c("rarefyID", "metric"))
    #####################################
  }
  return(dftx)
  })
}

