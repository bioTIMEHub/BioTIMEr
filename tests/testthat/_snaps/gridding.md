# gridding produces consistent results

    Code
      gridding(meta, btf)
    Message
      OK: all SL studies have 1 grid cell
    Output
      # A tibble: 81,084 x 20
         STUDY_ID SAMPLE_DESC        cell  resolution assemblageID CLIMATE REALM TAXA 
            <int> <chr>              <fct> <chr>      <fct>        <chr>   <chr> <chr>
       1       10 1984_12_Control_0~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       2       10 1984_12_Control_0~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       3       10 1984_12_Treefall_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       4       10 1984_12_Treefall_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       5       10 1984_1_Control_0_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       6       10 1984_1_Control_Ba~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       7       10 1984_1_Treefall_0~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       8       10 1984_1_Treefall_B~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       9       10 1984_2_Control_0_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
      10       10 1984_2_Control_Ba~ 3591~ species    10_359170    Temper~ Terr~ Plan~
      # i 81,074 more rows
      # i 12 more variables: StudyMethod <chr>, ABUNDANCE_TYPE <chr>,
      #   BIOMASS_TYPE <chr>, YEAR <int>, LATITUDE <dbl>, LONGITUDE <dbl>,
      #   Species <chr>, taxon <chr>, DAY <int>, MONTH <int>, ABUNDANCE <dbl>,
      #   BIOMASS <dbl>

# gridding respects provided res parameter

    Code
      gridding(meta, btf, res = 18)
    Condition
      Warning:
      NAs introduced by coercion to integer range
    Message
      OK: all SL studies have 1 grid cell
    Output
      # A tibble: 81,084 x 20
         STUDY_ID SAMPLE_DESC        cell  resolution assemblageID CLIMATE REALM TAXA 
            <int> <chr>              <fct> <chr>      <fct>        <chr>   <chr> <chr>
       1       10 1984_12_Control_0~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       2       10 1984_12_Control_0~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       3       10 1984_12_Treefall_~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       4       10 1984_12_Treefall_~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       5       10 1984_1_Control_0_~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       6       10 1984_1_Control_Ba~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       7       10 1984_1_Treefall_0~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       8       10 1984_1_Treefall_B~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
       9       10 1984_2_Control_0_~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
      10       10 1984_2_Control_Ba~ 2612~ species    10_261246279 Temper~ Terr~ Plan~
      # i 81,074 more rows
      # i 12 more variables: StudyMethod <chr>, ABUNDANCE_TYPE <chr>,
      #   BIOMASS_TYPE <chr>, YEAR <int>, LATITUDE <dbl>, LONGITUDE <dbl>,
      #   Species <chr>, taxon <chr>, DAY <int>, MONTH <int>, ABUNDANCE <dbl>,
      #   BIOMASS <dbl>

# gridding respects resByData argument

    Code
      gridding(meta, btf, resByData = TRUE)
    Output
      Resolution: 15, Area (km^2): 3.55473501726709, Spacing (km): 1.86210705534756, CLS (km): 2.12744663988395
    Message
      OK: all SL studies have 1 grid cell
    Output
      # A tibble: 81,084 x 20
         STUDY_ID SAMPLE_DESC        cell  resolution assemblageID CLIMATE REALM TAXA 
            <int> <chr>              <fct> <chr>      <fct>        <chr>   <chr> <chr>
       1       10 1984_12_Control_0~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       2       10 1984_12_Control_0~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       3       10 1984_12_Treefall_~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       4       10 1984_12_Treefall_~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       5       10 1984_1_Control_0_~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       6       10 1984_1_Control_Ba~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       7       10 1984_1_Treefall_0~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       8       10 1984_1_Treefall_B~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
       9       10 1984_2_Control_0_~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
      10       10 1984_2_Control_Ba~ 9676~ species    10_9676790   Temper~ Terr~ Plan~
      # i 81,074 more rows
      # i 12 more variables: StudyMethod <chr>, ABUNDANCE_TYPE <chr>,
      #   BIOMASS_TYPE <chr>, YEAR <int>, LATITUDE <dbl>, LONGITUDE <dbl>,
      #   Species <chr>, taxon <chr>, DAY <int>, MONTH <int>, ABUNDANCE <dbl>,
      #   BIOMASS <dbl>

# gridding correctly manages data.table objects

    Code
      result
    Output
      # A tibble: 81,084 x 20
         STUDY_ID SAMPLE_DESC        cell  resolution assemblageID CLIMATE REALM TAXA 
            <int> <chr>              <fct> <chr>      <fct>        <chr>   <chr> <chr>
       1       10 1984_12_Control_0~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       2       10 1984_12_Control_0~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       3       10 1984_12_Treefall_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       4       10 1984_12_Treefall_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       5       10 1984_1_Control_0_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       6       10 1984_1_Control_Ba~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       7       10 1984_1_Treefall_0~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       8       10 1984_1_Treefall_B~ 3591~ species    10_359170    Temper~ Terr~ Plan~
       9       10 1984_2_Control_0_~ 3591~ species    10_359170    Temper~ Terr~ Plan~
      10       10 1984_2_Control_Ba~ 3591~ species    10_359170    Temper~ Terr~ Plan~
      # i 81,074 more rows
      # i 12 more variables: StudyMethod <chr>, ABUNDANCE_TYPE <chr>,
      #   BIOMASS_TYPE <chr>, YEAR <int>, LATITUDE <dbl>, LONGITUDE <dbl>,
      #   Species <chr>, taxon <chr>, DAY <int>, MONTH <int>, ABUNDANCE <dbl>,
      #   BIOMASS <dbl>

