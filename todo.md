# To-do list

## metricsBioTIME.R
### all
 - replace all the 1:nrow par seq_len(nrow()). For getAlphav1 it shouild begin at 2 and remove the -1L?

### doPivot
 - should be moved inside the functions? and not exported? and a parameter or a test decide for the pivot inside the metric function?

## gridBioTIME.R
### gridding

## DESCRIPTION
### Authors
 - discuss

### Imports
For geosphere, import only `geomean` & `areaPolygon`
For ggplopt2, import only `discrete_scale` & `scale_color_gradientn`
