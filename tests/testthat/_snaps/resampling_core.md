# resampling_core summarise = TRUE returns consistent results

    Code
      set.seed(42)
      resampling_core(x = test_dt, measure = c("ABUNDANCE", "BIOMASS"), summarise = TRUE)
    Output
           assemblageID  YEAR Species ABUNDANCE   BIOMASS
                  <int> <int>  <char>     <int>     <num>
        1:            1  2010       j        41  540.9151
        2:            1  2010       r         5  164.6176
        3:            1  2010       m        20 2623.7718
        4:            1  2010       u        13  529.3859
        5:            1  2011       v        25 1190.9405
       ---                                               
      484:            4  2013       g         7  511.6028
      485:            4  2013       x         3 1865.8138
      486:            4  2014       k         8  838.6694
      487:            4  2015       s        12  654.6153
      488:            4  2015       t         8  352.9515

# resampling_core summarise = FALSE returns consistent results

    Code
      set.seed(42)
      dplyr::as_tibble(resampling_core(x = test_dt, measure = c("ABUNDANCE",
        "BIOMASS"), summarise = FALSE))
    Output
      # A tibble: 768 x 7
         assemblageID minsamp SAMPLE_DESC  YEAR Species ABUNDANCE BIOMASS
                <int>   <int> <chr>       <int> <chr>       <int>   <dbl>
       1            1       2 A            2010 j              14   153. 
       2            1       2 A            2010 r               5   165. 
       3            1       2 A            2010 m              11  2020. 
       4            1       2 A            2010 u              13   529. 
       5            1       2 A            2011 v              16   471. 
       6            1       2 A            2011 s              15  1546. 
       7            1       2 A            2011 p              11    40.5
       8            1       2 A            2011 q               6   890. 
       9            1       2 A            2012 l               9  2071. 
      10            1       2 A            2012 i               6   250. 
      # i 758 more rows

