library(tidyverse)
library(dggridR)
## note: depends on rgeos, maptools and rgdal - soon to be deprecated

btf<-readRDS("subBTquery.csv")
meta<-read.csv("subBTmeta.csv")
bt<-inner_join(meta, btf, by='STUDY_ID')
colnames(bt)[colnames(bt)=='valid_name']<-'Species'

meta<-meta %>%
  mutate(StudyMethod = ifelse(NUMBER_LAT_LONG == 1, "SL", NA))
bt<-bt %>%
  mutate(StudyMethod = ifelse(NUMBER_LAT_LONG == 1, 'SL', 'ML'))

SL_extent_mean<-meta %>% filter(StudyMethod=='SL' & AREA_SQ_KM<=500) %>% 
  summarise(extent_mean = mean(AREA_SQ_KM, na.rm=TRUE)) %>% .$extent_mean
SL_extent_sd<-meta %>% filter(StudyMethod=='SL' & AREA_SQ_KM<=500) %>% 
  summarise(extent_sd = sd(AREA_SQ_KM, na.rm=TRUE)) %>% .$extent_sd

bt$StudyMethod<-with(bt, ifelse(AREA_SQ_KM < (SL_extent_mean+SL_extent_sd), 'SL', StudyMethod))

bt<-bt %>% 
  mutate(lon_to_grid = ifelse(StudyMethod=='SL', CENT_LONG, LONGITUDE),
         lat_to_grid = ifelse(StudyMethod=='SL', CENT_LAT, LATITUDE))

oneyear<-bt %>% 
  group_by(STUDY_ID) %>%
  filter(max(YEAR)-min(YEAR)==0) %>%
  summarise() %>%
  collect %>% .[["STUDY_ID"]]
bt<-bt %>% filter(!(STUDY_ID %in% oneyear))

dgg<-dgconstruct(res=12)
res<-dg_closest_res_to_area(dgg, SL_extent_mean+SL_extent_sd)
dgg<-dgsetres(dgg, res)
bt<-as.data.frame(bt)

bt$cell<-dgGEO_to_SEQNUM(dgg, bt$lon_to_grid, bt$lat_to_grid)$seqnum

check<-bt %>% group_by(StudyMethod, STUDY_ID) %>% summarise(n_cell = n_distinct(cell))

if (sum(dplyr::filter(check, StudyMethod=='SL') %>% .$n_cell != 1)==0) { 
  print("all SL studies have 1 grid cell") 
} else { print("ERROR: some SL studies have > 1 grid cell") }

check2<-bt %>% 
  group_by(StudyMethod, STUDY_ID, YEAR) %>% 
  summarise(n_cell = n_distinct(cell))

range(check2$n_cell)

bt<-bt %>% unite(col=rarefyID, STUDY_ID, cell, sep="_", remove=FALSE)

## can save here if needed for larger datasets
#saveRDS(bt, "savedStage1.rds")

rarefyID_coords_nest<-ungroup(bt) %>%
  filter(StudyMethod!='SL') %>%
  select(STUDY_ID, rarefyID, LONGITUDE, LATITUDE) %>%
  distinct(rarefyID, LONGITUDE, LATITUDE, .keep_all=TRUE) %>% 
  group_by(rarefyID) %>%
  mutate(n_locations = n_distinct(LONGITUDE,LATITUDE)) %>%
  ungroup() %>%
  filter(n_locations > 1) %>%
  select(-n_locations) %>%
  group_by(STUDY_ID, rarefyID) %>%
  nest()

cell_extent <- numeric()
centre_rarefyID_x <- numeric()
centre_rarefyID_y <- numeric()
vertices_check <- data.frame()
for(i in 1:nrow(rarefyID_coords_nest)){
  ## check what it is doing
  print(paste('rarefyID', i, 'of', 
              length(unique(rarefyID_coords_nest$rarefyID))))
  ################################################################
  hull=chull(x=unlist(rarefyID_coords_nest$data[[i]][,'LONGITUDE']), 
             y=unlist(rarefyID_coords_nest $data[[i]][,'LATITUDE']))	
  vertices=rarefyID_coords_nest$data[[i]][hull,c('LONGITUDE', 'LATITUDE')]
  info=cbind.data.frame(Realm=rep(rarefyID_coords_nest$STUDY_ID[i], 
    times=nrow(vertices)), rarefyID=rep(rarefyID_coords_nest$rarefyID[i],
              times=nrow(vertices)), vertices)
  vertices_check=rbind.data.frame(vertices_check, info)
  ## get the extent of cells in km2
  cell_extent[i]=geosphere::areaPolygon(data.frame(x=vertices$LONGITUDE, 
                    y=vertices$LATITUDE))
  ## get the centre points of the cells
  centre_rarefyID_x[i]=geosphere::geomean(cbind(x=vertices$LONGITUDE, 
              y=vertices$LATITUDE))[1]
  centre_rarefyID_y[i]=geosphere::geomean(cbind(x=vertices$LONGITUDE, 
              y=vertices$LATITUDE))[2]
}

rarefyID_cell_centre<-cbind.data.frame(rarefyID_coords_nest[,1:2], 
                cell_extent, rarefyID_x=centre_rarefyID_x, 
                rarefyID_y=centre_rarefyID_y)		
rarefyID_cell_centre<-as_tibble(rarefyID_cell_centre)	

## can save here for large studies
#saveRDS(as.data.frame(rarefyID_cell_centre), "savedStage2.rds")

## combine these with the other studies

SL_coords<-ungroup(bt) %>%
  filter(StudyMethod=='SL') %>%
  select(STUDY_ID, rarefyID, CENT_LONG, CENT_LAT) %>%
  ## cell extent = 0, need to rename the centre points to merge
  mutate(cell_extent=0,
         rarefyID_x=CENT_LONG,
         rarefyID_y=CENT_LAT) %>%
  select(-CENT_LONG, -CENT_LAT)

ML_coords <- ungroup(bt) %>%
  filter(StudyMethod!='SL') %>%	
  select(STUDY_ID, rarefyID, LONGITUDE, LATITUDE) %>%
  distinct(rarefyID, LONGITUDE, LATITUDE, .keep_all=TRUE) %>% 
  group_by(rarefyID) %>%
  mutate(n_locations=n_distinct(LONGITUDE,LATITUDE)) %>%
  ungroup() %>%
  filter(n_locations==1) %>%
  mutate(cell_extent=0,
         rarefyID_x=LONGITUDE,
         rarefyID_y=LATITUDE) %>%
  select(-LONGITUDE, -LATITUDE, -n_locations)

## join everything
rarefyID_cell_centre<-bind_rows(rarefyID_cell_centre, 
                                SL_coords, ML_coords)
rarefyID_cell_centre<-rarefyID_cell_centre %>% distinct(STUDY_ID, 
              rarefyID, cell_extent, rarefyID_x, rarefyID_y)

## can save this here
#saveRDS(rarefyID_cell_centre, "rfCellCentres.rds")

## also can save here if needed
#saveRDS(bt, "savedStage3.rds")

bt_grid<-bt %>% 
  dplyr::select(CLIMATE, REALM, TAXA, StudyMethod, SAMPLE_DESC, 
                ABUNDANCE_TYPE, BIOMASS_TYPE, STUDY_ID, YEAR, PLOT, 
                cell, Species, DAY, MONTH, ABUNDANCE, BIOMASS, taxon, 
                resolution)
bt_grid<-bt_grid %>% unite(col=rarefyID, STUDY_ID, cell, sep="_", remove=FALSE)

## final save before rarefaction
#saveRDS(as.data.frame(bt_grid), "savedFinalStage.rds")
