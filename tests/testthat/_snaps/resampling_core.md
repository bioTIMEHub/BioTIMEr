# resampling_core summarise = TRUE returns consistent results

    Code
      set.seed(42)
      resampling_core(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"), summarise = TRUE)
    Output
           assemblageID  YEAR Species ABUNDANCE    BIOMASS
                  <int> <int>  <char>     <int>      <num>
        1:            1  2010       q        22 1614.19466
        2:            1  2010       e         6  449.42046
        3:            1  2010       a         6 1077.08172
        4:            1  2010       j         8  186.48318
        5:            1  2011       d        19 3532.30409
       ---                                                
      171:            4  2011       k         9  346.58612
      172:            4  2013       n        13   12.37324
      173:            4  2013       w        12 1360.28272
      174:            4  2013       l        11  161.13956
      175:            4  2013       o         8  447.45218

# resampling_core summarise = FALSE returns consistent results

    Code
      set.seed(42)
      dplyr::as_tibble(resampling_core(x = test_dt, measure = c("ABUNDANCE",
        "BIOMASS"), summarise = FALSE))
    Output
      # A tibble: 192 x 7
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
       9            1       2 A            2014 c               5   232. 
      10            1       2 A            2014 p               8    93.7
      # i 182 more rows

