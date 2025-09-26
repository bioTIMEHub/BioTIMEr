# rarefysamples summarise = TRUE returns consistent results

    Code
      set.seed(42)
      rarefysamples(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"), summarise = TRUE)
    Output
           assemblageID  YEAR Species ABUNDANCE   BIOMASS
                  <int> <int>  <char>     <int>     <num>
        1:            1  2010       q        33 2519.4499
        2:            1  2010       e        33 4515.2674
        3:            1  2010       a         6 1077.0817
        4:            1  2010       j        17  683.4787
        5:            1  2011       d        19 3532.3041
       ---                                               
      480:            4  2014       h        12 1142.5879
      481:            4  2015       j         9  364.5218
      482:            4  2015       b        10  657.9949
      483:            4  2015       y        15 1236.1387
      484:            4  2015       f        14  817.1440

# rarefysamples summarise = FALSE returns consistent results

    Code
      set.seed(42)
      dplyr::as_tibble(rarefysamples(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"),
      summarise = FALSE))
    Output
      # A tibble: 768 x 7
         assemblageID minsamp SAMPLE_DESC  YEAR Species ABUNDANCE BIOMASS
                <int>   <int> <chr>       <int> <chr>       <int>   <dbl>
       1            1       2 A            2010 q              14    58.0
       2            1       2 A            2010 e               6   449. 
       3            1       2 A            2010 a               6  1077. 
       4            1       2 A            2010 j               8   186. 
       5            1       2 A            2011 d               9  1569. 
       6            1       2 A            2011 r               9   227. 
       7            1       2 A            2011 z               7   766. 
       8            1       2 A            2011 o              15   312. 
       9            1       2 A            2012 g               8  1355. 
      10            1       2 A            2012 v              12   906. 
      # i 758 more rows

