# gridding produces consistent results

    Code
      summarise_cells(gridding(meta, btf, verbose = FALSE))
    Output
         STUDY_ID StudyMethod n_rows n_cells min_cell max_cell
      1        10          SL   1406       1   359170   359170
      2        18          SL   8034       1   335699   335699
      3        41          SL    418       1   453357   453357
      4        53          SL     44       1   394335   394335
      5        59          SL    427       1   470660   470660
      6       211          ML   1651      12   504467   529240
      7       333          SL   9261       1   426984   426984
      8       372          ML  25195      85  2309488  2459963
      9       402          ML    912       3  3190385  3191117
      10      431          ML   3804     456  4717520  5146024
      11      437          ML   2340      10  2074399  2078777
      12      466          ML  27592     250   539376   571439

# gridding respects provided res parameter

    Code
      summarise_cells(gridding(meta, btf, res = 18, verbose = FALSE))
    Output
         STUDY_ID StudyMethod n_rows n_cells   min_cell   max_cell
      1        10          SL   1406       1  261246279  261246279
      2        18          SL   8034       1  244157563  244157563
      3        41          SL    418       1  330239140  330239140
      4        53          SL     44       1  287232524  287232524
      5        59          SL    427       1  343008206  343008206
      6       211          ML   1651      60  367383113  385313947
      7       333          SL   9261       1  310808534  310808534
      8       372          ML  25195      86 1683329896 1793405376
      9       402          ML    912       7 2325790190 2326183931
      10      431          ML   3804    1553 3438762163 3751540729
      11      437          ML   2340      16 1512117720 1515030888
      12      466          ML  27592    1390  392870351  416115638

# gridding respects res_by_data argument

    Code
      summarise_cells(gridding(meta, btf, res_by_data = TRUE, verbose = FALSE))
    Output
         STUDY_ID StudyMethod n_rows n_cells  min_cell  max_cell
      1        10          SL   1406       1   9676790   9676790
      2        18          SL   8034       1   9044316   9044316
      3        41          SL    418       1  12233831  12233831
      4        53          SL     44       1  10639590  10639590
      5        59          SL    427       1  12705645  12705645
      6       211          ML   1651      39  13607506  14272312
      7       333          SL   9261       1  11513921  11513921
      8       372          ML  25195      86  62344851  66424512
      9       402          ML    912       7  86140209  86157714
      10      431          ML   3804    1027 127360422 138944518
      11      437          ML   2340      14  56005877  56115236
      12      466          ML  27592     934  14549853  15411494

