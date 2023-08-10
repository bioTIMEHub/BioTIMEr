library(tidyverse)

set.seed(123)

rarefysamples<-function(Year, SampleID, Species, Abundance, resamps) {
  
  rareftab<-data.frame(array(NA,dim=c(0,3)))
  nsamples<-c()
  for(y in unique(Year)){
    nsamples<-c(nsamples, length(unique(SampleID[Year==y])))
  }
  t<-1
  minsample<-min(nsamples)
  for(repeats in 1:resamps){
    raref<-data.frame(array(NA,dim=c(1,3)))
    names(raref)<-c("Year","Species","Abundance")
    for(y in unique(Year)){
      samps<-unique(SampleID[Year==y])
      sam<-as.character(sample(samps,minsample,replace=T))
      rarefyear<-data.frame(SampleID[which(SampleID %in% sam & Year == y)],Species[which(SampleID %in% sam & Year == y)],Abundance[which(SampleID %in% sam & Year == y)])
      names(rarefyear)<-c("SampleID", "Species", "Abundance")
      spabun<-tapply(as.numeric(rarefyear[,3]),as.character(rarefyear[,2]),sum)
      spar<-data.frame(rep(y, length(spabun)),names(spabun),spabun, row.names=NULL)
      names(spar)<-c("Year","Species","Abundance")
      raref<-rbind(raref,spar)
    }
    rareftab<-rbind(rareftab,cbind(rep(repeats,dim(raref)[1]),raref))
  }
  return(rareftab)
}

## select chosen rds file
dfr<-readRDS("savedFinalStage.rds") 
## do any filtering required here
## for example:
## by length of study
rf<-subset(dfr, Abundance!=0)
yrf2<-as.data.frame(rf %>% group_by(rarefyID) %>% summarise(yr=n_distinct(YEAR)))
getYrs2<-subset(yrf2, yr>19)
rf2<-subset(rf, rarefyID %in% getYrs2$rarefyID)
srf2<-as.data.frame(rf2 %>% group_by(rarefyID) %>% summarise(sp=n_distinct(Species)))
getSp2<-subset(srf2, sp>9)
## by taxa
## by realm
## by number of species
df<-select(dfr, YEAR, Species, ABUNDANCE, rarefyID, SAMPLE_DESC)
colnames(df)<-c("Year", "Species", "Abundance", "rarefyID", "Samp")

TS<-df

TSrf<-list()
rfIDs<-unique(TS$rarefyID)
for(i in 1:length(rfIDs)){
  data<-TS[TS$rarefyID==rfIDs[i],]
  TSrf[[i]]<-rarefysamples(data$Year, data$Samp, data$Species, data$Abundance, 1) 
}
names(TSrf)<-rfIDs

rf<-do.call(rbind, TSrf)
rf<-data.frame(rf, rfID=rep(names(TSrf), times=unlist(lapply(TSrf, nrow))))
rf<-rf[!is.na(rf$Year),-1]
rownames(rf)<-NULL
rf1<-as.data.frame(rf %>% separate(., rfID, into= c("STUDY_ID", "cell"), 
                                   sep="_", remove=F))
rf1<-select(rf1, Year, Species, Abundance, rfID, STUDY_ID)
colnames(rf1)<-c("Year", "Species", "Abundance", "rarefyID", "StudyID")

## save file
#saveRDS(rf1, "savedRarefyv1.rds")

