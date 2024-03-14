#' BioTIME subset
#'
#' A subset of data from BioTIME temporal surveys.
#'
#' @format ## `BTsubset_data`
#' A data frame with 81,084 rows and 17 columns:
#' \describe{
#'   \item{ID_ALL_RAW_DATA}{Unique BioTIME identifier for record}
#'   \item{ABUNDANCE}{Double representing the abundance for the record (see metadata for details of ABUNDANCE_TYPE}
#'   \item{BIOMASS}{Double representing the biomass for the record (see metadata for details of BIOMASS_TYPE}
#'   \item{ID_SPECIES}{Unique identifier linking to the species table}
#'   \item{SAMPLE_DESC}{Concatenation of variables comprising unique sampling event}
#'   \item{PLOT}{Name or identifier of plot field, only used for fixed plots such as forest quadrats}
#'   \item{LATITUDE}{Latitude of record}
#'   \item{LONGITUDE}{Longitude of record}
#'   \item{DEPTH}{Depth or elevation of record if available}
#'   \item{DAY}{Numerical day of record}
#'   \item{MONTH}{Numerical value of month for record, i.e. January=1}
#'   \item{YEAR}{Year of record}
#'   \item{STUDY_ID}{BioTIME study unique identifier}
#'   \item{newID}{Validated species identifier key}
#'   \item{valid_name}{Highest taxonomic resolution of individual, preferred is genus and species}
#'   \item{resolution}{Level of resolution, i.e. 'species' represented by genus and species}
#'   \item{taxon}{Higher level taxonomic grouping, i.e. Fish}
#' }
#' @source <https://biotime.st-andrews.ac.uk/download.php>
"BTsubset_data"

#' BioTIME subset metadata
#'
#' A subset of the metadata from BioTIME
#'
#' @format ## `BTsubset_meta`
#' A data frame with 12 rows and 25 columns:
#' \describe{
#'   \item{STUDY_ID}{BioTIME study unique identifier}
#'   \item{REALM}{Realm of study location, i.e. Marine}
#'   \item{CLIMATE}{Climate of study location, i.e. Temperate}
#'   \item{HABITAT}{Habitat of study location, i.e. Rivers}
#'   \item{PROTECTED_AREA}{binary variable indicating if the study is within a protected area}
#'   \item{BIOME_MAP}{Biome of study location (taken from the WWF biomes, i.e. Temperate broadleaf and mixed forests}
#'   \item{TAXA}{High level taxonomic identity of study species, i.e. Fish}
#'   \item{ORGANISMS}{More detailed information on taxonomy, i.e. woody plants}
#'   \item{TITLE}{Title of study as identified in original source}
#'   \item{AB_BIO}{A, B or AB to designate abundance only, biomass only or both}
#'   \item{DATA_POINTS}{Number of unique data points in study, e.g. 10 data points spanning 15 years = 10}
#'   \item{START_YEAR}{first year of study}
#'   \item{END_YEAR}{last year of study}
#'   \item{CENT_LAT}{Central latitude taken from the convex hull around all study coordinates}
#'   \item{CENT_LONG}{Central longitude taken from the convex hull around all study coordinates}
#'   \item{NUMBER_OF_SPECIES}{Number of distinct species in study}
#'   \item{NUMBER_OF_SAMPLES}{Number of distinct samples in study}
#'   \item{NUMBER_LAT_LONG}{Number of distinct geographic coordinates in study}
#'   \item{TOTAL}{Total number of records in study}
#'   \item{GRAIN_SQ_KM}{Grain size in km2, i.e. size of forest plots}
#'   \item{AREA_SQ_KM}{total area of study in km2}
#'   \item{DATE_STUDY_ADDED}{Date that the study was added to the database}
#'   \item{ABUNDANCE_TYPE}{Type of abundance, i.e. count}
#'   \item{BIOMASS_TYPE}{Type of biomass, i.e. weight}
#'   \item{SAMPLE_DESC}{concatenation of descriptors comprising the unique sampling event}
#' }
#' @source <https://biotime.st-andrews.ac.uk/download.php>
"BTsubset_meta"
