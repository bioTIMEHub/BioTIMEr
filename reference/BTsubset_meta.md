# BioTIME subset metadata

A subset of the metadata from BioTIME

## Usage

``` r
BTsubset_meta
```

## Format

\## \`BTsubset_meta\` A data frame with 12 rows and 25 columns:

- STUDY_ID:

  BioTIME study unique identifier

- REALM:

  Realm of study location, i.e. Marine

- CLIMATE:

  Climate of study location, i.e. Temperate

- HABITAT:

  Habitat of study location, i.e. Rivers

- PROTECTED_AREA:

  Binary variable indicating if the study is within a protected area

- BIOME_MAP:

  Biome of study location (taken from the WWF biomes, i.e. Temperate
  broadleaf and mixed forests

- TAXA:

  High level taxonomic identity of study species, i.e. Fish

- ORGANISMS:

  More detailed information on taxonomy, i.e. woody plants

- TITLE:

  Title of study as identified in original source

- AB_BIO:

  A, B or AB to designate abundance only, biomass only or both

- DATA_POINTS:

  Number of unique data points in study, e.g. 10 data points spanning 15
  years = 10

- START_YEAR:

  First year of study

- END_YEAR:

  Last year of study

- CENT_LAT:

  Central latitude taken from the convex hull around all study
  coordinates

- CENT_LONG:

  Central longitude taken from the convex hull around all study
  coordinates

- NUMBER_OF_SPECIES:

  Number of distinct species in study

- NUMBER_OF_SAMPLES:

  Number of distinct samples in study

- NUMBER_LAT_LONG:

  Number of distinct geographic coordinates in study

- TOTAL:

  Total number of records in study

- GRAIN_SIZE_TEXT:

  Grain size described in text, i.e. size of forest plots

- AREA_SQ_KM:

  Total area of study in km2

- DATE_STUDY_ADDED:

  Date that the study was added to the database

- ABUNDANCE_TYPE:

  Type of abundance, i.e. count

- BIOMASS_TYPE:

  Type of biomass, i.e. weight

- SAMPLE_DESC:

  Concatenation of descriptors comprising the unique sampling event

## Source

\<https://biotime.st-andrews.ac.uk/download.php\>
