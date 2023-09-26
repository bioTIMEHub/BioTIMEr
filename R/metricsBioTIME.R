#' Alpha 
#' @rdname BioTIME-metrics
#' @export
#' @param x (data.frame) First column has to be year
#' @param id definition of id
#' @param pivot should `x` be pivoted from long to wide? Default to FALSE.
#' @importFrom vegan diversity
#' @author Faye Moyes
#' @examples
#' x <- data.frame(
#'   Year = rep(rep(2010:2015, each = 4), times = 4),
#'   Species = unlist(lapply(
#'     X = 1L:8L,
#'     function(x) letters[sample(length(letters), 24L, replace = FALSE)])),
#'   Abundance = rpois(24 * 8, 10),
#'   ID = rep(LETTERS[1L:8L], each = 24)
#' )
#' 
#' res<-getAlphaMetrics(x)
#'
#' returns a data frame with results for S (species richness), N (numerical abundance), maximum N per year per assemblage, Shannon, Exponential Shannon, Simpson, 
#' Inverse Simpson, PIE (probability of intraspecific encounter) and McNaughton's Dominance

getAlpha<-function(x, getID){
  
  yr<-unique(x[, 1]) 
  x<-x[,-1]
  
  q1<-diversity(x, "shannon")
  q2<-diversity(x, "simpson")
  invS<-diversity(x, "inv")

  data.frame(rarefyID=getID, Year=yr, S=apply(x>0, 1, sum), 
             N=apply(x, 1, sum), maxN=apply(x, 1, max),
             Shannon=q1, Simpson=q2, InvSimpson=invS, 
    PIE=apply(x, 1, function(s){n<-sum(s);(n/(n-1))*(1-sum((s/n)^2))}),
    DomMc=apply(x, 1, function(s){y<-sort(s, decreasing=T);(y[1]+y[2])/sum(y)}),
    expShannon=apply(x, 1, function(s){n<-sum(s);exp(-sum(s/n*ifelse(s==0,0,log(s/n))))})
  )
}

#' run the alpha function
#' @rdname BioTIME-metrics
#' @export
#' @author Faye Moyes
#' @examples
#'
#' res<-getAlphaMetrics(x)

getAlphaMetrics<-function(x) {
 
  xd<-data.frame()

  for(getID in unique(x$rarefyID)) {
   df<-subset(x, rarefyID==getID)
   df<-select(df, Year, Species, Abundance)
   y<-as.data.frame(pivot_wider(df, names_from=Species, 
                                values_from=Abundance))
   y[is.na(y)]<-0
   xr<-getAlpha(y, getID)
   xd<-rbind(xd, xr)
 }
  return(xd)
}


#' Beta 
#' @rdname BioTIME-metrics
#' @export
#' @importFrom vegan vegdist
#' @author Faye Moyes
#' @examples
#'
#' res<-getBetaDissimilarity(x) 
#' where x is a long form data frame

getBeta<-function(x, id) {
  
  yr<-unique(x[, 1]) 
  x<-x[,-1]
  xb<-x
  xb[xb>1]<-1
  getj<-vegdist(xb, "jaccard")
  getmh<-vegdist(x, "horn")
  getbc<-vegdist(x, "bray")
  
  jacc<-c(1, getj[1:(nrow(x))])[-1]
  mh<-c(1, getmh[1:(nrow(x))])[-1]
  bc<-c(1, getbc[1:(nrow(x))])[-1]
  
  xf<-data.frame(Year=yr, rarefyID=id, JaccardDiss=jacc, 
                 MorisitaHornDiss=mh, BrayCurtisDiss=bc)
  return(xf)
} 


#' run the beta function
#' @param x (data.frame) Has to have columns Species and Abundance
#' @return long with results for three beta metrics
#' @author Faye Moyes

getBetaDissimilarity<-function(x) {
  
  xd<-data.frame()

  for(id in unique(x$rarefyID)) {
    df<-subset(x, rarefyID==id)
    df<-select(df, Year, Species, Abundance)
    y<-as.data.frame(pivot_wider(df, names_from=Species, 
                                  values_from=Abundance))
    y[is.na(y)]<-0
    xr<-getBeta(y, id)
    xd<-rbind(xd, xr)
  }
  return(xd)
}
