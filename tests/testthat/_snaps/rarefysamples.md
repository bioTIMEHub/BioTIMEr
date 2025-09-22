# rarefysamples summarise = TRUE returns consistent results

    Code
      suppressWarnings(rarefysamples(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"),
      resamps, summarise = TRUE))
    Output
           resamp  YEAR Species ABUNDANCE   BIOMASS
            <int> <int>  <char>     <int>     <num>
        1:      1  2010       b        13 1400.7688
        2:      1  2010       c        20  434.2830
        3:      1  2010       g         9  883.6264
        4:      1  2010       h        20 2486.4178
        5:      1  2010       i         5 3197.1662
       ---                                         
      335:      3  2015       s        44 2091.9452
      336:      3  2015       u         8 1196.9449
      337:      3  2015       v         6 1928.1775
      338:      3  2015       w        10 1719.8575
      339:      3  2015       y         9  639.3573

# rarefysamples summarise = FALSE returns consistent results

    Code
      suppressWarnings(dplyr::as_tibble(rarefysamples(x = test_dt, measure = c(
        "ABUNDANCE", "BIOMASS"), resamps, summarise = FALSE)))
    Output
      # A tibble: 576 x 7
         resamp SAMPLE_DESC  YEAR Species ABUNDANCE BIOMASS minsamp
          <int> <chr>       <int> <chr>       <int>   <dbl>   <int>
       1      1 A            2010 m               8   1609.       8
       2      1 A            2010 p               5    105.       8
       3      1 A            2010 s              11    544.       8
       4      1 A            2010 x               9   1001.       8
       5      1 A            2011 f               9   2159.       8
       6      1 A            2011 h              10    110.       8
       7      1 A            2011 t              15    910.       8
       8      1 A            2011 w              11    758.       8
       9      1 A            2012 e              10   1367.       8
      10      1 A            2012 g               5    869.       8
      # i 566 more rows

