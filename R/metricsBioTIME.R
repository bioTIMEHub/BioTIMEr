library(tidyverse)
library(vegan)
library(hillR)

x<-readRDS("rareDF.rds")

doPivot<-function(t1) {
  m1<-as.data.frame(pivot_wider(t1, names_from=Species, values_from=Abundance))
  m1[is.na(m1)]<-0
  return(m1)
}

getAlphav1<-function(x, getID) {
  
  yr<-unique(x[, 1]) 
  x<-x[,-1]
  getq1<-diversity(x, "shannon")
  getq2<-diversity(x, "simpson") 
  getInvS<-diversity(x, "inv")
  getH0<-hill_taxa(x, q=0)
  getH1<-hill_taxa(x, q=1)
  getH2<-hill_taxa(x, q=2)
  
  q1<-c(1, getq1[1:(nrow(x))])[-1]
  q2<-c(1, getq2[1:(nrow(x))])[-1]
  invS<-c(1, getInvS[1:(nrow(x))])[-1]
  h0<-c(1, getH0[1:(nrow(x))])[-1]
  h1<-c(1, getH1[1:(nrow(x))])[-1]
  h2<-c(1, getH2[1:(nrow(x))])[-1]
  
  df_out<-data.frame(Year=yr, q1=(exp(1/q1)), q2=(1/q2), invS=invS, 
                     h0=h0, h1=h1, h2=h2, ID=getID)
  return(df_out)
} 


xd<-data.frame()

for(getID in unique(x$ID)) {
  t11<-subset(x, ID==getID)
  t1<-select(t11, Year, Species, Abundance)
  xr<-getAlphav1(doPivot(t1), getID)
  xd<-rbind(xd, xr)
  
}


getAlphav2<-function(x, getID){
  yr<-unique(x[, 1]) 
  x<-x[,-1]
  data.frame(ID=getID, S=apply(x>0, 1, sum), N=apply(x, 1, sum),
    mx=apply(x, 1, max), Year=yr,
    PIE=apply(x, 1, function(s){n<-sum(s);(n/(n-1))*(1-sum((s/n)^2))}),
    DomMc=apply(x, 1, function(s){y<-sort(s, decreasing=T);(y[1]+y[2])/sum(y)}),
    expShan=apply(x, 1, function(s){n<-sum(s);exp(-sum(s/n*ifelse(s==0,0,log(s/n))))})
  )
}

xd<-data.frame()

for(getID in unique(x$ID)) {
  t11<-subset(x, ID==getID)
  t1<-select(t11, Year, Species, Abundance)
  xr<-getAlphav2(doPivot(t1), getID)
  xd<-rbind(xd, xr)
}

getBetav1<-function(spec_df, rfid) {
  
  yr<-unique(spec_df[, 1]) 
  spec_df<-spec_df[,-1]
  spec_df[spec_df>0]<-1
  getBas<-beta.pair(spec_df, index.family="jac")$beta.jac
  getTO<-beta.pair(spec_df, index.family="jac")$beta.jtu
  getN<-beta.pair(spec_df, index.family="jac")$beta.jne
  
  basJac<-c(1, getBas[1:(nrow(spec_df)-1)])
  tover<-c(1, getTO[1:(nrow(spec_df)-1)])
  nested<-c(1, getN[1:(nrow(spec_df)-1)])
  
  df_out<-data.frame(Year=yr, J=basJac, TO=tover, N=nested, coast=rfid)
  
  df_out<-df_out[-1,]
  return(df_out)
}


getBetav2<-function(x, id) {
  
  yr<-unique(x[, 1]) 
  x<-x[,-1]
  x2<-x
  x2[x2>1]<-1
  getj<-vegdist(x2, "jaccard")
  getmh<-vegdist(x, "horn")
  
  jacc<-c(1, getj[1:(nrow(x))])[-1]
  mh<-c(1, getmh[1:(nrow(x))])[-1]
  
  df_out<-data.frame(Year=yr, id=id, jaccD=jacc, mhorn=mh)
  return(df_out)
} 


xd<-data.frame()

for(id in unique(x$id)) {
  xs1<-subset(x, id==id)
  xs1<-select(xs1, Year, Species, Abundance)
  xsp<-as.data.frame(spread(xs1, key="Species", value="Abundance"))
  xsp[is.na(xsp)]<-0
  tff<-getBetav1(xsp, id)
  xd<-rbind(xd, tff)
}

xd<-data.frame()

for(id in unique(x$id)) {
  t11<-subset(x, id==id)
  t1<-select(t11, Year, Species, Abundance)
  xr<-getBetav2(doPivot(t1), id)
  xd<-rbind(xd, xr)
  
}

getBetav3<-function(x) {
  
  yr<-unique(x[, 1]) 
  x<-x[,-1]
  xb<-x
  xb[xb>0]<-1
  getBas<-beta.pair(xb, index.family="jac")$beta.jac
  getTO<-beta.pair(xb, index.family="jac")$beta.jtu
  getN<-beta.pair(xb, index.family="jac")$beta.jne
  basJ<-c(1, getBas[1:(nrow(x))])[-1]
  to<-c(1, getTO[1:(nrow(x))])[-1]
  nest<-c(1, getN[1:(nrow(x))])[-1]
  
  df_out<-data.frame(Year=yr, basJ=basJ, to=to, 
                     nest=nest)

  return(df_out)
} 

xd<-data.frame()

xd<-getBetav3(doPivot(ax))
