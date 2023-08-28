#' BioTIME subset
#'
#' A subset of data from BioTIME temporal surveys.
#'
#' @format ## `subBTquery`
#' A data frame with 7,240 rows and 60 columns:
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso2, iso3}{2 & 3 letter ISO country codes}
#'   \item{year}{Year}
#'   ...
#' }
#' @source <https://www.who.int/teams/global-tuberculosis-programme/data>
"subBTquery"

#' BioTIME subset metadata
#'
#' A subset of the metadata from BioTIME
#'
#' @format ## `subBTmeta`
#' A data frame with 10 rows and 26 columns:
#' \describe{
#'   \item{STUDY_ID}{BioTIME study unique identifier}
#'   \item{REALM}{Realm of study location, i.e. Marine}
#'   \item{CLIMATE}{Climate of study location, i.e. Temperate}
#'   \item{HABITAT}{Habitat of study location, i.e. Rivers}
#'   \item{PROTECTED_AREA}{binary variable indicating if the study is within a protected area}
#'   \item{AREA}{total area of study}
#'   \item{BIOME_MAP}{Biome of study location (taken from the WWF biomes, i.e. Temperate broadleaf and mixed forests}
#'   \item{TAXA}{High level taxomonic identity of study species, i.e. Fish}
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
#'   \item{SAMPLE_DESC_NAME}{concatenation of descriptors comprising the unique sampling event}
#' }
#' @source <https://www.who.int/teams/global-tuberculosis-programme/data>
"subBTmeta"
