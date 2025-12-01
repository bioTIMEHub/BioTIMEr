# BioTIME subset

A subset of data from BioTIME temporal surveys.

## Usage

``` r
BTsubset_data
```

## Format

\## \`BTsubset_data\` A data frame with 81,084 rows and 17 columns:

- ID_ALL_RAW_DATA:

  Unique BioTIME identifier for record

- ABUNDANCE:

  Double representing the abundance for the record (see metadata for
  details of ABUNDANCE_TYPE

- BIOMASS:

  Double representing the biomass for the record (see metadata for
  details of BIOMASS_TYPE

- ID_SPECIES:

  Unique identifier linking to the species table

- SAMPLE_DESC:

  Concatenation of variables comprising unique sampling event

- LATITUDE:

  Latitude of record

- LONGITUDE:

  Longitude of record

- DEPTH:

  Depth or elevation of record if available

- DAY:

  Numerical day of record

- MONTH:

  Numerical value of month for record, i.e. January=1

- YEAR:

  Year of record

- STUDY_ID:

  BioTIME study unique identifier

- newID:

  Validated species identifier key

- valid_name:

  Highest taxonomic resolution of individual, preferred is genus and
  species

- resolution:

  Level of resolution, i.e. 'species' represented by genus and species

- taxon:

  Higher level taxonomic grouping, i.e. Fish

## Source

\<https://biotime.st-andrews.ac.uk/download.php\>
