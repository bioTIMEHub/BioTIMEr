# rarefysamples summarise = TRUE returns consistent results

    Code
      set.seed(42)
      rarefysamples(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"), summarise = TRUE)
    Output
           assemblageID  YEAR Species ABUNDANCE   BIOMASS
                  <int> <int>  <char>     <int>     <num>
        1:            1  2010       f         2 1996.8923
        2:            1  2010       c        34 2403.1645
        3:            1  2010       a        30 2453.1568
        4:            1  2010       o        16 1864.4197
        5:            1  2011       d        19 2438.5123
       ---                                               
      480:            4  2011       c        12  625.8872
      481:            4  2012       f        15  625.2388
      482:            4  2012       m        12 1662.5529
      483:            4  2013       b         5 1006.3578
      484:            4  2014       d        15  430.9440

# rarefysamples summarise = FALSE returns consistent results

    Code
      set.seed(42)
      dplyr::as_tibble(rarefysamples(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"),
      summarise = FALSE))
    Output
      # A tibble: 768 x 7
         assemblageID minsamp SAMPLE_DESC  YEAR Species ABUNDANCE BIOMASS
                <int>   <int> <chr>       <int> <chr>       <int>   <dbl>
       1            1       2 A            2010 f               2   1997.
       2            1       2 A            2010 c               9    925.
       3            1       2 A            2010 a               9   1364.
       4            1       2 A            2010 o              10    525.
       5            1       2 A            2011 d              11   2188.
       6            1       2 A            2011 i               9   3197.
       7            1       2 A            2011 x               9    577.
       8            1       2 A            2011 k              10    275.
       9            1       2 A            2012 z               8   2324.
      10            1       2 A            2012 n              14   1990.
      # i 758 more rows

