# To-do list

## metricsBioTIME.R
### all
 - replace all the 1:nrow par seq_len(nrow()). For getAlphav1 it shouild begin at 2 and remove the -1L?

### doPivot -- DONE
 - should be moved inside the functions? and not exported? and a parameter or a test decide for the pivot inside the metric function?

## gridBioTIME.R
### gridding
Add an argument to allow users to choose the gridsize.

### runResampling
Add a third method: presence absence
Make the column names capitalising consistent with gridding()

### Add more data


## DESCRIPTION
### Authors
 - discuss
 - check that title and authors are identical between inst/CITATION and DESCRIPTION

### Imports
For geosphere, import only `geomean` & `areaPolygon`
