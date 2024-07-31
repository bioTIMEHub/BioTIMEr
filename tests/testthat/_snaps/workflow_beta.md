# Whole workflow works consistently

    Code
      set.seed(42)
      gridding(meta, btf) %>% resampling(measure = "ABUNDANCE", resamps = 1L) %>%
        getBetaMetrics(measure = "ABUNDANCE") %>% getLinearRegressions(divType = "beta")
    Message
      OK: all SL studies have 1 grid cell
    Output
           assemblageID           metric         slope       pvalue significance
      1       10_359170      JaccardDiss  1.071370e-02 1.523005e-01            0
      2       10_359170 MorisitaHornDiss  4.656071e-04 5.285384e-01            0
      3       10_359170   BrayCurtisDiss -5.768187e-03 4.980033e-01            0
      4       18_335699      JaccardDiss -4.836740e-04 7.064775e-01            0
      5       18_335699 MorisitaHornDiss  1.893623e-03 2.424596e-01            0
      6       18_335699   BrayCurtisDiss  1.830878e-03 1.427971e-01            0
      7       41_453357      JaccardDiss  7.420661e-03 1.915310e-02            1
      8       41_453357 MorisitaHornDiss  1.166606e-02 2.516155e-02            1
      9       41_453357   BrayCurtisDiss  8.008083e-03 6.489529e-02            0
      10      53_394335      JaccardDiss -2.715858e-02 6.325870e-02            0
      11      53_394335 MorisitaHornDiss -1.748095e-02 9.829269e-02            0
      12      53_394335   BrayCurtisDiss -5.578685e-03 5.523670e-01            0
      13      59_470660      JaccardDiss  1.577017e-03 6.146532e-01            0
      14      59_470660 MorisitaHornDiss  8.333189e-04 5.468332e-01            0
      15      59_470660   BrayCurtisDiss -1.101916e-03 6.743582e-01            0
      16     333_426984      JaccardDiss -3.443405e-03 1.891558e-01            0
      17     333_426984 MorisitaHornDiss -3.252555e-03 5.575938e-01            0
      18     333_426984   BrayCurtisDiss -2.683527e-03 4.865155e-01            0
      19    372_2374518      JaccardDiss  1.161440e-04 9.956151e-01            0
      20    372_2374518 MorisitaHornDiss -6.532228e-02 3.739947e-01            0
      21    372_2374518   BrayCurtisDiss -4.400873e-02 1.598471e-01            0
      22    372_2378881      JaccardDiss -1.492762e-02 7.326181e-01            0
      23    372_2378881 MorisitaHornDiss -1.915546e-01 2.323427e-01            0
      24    372_2378881   BrayCurtisDiss -5.255309e-02 4.102329e-01            0
      25    372_2426320      JaccardDiss  2.534381e-02 5.728895e-01            0
      26    372_2426320 MorisitaHornDiss  7.207805e-03 7.719967e-01            0
      27    372_2426320   BrayCurtisDiss -2.177464e-02 5.259071e-01            0
      28    372_2427777      JaccardDiss -2.124867e-02 3.622905e-01            0
      29    372_2427777 MorisitaHornDiss  5.038954e-02 3.035255e-02            1
      30    372_2427777   BrayCurtisDiss  5.253555e-02 5.824208e-02            0
      31    372_2428506      JaccardDiss -9.946524e-03 6.521010e-01            0
      32    372_2428506 MorisitaHornDiss  1.826439e-02 2.566406e-01            0
      33    372_2428506   BrayCurtisDiss  9.576958e-03 6.088547e-01            0
      34    372_2426316      JaccardDiss  1.867472e-02 6.263169e-01            0
      35    372_2426316 MorisitaHornDiss  1.999242e-02 8.308692e-01            0
      36    372_2426316   BrayCurtisDiss  3.308663e-02 5.597768e-01            0
      37    372_2408087      JaccardDiss -1.082654e-01 2.902634e-01            0
      38    372_2408087 MorisitaHornDiss -1.218309e-01 3.704633e-01            0
      39    372_2408087   BrayCurtisDiss -1.016106e-01 3.721239e-01            0
      40    372_2399318      JaccardDiss -3.513688e-02 2.802654e-01            0
      41    372_2399318 MorisitaHornDiss -1.764285e-03 9.453931e-01            0
      42    372_2399318   BrayCurtisDiss -3.929384e-02 2.511300e-01            0
      43    372_2347502      JaccardDiss -1.503137e-02 5.848645e-01            0
      44    372_2347502 MorisitaHornDiss  1.380972e-03 9.699764e-01            0
      45    372_2347502   BrayCurtisDiss  2.417344e-02 1.822837e-01            0
      46    372_2430698      JaccardDiss -4.614341e-02 1.231680e-03            1
      47    372_2430698 MorisitaHornDiss -8.455444e-03 6.842775e-01            0
      48    372_2430698   BrayCurtisDiss -2.112776e-02 2.992602e-01            0
      49    372_2428503      JaccardDiss -1.398778e-02 7.461264e-01            0
      50    372_2428503 MorisitaHornDiss -5.656685e-03 8.365831e-01            0
      51    372_2428503   BrayCurtisDiss -5.347077e-03 8.024499e-01            0
      52    372_2408078      JaccardDiss  6.104762e-02 6.467229e-02            0
      53    372_2408078 MorisitaHornDiss  7.079879e-03 8.859450e-01            0
      54    372_2408078   BrayCurtisDiss  3.789254e-02 1.187573e-01            0
      55    372_2397858      JaccardDiss  4.452381e-02 7.421071e-02            0
      56    372_2397858 MorisitaHornDiss -2.088397e-02 4.779132e-01            0
      57    372_2397858   BrayCurtisDiss  3.972987e-03 9.189427e-01            0
      58    372_2400785      JaccardDiss -1.429912e-02 6.498244e-01            0
      59    372_2400785 MorisitaHornDiss  2.177585e-02 4.488512e-01            0
      60    372_2400785   BrayCurtisDiss -1.570271e-02 3.733749e-01            0
      61    372_2437271      JaccardDiss -2.203720e-03 8.903643e-01            0
      62    372_2437271 MorisitaHornDiss  4.256112e-02 5.300385e-01            0
      63    372_2437271   BrayCurtisDiss  2.384913e-02 3.705506e-01            0
      64    372_2424858      JaccardDiss -1.553885e-03 9.676791e-01            0
      65    372_2424858 MorisitaHornDiss -8.618240e-04 9.830879e-01            0
      66    372_2424858   BrayCurtisDiss -1.086228e-03 9.883446e-01            0
      67    372_2410991      JaccardDiss -4.494570e-02 3.713864e-02            1
      68    372_2410991 MorisitaHornDiss -4.370420e-02 4.991061e-01            0
      69    372_2410991   BrayCurtisDiss -2.980477e-02 4.059124e-01            0
      70    372_2375241      JaccardDiss  1.126984e-02 5.139152e-01            0
      71    372_2375241 MorisitaHornDiss  7.447253e-03 8.800072e-01            0
      72    372_2375241   BrayCurtisDiss  7.542109e-03 8.824306e-01            0
      73    372_2406610      JaccardDiss  1.758381e-02 6.157213e-01            0
      74    372_2406610 MorisitaHornDiss  6.371796e-02 3.604482e-02            1
      75    372_2406610   BrayCurtisDiss  6.568171e-02 8.194726e-02            0
      76    372_2459963      JaccardDiss -2.631216e-02 5.641774e-01            0
      77    372_2459963 MorisitaHornDiss -2.693030e-02 2.330721e-01            0
      78    372_2459963   BrayCurtisDiss -2.850156e-02 1.988471e-01            0
      79    372_2442444      JaccardDiss  2.838828e-01 3.373396e-01            0
      80    372_2442444 MorisitaHornDiss  4.390241e-01 3.372876e-01            0
      81    372_2442444   BrayCurtisDiss  3.232323e-01 3.384415e-01            0
      82    372_2434415      JaccardDiss  3.635807e-02 5.597884e-01            0
      83    372_2434415 MorisitaHornDiss -2.562728e-02 6.507549e-01            0
      84    372_2434415   BrayCurtisDiss -4.108259e-03 7.689999e-01            0
      85    372_2367201      JaccardDiss  1.415239e-02 3.680376e-01            0
      86    372_2367201 MorisitaHornDiss  1.732159e-02 7.115466e-01            0
      87    372_2367201   BrayCurtisDiss  3.142611e-02 4.239410e-01            0
      88    372_2440940      JaccardDiss -7.707932e-02 1.831458e-01            0
      89    372_2440940 MorisitaHornDiss  3.776262e-02 6.347667e-01            0
      90    372_2440940   BrayCurtisDiss -5.236258e-04 9.909276e-01            0
      91    372_2443127      JaccardDiss -4.383115e-02 5.141584e-01            0
      92    372_2443127 MorisitaHornDiss  1.501766e-02 7.759336e-01            0
      93    372_2443127   BrayCurtisDiss -2.120756e-02 2.902911e-01            0
      94    372_2432888      JaccardDiss -1.203860e-01 3.386586e-01            0
      95    372_2432888 MorisitaHornDiss -1.327343e-01 2.789167e-01            0
      96    372_2432888   BrayCurtisDiss -1.442260e-01 1.475428e-01            0
      97    372_2428509      JaccardDiss  3.076923e-02 4.037152e-01            0
      98    372_2428509 MorisitaHornDiss -7.329418e-02 6.866745e-01            0
      99    372_2428509   BrayCurtisDiss -1.097597e-02 7.848307e-01            0
      100   372_2432885      JaccardDiss -1.500000e-01 2.254033e-01            0
      101   372_2432885 MorisitaHornDiss -2.558635e-01 2.254033e-01            0
      102   372_2432885   BrayCurtisDiss -2.000000e-01 2.315502e-01            0
      103   372_2421957      JaccardDiss  5.444444e-02 3.867348e-01            0
      104   372_2421957 MorisitaHornDiss -7.157530e-03 9.591092e-01            0
      105   372_2421957   BrayCurtisDiss  8.409669e-02 3.818064e-01            0
      106   372_2406614      JaccardDiss  2.059524e-02 4.240209e-01            0
      107   372_2406614 MorisitaHornDiss -2.508615e-02 3.023406e-01            0
      108   372_2406614   BrayCurtisDiss -5.839017e-03 6.216482e-02            0
      109   372_2402963      JaccardDiss -1.757549e-02 2.873214e-01            0
      110   372_2402963 MorisitaHornDiss -2.715286e-02 5.294565e-01            0
      111   372_2402963   BrayCurtisDiss -1.936701e-02 5.630169e-01            0
      112   372_2426315      JaccardDiss -5.928854e-03 8.304062e-01            0
      113   372_2426315 MorisitaHornDiss  7.479867e-02 5.658614e-01            0
      114   372_2426315   BrayCurtisDiss  3.611484e-02 4.543808e-01            0
      115   372_2427046      JaccardDiss -1.412338e-02 5.786922e-01            0
      116   372_2427046 MorisitaHornDiss -1.844753e-02 4.920935e-01            0
      117   372_2427046   BrayCurtisDiss  9.705892e-03 7.293620e-01            0
      118   372_2403683      JaccardDiss -8.117004e-03 8.504108e-01            0
      119   372_2403683 MorisitaHornDiss  4.540674e-02 7.810627e-01            0
      120   372_2403683   BrayCurtisDiss -7.437977e-02 4.683208e-01            0
      121   372_2369392      JaccardDiss  3.365368e-02 2.944867e-01            0
      122   372_2369392 MorisitaHornDiss  5.640890e-02 5.972674e-01            0
      123   372_2369392   BrayCurtisDiss  1.144574e-01 1.244533e-01            0
      124   372_2400047      JaccardDiss -2.082644e-03 9.290802e-01            0
      125   372_2400047 MorisitaHornDiss  2.773136e-02 4.647990e-01            0
      126   372_2400047   BrayCurtisDiss  1.206196e-02 6.504471e-01            0
      127   372_2431454      JaccardDiss -1.281988e-02 1.268790e-01            0
      128   372_2431454 MorisitaHornDiss -6.504727e-02 1.360440e-01            0
      129   372_2431454   BrayCurtisDiss -3.144370e-02 1.167259e-01            0
      130   372_2443903      JaccardDiss -1.616865e-02 7.707239e-01            0
      131   372_2443903 MorisitaHornDiss -5.588152e-03 9.364859e-01            0
      132   372_2443903   BrayCurtisDiss -2.198419e-02 6.679012e-01            0
      133   372_2394207      JaccardDiss  9.928079e-03 7.133550e-01            0
      134   372_2394207 MorisitaHornDiss -2.447046e-02 1.224596e-01            0
      135   372_2394207   BrayCurtisDiss -1.895715e-02 4.987456e-01            0
      136   372_2362812      JaccardDiss -3.340841e-02 7.815181e-01            0
      137   372_2362812 MorisitaHornDiss -5.429285e-02 6.289764e-01            0
      138   372_2362812   BrayCurtisDiss -5.714781e-03 5.823584e-01            0
      139   372_2410264      JaccardDiss -6.009852e-02 1.929262e-01            0
      140   372_2410264 MorisitaHornDiss -6.936618e-02 1.659163e-01            0
      141   372_2410264   BrayCurtisDiss -5.788179e-02 2.274396e-01            0
      142   372_2452656      JaccardDiss -2.183897e-03 8.772665e-01            0
      143   372_2452656 MorisitaHornDiss  2.469144e-03 9.046421e-01            0
      144   372_2452656   BrayCurtisDiss  2.782903e-03 9.164912e-01            0
      145   372_2379617      JaccardDiss -1.609848e-02 6.566742e-01            0
      146   372_2379617 MorisitaHornDiss  8.791870e-03 3.273454e-01            0
      147   372_2379617   BrayCurtisDiss  2.513254e-02 2.648098e-01            0
      148   372_2441713      JaccardDiss  5.483703e-03 8.061240e-01            0
      149   372_2441713 MorisitaHornDiss -3.304722e-03 9.164222e-01            0
      150   372_2441713   BrayCurtisDiss -1.610261e-02 5.752383e-01            0
      151   372_2442439      JaccardDiss  3.326694e-02 1.509734e-01            0
      152   372_2442439 MorisitaHornDiss -3.529912e-03 9.895258e-01            0
      153   372_2442439   BrayCurtisDiss -1.104686e-02 9.216624e-01            0
      154   372_2440221      JaccardDiss  4.307407e-02 1.986100e-01            0
      155   372_2440221 MorisitaHornDiss  7.575176e-03 9.419344e-01            0
      156   372_2440221   BrayCurtisDiss  6.682252e-03 8.293214e-01            0
      157   372_2438027      JaccardDiss  5.265573e-03 8.697510e-01            0
      158   372_2438027 MorisitaHornDiss  2.824619e-03 8.236073e-01            0
      159   372_2438027   BrayCurtisDiss  8.496663e-03 7.612124e-01            0
      160   372_2434379      JaccardDiss -3.743316e-02 2.597046e-01            0
      161   372_2434379 MorisitaHornDiss -4.382087e-02 1.366001e-01            0
      162   372_2434379   BrayCurtisDiss -1.602999e-01 1.491734e-01            0
      163   372_2435823      JaccardDiss  2.083333e-03 9.318006e-01            0
      164   372_2435823 MorisitaHornDiss  6.015271e-03 8.592846e-01            0
      165   372_2435823   BrayCurtisDiss  2.014220e-02 5.592771e-01            0
      166   372_2425589      JaccardDiss  6.070261e-03 8.182270e-01            0
      167   372_2425589 MorisitaHornDiss  2.521656e-02 3.905116e-01            0
      168   372_2425589   BrayCurtisDiss  1.405591e-02 6.277330e-01            0
      169   372_2427047      JaccardDiss  3.567073e-02 6.713513e-02            0
      170   372_2427047 MorisitaHornDiss  2.259367e-02 5.039033e-01            0
      171   372_2427047   BrayCurtisDiss  4.312928e-02 5.182931e-01            0
      172   372_2427776      JaccardDiss  6.448416e-02 1.846854e-01            0
      173   372_2427776 MorisitaHornDiss  3.179603e-02 6.651079e-02            0
      174   372_2427776   BrayCurtisDiss  1.116201e-01 2.409243e-02            1
      175   372_2429234      JaccardDiss -5.248918e-03 9.122648e-01            0
      176   372_2429234 MorisitaHornDiss  2.648363e-02 4.315953e-01            0
      177   372_2429234   BrayCurtisDiss  2.104579e-02 4.271596e-01            0
      178   372_2429233      JaccardDiss  1.588911e-02 5.116462e-01            0
      179   372_2429233 MorisitaHornDiss -1.513228e-02 6.915588e-01            0
      180   372_2429233   BrayCurtisDiss -5.836983e-03 8.690777e-01            0
      181   372_2425610      JaccardDiss  6.549610e-04 9.751032e-01            0
      182   372_2425610 MorisitaHornDiss  9.216475e-02 5.690551e-01            0
      183   372_2425610   BrayCurtisDiss  5.543420e-02 5.536959e-01            0
      184   372_2423417      JaccardDiss  8.333333e-03 9.729090e-01            0
      185   372_2423417 MorisitaHornDiss -1.748655e-03 9.977972e-01            0
      186   372_2423417   BrayCurtisDiss -3.488832e-03 9.934646e-01            0
      187   372_2404439      JaccardDiss -2.254642e-02 6.731748e-01            0
      188   372_2404439 MorisitaHornDiss  1.209645e-02 5.325453e-01            0
      189   372_2404439   BrayCurtisDiss  2.244400e-02 5.358697e-01            0
      190   372_2412474      JaccardDiss -1.055807e-01 1.419932e-01            0
      191   372_2412474 MorisitaHornDiss -1.463545e-02 9.639600e-01            0
      192   372_2412474   BrayCurtisDiss -5.724876e-02 4.851032e-01            0
      193   372_2419754      JaccardDiss  4.191383e-02 3.805889e-01            0
      194   372_2419754 MorisitaHornDiss  1.257400e-01 1.001018e-01            0
      195   372_2419754   BrayCurtisDiss  5.696172e-02 1.412721e-01            0
      196   372_2419028      JaccardDiss -7.081553e-02 1.928833e-01            0
      197   372_2419028 MorisitaHornDiss -1.248180e-01 2.207599e-01            0
      198   372_2419028   BrayCurtisDiss -7.741207e-02 2.285268e-01            0
      199   372_2409543      JaccardDiss  2.500000e-02 9.134846e-01            0
      200   372_2409543 MorisitaHornDiss  1.107204e-01 8.015349e-01            0
      201   372_2409543   BrayCurtisDiss  5.149097e-02 8.537378e-01            0
      202   372_2403696      JaccardDiss  7.259593e-03 7.271403e-01            0
      203   372_2403696 MorisitaHornDiss  3.490083e-02 7.285718e-01            0
      204   372_2403696   BrayCurtisDiss  2.485743e-02 5.973614e-01            0
      205   372_2400777      JaccardDiss  1.964912e-02 6.695718e-01            0
      206   372_2400777 MorisitaHornDiss  6.639881e-03 7.816078e-01            0
      207   372_2400777   BrayCurtisDiss  9.757108e-03 6.597200e-01            0
      208   372_2394218      JaccardDiss  3.482668e-02 3.597420e-01            0
      209   372_2394218 MorisitaHornDiss  4.091850e-02 6.081363e-01            0
      210   372_2394218   BrayCurtisDiss  4.067252e-02 1.704733e-01            0
      211   372_2399315      JaccardDiss -1.184755e-02 7.450225e-01            0
      212   372_2399315 MorisitaHornDiss  6.543941e-02 1.376498e-02            1
      213   372_2399315   BrayCurtisDiss  2.743701e-02 4.425304e-01            0
      214   372_2375959      JaccardDiss  5.258621e-02 4.147747e-02            1
      215   372_2375959 MorisitaHornDiss  2.106288e-02 7.514083e-01            0
      216   372_2375959   BrayCurtisDiss  3.345947e-02 5.899522e-01            0
      217   372_2363562      JaccardDiss -3.088578e-02 4.338620e-01            0
      218   372_2363562 MorisitaHornDiss  3.598716e-02 5.996966e-01            0
      219   372_2363562   BrayCurtisDiss  1.725243e-02 2.787979e-01            0
      220   372_2365726      JaccardDiss  7.987777e-02 1.051203e-01            0
      221   372_2365726 MorisitaHornDiss  9.318934e-02 1.845700e-01            0
      222   372_2365726   BrayCurtisDiss  4.531129e-02 7.716041e-02            0
      223   372_2435073      JaccardDiss  3.903743e-02 5.512502e-01            0
      224   372_2435073 MorisitaHornDiss -4.985114e-02 3.922868e-01            0
      225   372_2435073   BrayCurtisDiss -1.498959e-02 7.088235e-01            0
      226   372_2432889      JaccardDiss  5.946765e-15 1.000000e+00            0
      227   372_2432889 MorisitaHornDiss -1.689708e-02 8.013668e-01            0
      228   372_2432889   BrayCurtisDiss  1.666667e-02 8.238389e-01            0
      229   372_2433622      JaccardDiss -7.142857e-02 8.789623e-01            0
      230   372_2433622 MorisitaHornDiss -7.142857e-02 8.789623e-01            0
      231   372_2433622   BrayCurtisDiss -4.761905e-02 8.789623e-01            0
      232   372_2426326      JaccardDiss  2.500000e-01 3.333333e-01            0
      233   372_2426326 MorisitaHornDiss -1.709402e-02 9.216369e-01            0
      234   372_2426326   BrayCurtisDiss -2.466750e-14 1.000000e+00            0
      235   372_2428505      JaccardDiss  3.333333e-02 7.418011e-01            0
      236   372_2428505 MorisitaHornDiss  1.855886e-02 8.324109e-01            0
      237   372_2428505   BrayCurtisDiss  1.360714e-02 9.100672e-01            0
      238   372_2414636      JaccardDiss -2.500000e-01 3.333333e-01            0
      239   372_2414636 MorisitaHornDiss -3.750938e-04 3.333333e-01            0
      240   372_2414636   BrayCurtisDiss -2.119152e-02 8.708549e-01            0
      241   402_3191117      JaccardDiss  1.435934e-02 3.889536e-01            0
      242   402_3191117 MorisitaHornDiss -8.641587e-04 9.870548e-01            0
      243   402_3191117   BrayCurtisDiss  1.765226e-02 5.057061e-01            0
      244   402_3191116      JaccardDiss  3.739326e-02 1.671914e-01            0
      245   402_3191116 MorisitaHornDiss  5.762249e-03 9.362878e-01            0
      246   402_3191116   BrayCurtisDiss  3.169658e-02 6.788678e-01            0
      247   402_3190385      JaccardDiss  2.981693e-02 2.943622e-01            0
      248   402_3190385 MorisitaHornDiss -2.881915e-02 6.771102e-01            0
      249   402_3190385   BrayCurtisDiss -7.802869e-03 7.842066e-01            0
      250   431_5118319      JaccardDiss  3.814208e-02 1.984299e-01            0
      251   431_5118319 MorisitaHornDiss  9.781639e-03 9.031074e-01            0
      252   431_5118319   BrayCurtisDiss  3.979399e-02 4.007320e-01            0
      253   431_5122694      JaccardDiss  4.476040e-03 6.987513e-01            0
      254   431_5122694 MorisitaHornDiss  1.667336e-04 6.987513e-01            0
      255   431_5122694   BrayCurtisDiss  4.711621e-04 6.987513e-01            0
      256   431_4765710      JaccardDiss -8.928571e-02 2.122956e-01            0
      257   431_4765710 MorisitaHornDiss -8.928571e-02 2.122956e-01            0
      258   431_4765710   BrayCurtisDiss -7.423756e-02 2.122956e-01            0
      259   431_5103014      JaccardDiss  1.250000e-01 1.544210e-01            0
      260   431_5103014 MorisitaHornDiss  3.400394e-01 2.199838e-01            0
      261   431_5103014   BrayCurtisDiss  2.285903e-01 2.410686e-01            0
      262   431_4749643      JaccardDiss  4.389313e-02 3.292686e-01            0
      263   431_4749643 MorisitaHornDiss  4.100040e-02 3.683269e-01            0
      264   431_4749643   BrayCurtisDiss  4.860051e-02 2.804668e-01            0
      265   431_4750373      JaccardDiss  6.024096e-03 9.366276e-01            0
      266   431_4750373 MorisitaHornDiss  1.199820e-02 9.366276e-01            0
      267   431_4750373   BrayCurtisDiss  3.804692e-03 9.366276e-01            0
      268   431_4751834      JaccardDiss  3.888889e-02 3.975359e-01            0
      269   431_4751834 MorisitaHornDiss  2.646048e-02 3.975359e-01            0
      270   431_4751834   BrayCurtisDiss  2.393162e-02 3.975359e-01            0
      271   431_5120509      JaccardDiss -1.173972e-02 1.199589e-01            0
      272   431_5120509 MorisitaHornDiss -1.642427e-02 2.454163e-01            0
      273   431_5120509   BrayCurtisDiss -9.951087e-03 1.073958e-01            0
      274   431_5132911      JaccardDiss -1.629073e-02 7.145180e-01            0
      275   431_5132911 MorisitaHornDiss -2.130015e-02 5.181540e-01            0
      276   431_5132911   BrayCurtisDiss -8.247122e-03 7.997324e-01            0
      277   431_5133641      JaccardDiss -3.237179e-17 4.785132e-02            1
      278   431_5133641 MorisitaHornDiss  8.851463e-03 6.188153e-01            0
      279   431_5133641   BrayCurtisDiss  1.251574e-02 3.686561e-01            0
      280   431_5132912      JaccardDiss  1.126180e-02 5.049744e-01            0
      281   431_5132912 MorisitaHornDiss  6.273879e-02 3.316188e-02            1
      282   431_5132912   BrayCurtisDiss  2.638179e-02 6.086101e-02            0
      283   431_4745246      JaccardDiss -2.304469e-02 2.440066e-02            1
      284   431_4745246 MorisitaHornDiss -2.978010e-02 4.101531e-01            0
      285   431_4745246   BrayCurtisDiss -1.002602e-02 3.175273e-01            0
      286   431_5104466      JaccardDiss -1.484480e-02 7.723926e-01            0
      287   431_5104466 MorisitaHornDiss -4.567632e-03 7.723926e-01            0
      288   431_5104466   BrayCurtisDiss -7.422402e-03 7.723926e-01            0
      289   431_4764980      JaccardDiss -3.211009e-02 6.055959e-01            0
      290   431_4764980 MorisitaHornDiss -3.211009e-02 6.055959e-01            0
      291   431_4764980   BrayCurtisDiss -3.211009e-02 6.055959e-01            0
      292   431_5122695      JaccardDiss -3.919142e-03 8.502029e-01            0
      293   431_5122695 MorisitaHornDiss -1.912207e-02 5.492964e-01            0
      294   431_5122695   BrayCurtisDiss -3.287185e-03 8.094094e-01            0
      295   431_5100824      JaccardDiss -2.173913e-02 1.657421e-01            0
      296   431_5100824 MorisitaHornDiss -4.347522e-02 1.657421e-01            0
      297   431_5100824   BrayCurtisDiss -7.186489e-04 1.657421e-01            0
      298   431_5101551      JaccardDiss  3.151618e-02 1.182976e-01            0
      299   431_5101551 MorisitaHornDiss  5.526580e-02 1.497591e-01            0
      300   431_5101551   BrayCurtisDiss  1.788756e-02 1.021607e-01            0
      301   431_5101552      JaccardDiss  1.340996e-02 6.172786e-01            0
      302   431_5101552 MorisitaHornDiss  2.982534e-02 5.161738e-01            0
      303   431_5101552   BrayCurtisDiss -3.123959e-03 8.790467e-01            0
      304   431_4764250      JaccardDiss  1.941748e-02 4.836722e-01            0
      305   431_4764250 MorisitaHornDiss  9.039170e-03 4.836722e-01            0
      306   431_4764250   BrayCurtisDiss  7.281553e-03 4.836722e-01            0
      307   431_4743784      JaccardDiss -5.376344e-03 8.898133e-01            0
      308   431_4743784 MorisitaHornDiss  2.213611e-02 6.160203e-01            0
      309   431_4743784   BrayCurtisDiss -1.609318e-02 5.421674e-01            0
      310   431_5122698      JaccardDiss -1.229508e-02 4.078329e-02            1
      311   431_5122698 MorisitaHornDiss -1.886908e-02 6.203708e-01            0
      312   431_5122698   BrayCurtisDiss  1.087235e-02 7.546103e-01            0
      313   431_5111033      JaccardDiss -2.010490e-02 6.229602e-01            0
      314   431_5111033 MorisitaHornDiss  5.422382e-02 1.958288e-01            0
      315   431_5111033   BrayCurtisDiss -1.140942e-02 7.029190e-01            0
      316   431_5123428      JaccardDiss  1.540284e-02 7.046442e-01            0
      317   431_5123428 MorisitaHornDiss  4.400812e-03 7.046442e-01            0
      318   431_5123428   BrayCurtisDiss -2.013192e-02 1.817181e-01            0
      319   431_5123427      JaccardDiss -2.053712e-02 7.046442e-01            0
      320   431_5123427 MorisitaHornDiss -2.959199e-02 5.741908e-01            0
      321   431_5123427   BrayCurtisDiss -3.568889e-03 6.754829e-01            0
      322   431_5120507      JaccardDiss  6.761833e-03 7.533089e-01            0
      323   431_5120507 MorisitaHornDiss  1.343753e-02 7.533089e-01            0
      324   431_5120507   BrayCurtisDiss -1.143177e-03 9.473173e-01            0
      325   431_4756925      JaccardDiss  1.607445e-02 4.147608e-01            0
      326   431_4756925 MorisitaHornDiss  4.829582e-02 5.111620e-02            0
      327   431_4756925   BrayCurtisDiss  2.687867e-02 1.717611e-01            0
      328   431_5124881      JaccardDiss -1.493722e-15 1.000000e+00            0
      329   431_5124881 MorisitaHornDiss -1.493722e-15 1.000000e+00            0
      330   431_5124881   BrayCurtisDiss -4.984491e-16 1.000000e+00            0
      331   431_5119779      JaccardDiss -1.344086e-03 8.710726e-01            0
      332   431_5119779 MorisitaHornDiss -1.792115e-03 8.710726e-01            0
      333   431_5119779   BrayCurtisDiss -1.792115e-03 8.710726e-01            0
      334   431_4748913      JaccardDiss -1.964183e-02 7.538188e-02            0
      335   431_4748913 MorisitaHornDiss -2.846872e-02 2.284897e-01            0
      336   431_4748913   BrayCurtisDiss -1.735865e-02 2.800730e-01            0
      337   431_4756217      JaccardDiss -2.096774e-02 3.504545e-01            0
      338   431_4756217 MorisitaHornDiss -1.352758e-03 3.504545e-01            0
      339   431_4756217   BrayCurtisDiss  2.331896e-02 3.358885e-01            0
      340   431_5102284      JaccardDiss -1.329787e-03 9.566770e-01            0
      341   431_5102284 MorisitaHornDiss -1.496792e-02 7.547071e-01            0
      342   431_5102284   BrayCurtisDiss -1.614309e-02 4.145060e-01            0
      343   431_5102282      JaccardDiss  5.102041e-02 5.876070e-01            0
      344   431_5102282 MorisitaHornDiss  5.102041e-02 5.876070e-01            0
      345   431_5102282   BrayCurtisDiss  5.102041e-02 5.876070e-01            0
      346   431_5113947      JaccardDiss -1.737841e-02 5.118692e-01            0
      347   431_5113947 MorisitaHornDiss  8.179413e-03 8.468905e-01            0
      348   431_5113947   BrayCurtisDiss -7.561398e-03 8.361604e-01            0
      349   431_4770803      JaccardDiss -2.325581e-02 5.823435e-01            0
      350   431_4770803 MorisitaHornDiss -3.305610e-02 5.823435e-01            0
      351   431_4770803   BrayCurtisDiss -3.283174e-02 5.823435e-01            0
      352   431_5101553      JaccardDiss  7.142857e-02 8.789623e-01            0
      353   431_5101553 MorisitaHornDiss  7.142857e-02 8.789623e-01            0
      354   431_5101553   BrayCurtisDiss  7.142857e-02 8.789623e-01            0
      355   431_5101555      JaccardDiss -1.875000e-02 3.481451e-01            0
      356   431_5101555 MorisitaHornDiss -1.442630e-02 5.879408e-01            0
      357   431_5101555   BrayCurtisDiss -6.477273e-03 6.862033e-01            0
      358   431_5124152      JaccardDiss  2.947404e-18 7.723926e-01            0
      359   431_5124152 MorisitaHornDiss  2.947404e-18 7.723926e-01            0
      360   431_5124152   BrayCurtisDiss  2.947404e-18 7.723926e-01            0
      361   431_5100825      JaccardDiss -9.713701e-03 8.351057e-01            0
      362   431_5100825 MorisitaHornDiss  3.001290e-02 1.112136e-01            0
      363   431_5100825   BrayCurtisDiss  1.571547e-02 6.560935e-02            0
      364   431_5121236      JaccardDiss  1.803959e-02 8.939048e-02            0
      365   431_5121236 MorisitaHornDiss  5.871911e-03 8.643189e-01            0
      366   431_5121236   BrayCurtisDiss  8.813197e-03 5.231352e-02            0
      367   431_4749644      JaccardDiss  9.450914e-18 5.574822e-01            0
      368   431_4749644 MorisitaHornDiss  9.450914e-18 5.574822e-01            0
      369   431_4749644   BrayCurtisDiss  9.450914e-18 5.574822e-01            0
      370   431_4750374      JaccardDiss -2.721088e-02 9.125790e-02            0
      371   431_4750374 MorisitaHornDiss -5.014577e-02 9.125790e-02            0
      372   431_4750374   BrayCurtisDiss -3.710575e-03 9.125790e-02            0
      373   431_4781744      JaccardDiss  1.428571e-01 5.456289e-01            0
      374   431_4781744 MorisitaHornDiss  1.428571e-01 5.456289e-01            0
      375   431_4781744   BrayCurtisDiss  1.428571e-01 5.456289e-01            0
      376   431_4749627      JaccardDiss -2.182540e-03 8.602841e-01            0
      377   431_4749627 MorisitaHornDiss  5.127149e-03 8.509292e-01            0
      378   431_4749627   BrayCurtisDiss  2.083913e-03 8.335387e-01            0
      379   431_5123423      JaccardDiss  2.140673e-02 3.409724e-02            1
      380   431_5123423 MorisitaHornDiss  1.073828e-02 4.705254e-01            0
      381   431_5123423   BrayCurtisDiss  1.210716e-02 2.662029e-02            1
      382   431_4740155      JaccardDiss -4.884005e-03 9.011668e-01            0
      383   431_4740155 MorisitaHornDiss -1.703587e-02 6.767227e-01            0
      384   431_4740155   BrayCurtisDiss -1.261701e-02 7.514905e-01            0
      385   431_5120508      JaccardDiss -1.590909e-02 2.936115e-01            0
      386   431_5120508 MorisitaHornDiss -4.171421e-02 9.546698e-02            0
      387   431_5120508   BrayCurtisDiss -2.698026e-02 9.555594e-02            0
      388   431_5116133      JaccardDiss -1.724138e-02 6.783662e-01            0
      389   431_5116133 MorisitaHornDiss -4.597701e-02 6.286093e-01            0
      390   431_5116133   BrayCurtisDiss -3.287682e-02 5.602455e-01            0
      391   431_4743055      JaccardDiss -1.558074e-02 4.883606e-01            0
      392   431_4743055 MorisitaHornDiss -1.780656e-02 4.883606e-01            0
      393   431_4743055   BrayCurtisDiss  1.973560e-02 7.351280e-02            0
      394   431_4764249      JaccardDiss -1.428571e-01 4.543711e-01            0
      395   431_4764249 MorisitaHornDiss -1.904762e-01 4.543711e-01            0
      396   431_4764249   BrayCurtisDiss -1.142857e-01 4.543711e-01            0
      397   431_4751103      JaccardDiss  2.222222e-02 7.018576e-01            0
      398   431_4751103 MorisitaHornDiss  2.962963e-02 7.018576e-01            0
      399   431_4751103   BrayCurtisDiss  2.777778e-02 6.868879e-01            0
      400   431_4743804      JaccardDiss -9.601975e-18 3.005515e-01            0
      401   431_4743804 MorisitaHornDiss -9.601975e-18 3.005515e-01            0
      402   431_4743804   BrayCurtisDiss -9.601975e-18 3.005515e-01            0
      403   431_5125612      JaccardDiss -1.797862e-02 2.977982e-02            1
      404   431_5125612 MorisitaHornDiss -2.498702e-02 6.913652e-01            0
      405   431_5125612   BrayCurtisDiss -2.096175e-02 6.849153e-01            0
      406   431_4758387      JaccardDiss -4.166667e-02 6.666667e-01            0
      407   431_4758387 MorisitaHornDiss  1.158437e-01 2.512152e-01            0
      408   431_4758387   BrayCurtisDiss -2.500000e-02 6.396002e-01            0
      409   431_4756196      JaccardDiss -8.333333e-02 1.339746e-01            0
      410   431_4756196 MorisitaHornDiss -8.333333e-02 1.339746e-01            0
      411   431_4756196   BrayCurtisDiss -2.192982e-02 1.339746e-01            0
      412   431_5113218      JaccardDiss -4.238095e-02 2.394277e-01            0
      413   431_5113218 MorisitaHornDiss -3.121085e-02 4.921390e-01            0
      414   431_5113218   BrayCurtisDiss -1.814901e-02 6.635277e-01            0
      415   431_4735777      JaccardDiss  1.036916e-02 1.309041e-01            0
      416   431_4735777 MorisitaHornDiss  4.503762e-03 1.514210e-01            0
      417   431_4735777   BrayCurtisDiss  5.863192e-03 3.224118e-03            1
      418   431_5101554      JaccardDiss  2.783333e-02 1.611531e-01            0
      419   431_5101554 MorisitaHornDiss  8.654580e-02 3.338537e-02            1
      420   431_5101554   BrayCurtisDiss  5.563601e-02 7.331920e-02            0
      421   431_4752549      JaccardDiss -1.171643e-02 3.032928e-01            0
      422   431_4752549 MorisitaHornDiss -3.766448e-02 1.479306e-01            0
      423   431_4752549   BrayCurtisDiss -2.240027e-02 1.051308e-01            0
      424   431_4755487      JaccardDiss -1.494446e-17 5.672414e-01            0
      425   431_4755487 MorisitaHornDiss -1.494446e-17 5.672414e-01            0
      426   431_4755487   BrayCurtisDiss -1.494446e-17 5.672414e-01            0
      427   431_4754005      JaccardDiss -9.722222e-02 3.009302e-01            0
      428   431_4754005 MorisitaHornDiss -8.127328e-02 5.516603e-01            0
      429   431_4754005   BrayCurtisDiss  7.703081e-03 3.333333e-01            0
      430   431_4749628      JaccardDiss -1.395982e-02 2.434600e-01            0
      431   431_4749628 MorisitaHornDiss -2.815802e-02 2.434600e-01            0
      432   431_4749628   BrayCurtisDiss -7.614449e-03 2.434600e-01            0
      433   431_4781020      JaccardDiss -3.846154e-02 4.877543e-01            0
      434   431_4781020 MorisitaHornDiss -1.357466e-02 4.877543e-01            0
      435   431_4781020   BrayCurtisDiss  2.838338e-03 9.072507e-01            0
      436   431_4744516      JaccardDiss -1.060838e-02 2.090852e-01            0
      437   431_4744516 MorisitaHornDiss -7.072256e-03 2.090852e-01            0
      438   431_4744516   BrayCurtisDiss -8.664656e-03 3.599797e-01            0
      439   431_4781014      JaccardDiss -2.241379e-02 3.766977e-01            0
      440   431_4781014 MorisitaHornDiss -3.539020e-02 3.766977e-01            0
      441   431_4781014   BrayCurtisDiss -3.362069e-02 3.766977e-01            0
      442   431_4781021      JaccardDiss -1.889339e-02 6.057312e-01            0
      443   431_4781021 MorisitaHornDiss -9.957326e-04 6.057312e-01            0
      444   431_4781021   BrayCurtisDiss -2.195068e-02 6.365026e-01            0
      445   431_4737966      JaccardDiss  8.928571e-02 2.122956e-01            0
      446   431_4737966 MorisitaHornDiss  9.973736e-03 2.122956e-01            0
      447   431_4737966   BrayCurtisDiss  3.401361e-02 2.122956e-01            0
      448   431_4764251      JaccardDiss  4.652386e-17 9.911403e-02            0
      449   431_4764251 MorisitaHornDiss  4.652386e-17 9.911403e-02            0
      450   431_4764251   BrayCurtisDiss  4.652386e-17 9.911403e-02            0
      451   431_4781015      JaccardDiss -2.027027e-02 6.512571e-01            0
      452   431_4781015 MorisitaHornDiss -4.052584e-02 6.512571e-01            0
      453   431_4781015   BrayCurtisDiss  3.134821e-02 5.784500e-01            0
      454   431_5113944      JaccardDiss  7.246377e-03 6.524760e-01            0
      455   431_5113944 MorisitaHornDiss  3.567399e-03 6.524760e-01            0
      456   431_5113944   BrayCurtisDiss  4.244082e-03 6.524760e-01            0
      457   431_5111762      JaccardDiss -5.421687e-02 4.296482e-01            0
      458   431_5111762 MorisitaHornDiss -1.485394e-03 4.296482e-01            0
      459   431_5111762   BrayCurtisDiss -5.971061e-02 4.582788e-01            0
      460   431_5115406      JaccardDiss  8.296085e-15 1.000000e+00            0
      461   431_5115406 MorisitaHornDiss -2.007389e-02 1.774336e-02            1
      462   431_5115406   BrayCurtisDiss -2.711499e-02 7.374903e-01            0
      463   431_4751102      JaccardDiss -5.000000e-01 3.333333e-01            0
      464   431_4751102 MorisitaHornDiss -5.000000e-01 3.333333e-01            0
      465   431_4751102   BrayCurtisDiss -3.333333e-01 3.333333e-01            0
      466   431_4736507      JaccardDiss  1.016260e-02 6.347697e-01            0
      467   431_4736507 MorisitaHornDiss  1.876173e-02 6.347697e-01            0
      468   431_4736507   BrayCurtisDiss  1.742160e-02 4.600703e-01            0
      469   431_4782480      JaccardDiss -1.326531e-01 2.420754e-01            0
      470   431_4782480 MorisitaHornDiss -1.326531e-01 2.420754e-01            0
      471   431_4782480   BrayCurtisDiss -1.105442e-01 2.420754e-01            0
      472   431_4776662      JaccardDiss  2.364865e-02 4.782279e-01            0
      473   431_4776662 MorisitaHornDiss -2.677449e-02 1.646726e-01            0
      474   431_4776662   BrayCurtisDiss -2.630115e-02 3.861268e-02            1
      475   431_4752550      JaccardDiss  1.190476e-02 7.816718e-01            0
      476   431_4752550 MorisitaHornDiss  5.320987e-03 9.049149e-01            0
      477   431_4752550   BrayCurtisDiss  1.112553e-02 6.439973e-01            0
      478   431_5109574      JaccardDiss -1.282051e-02 7.245413e-01            0
      479   431_5109574 MorisitaHornDiss -2.680414e-02 6.000201e-01            0
      480   431_5109574   BrayCurtisDiss -2.574003e-02 5.376391e-01            0
      481   431_4745264      JaccardDiss  5.158571e-18 6.118312e-02            0
      482   431_4745264 MorisitaHornDiss  5.158571e-18 6.118312e-02            0
      483   431_4745264   BrayCurtisDiss  5.158571e-18 6.118312e-02            0
      484   431_4740146      JaccardDiss -4.489796e-02 4.245912e-01            0
      485   431_4740146 MorisitaHornDiss -5.374378e-02 4.245912e-01            0
      486   431_4740146   BrayCurtisDiss -5.044715e-03 4.245912e-01            0
      487   431_4754011      JaccardDiss -5.538382e-03 4.968803e-01            0
      488   431_4754011 MorisitaHornDiss  6.433291e-03 4.612968e-01            0
      489   431_4754011   BrayCurtisDiss  8.206985e-03 6.369828e-01            0
      490   431_4754757      JaccardDiss -1.173184e-01 9.378311e-02            0
      491   431_4754757 MorisitaHornDiss -1.173184e-01 9.378311e-02            0
      492   431_4754757   BrayCurtisDiss -5.865922e-02 9.378311e-02            0
      493   431_4750359      JaccardDiss  4.132231e-03 7.250037e-01            0
      494   431_4750359 MorisitaHornDiss -2.953826e-02 3.147789e-01            0
      495   431_4750359   BrayCurtisDiss -1.708037e-02 2.257201e-01            0
      496   431_4745247      JaccardDiss -2.592781e-02 2.818823e-01            0
      497   431_4745247 MorisitaHornDiss -2.591474e-02 2.818823e-01            0
      498   431_4745247   BrayCurtisDiss -1.238590e-02 2.818823e-01            0
      499   431_5094987      JaccardDiss -2.000000e-01 2.254033e-01            0
      500   431_5094987 MorisitaHornDiss -1.761642e-02 2.254033e-01            0
      501   431_5094987   BrayCurtisDiss -4.660087e-02 4.773386e-01            0
      502   431_4752551      JaccardDiss -4.830918e-03 8.997586e-01            0
      503   431_4752551 MorisitaHornDiss  4.386794e-02 1.647697e-01            0
      504   431_4752551   BrayCurtisDiss  2.748140e-02 2.514208e-01            0
      505   431_4753280      JaccardDiss -1.885831e-02 3.722702e-01            0
      506   431_4753280 MorisitaHornDiss  3.669536e-03 5.105338e-01            0
      507   431_4753280   BrayCurtisDiss  6.264964e-03 6.996848e-01            0
      508   431_4751821      JaccardDiss  1.564380e-02 5.927123e-01            0
      509   431_4751821 MorisitaHornDiss  2.371961e-02 1.665767e-01            0
      510   431_4751821   BrayCurtisDiss  8.332834e-03 7.568618e-01            0
      511   431_4748173      JaccardDiss -1.065574e-01 3.741166e-01            0
      512   431_4748173 MorisitaHornDiss -1.065574e-01 3.741166e-01            0
      513   431_4748173   BrayCurtisDiss -1.065574e-01 3.741166e-01            0
      514   431_4743785      JaccardDiss -6.329114e-04 9.187304e-01            0
      515   431_4743785 MorisitaHornDiss -8.179163e-03 3.366993e-01            0
      516   431_4743785   BrayCurtisDiss -5.063291e-03 2.583942e-01            0
      517   431_4756195      JaccardDiss  1.853155e-02 3.976409e-03            1
      518   431_4756195 MorisitaHornDiss  2.964747e-02 2.705420e-02            1
      519   431_4756195   BrayCurtisDiss  2.262216e-02 4.297965e-03            1
      520   431_4754008      JaccardDiss  1.960704e-14 1.000000e+00            0
      521   431_4754008 MorisitaHornDiss  1.510773e-14 1.000000e+00            0
      522   431_4754008   BrayCurtisDiss -8.035714e-03 9.688201e-01            0
      523   431_4753279      JaccardDiss  2.521930e-02 3.490742e-01            0
      524   431_4753279 MorisitaHornDiss  7.522657e-02 5.642870e-02            0
      525   431_4753279   BrayCurtisDiss  1.856182e-02 3.641250e-01            0
      526   431_4753278      JaccardDiss  7.231405e-03 8.988265e-01            0
      527   431_4753278 MorisitaHornDiss  7.829491e-03 8.897914e-01            0
      528   431_4753278   BrayCurtisDiss -4.743216e-02 7.697883e-02            0
      529   431_4754006      JaccardDiss  3.571429e-01 2.122956e-01            0
      530   431_4754006 MorisitaHornDiss  3.571429e-01 2.122956e-01            0
      531   431_4754006   BrayCurtisDiss  7.142857e-02 2.122956e-01            0
      532    466_544469      JaccardDiss  2.181455e-03 4.705203e-01            0
      533    466_544469 MorisitaHornDiss -2.924266e-02 1.028374e-01            0
      534    466_544469   BrayCurtisDiss -1.718643e-02 2.044255e-01            0
      535    466_541561      JaccardDiss  7.233741e-03 3.788266e-01            0
      536    466_541561 MorisitaHornDiss -7.775125e-04 9.532931e-01            0
      537    466_541561   BrayCurtisDiss -8.761381e-03 3.714550e-01            0
      538    466_544468      JaccardDiss  6.235691e-03 2.787859e-01            0
      539    466_544468 MorisitaHornDiss  7.552588e-03 3.855485e-01            0
      540    466_544468   BrayCurtisDiss -8.875309e-03 2.008995e-01            0
      541    466_541560      JaccardDiss -2.274450e-03 5.121927e-01            0
      542    466_541560 MorisitaHornDiss  1.150437e-02 2.412647e-01            0
      543    466_541560   BrayCurtisDiss  1.281082e-02 6.616599e-02            0
      544    466_544470      JaccardDiss  1.107053e-03 7.702177e-01            0
      545    466_544470 MorisitaHornDiss -8.862342e-05 9.927858e-01            0
      546    466_544470   BrayCurtisDiss  1.070502e-04 9.915785e-01            0
      547    466_540104      JaccardDiss  3.627831e-03 4.306521e-01            0
      548    466_540104 MorisitaHornDiss  2.340537e-02 1.997528e-02            1
      549    466_540104   BrayCurtisDiss  1.739572e-02 2.336286e-02            1
      550    466_548115      JaccardDiss  2.903141e-03 2.209786e-01            0
      551    466_548115 MorisitaHornDiss  8.439839e-03 3.161237e-01            0
      552    466_548115   BrayCurtisDiss  1.010792e-02 1.185427e-01            0
      553    466_560514      JaccardDiss  3.262346e-03 5.992842e-01            0
      554    466_560514 MorisitaHornDiss  6.332215e-03 2.322302e-01            0
      555    466_560514   BrayCurtisDiss  7.109016e-03 4.898054e-01            0
      556    466_543001      JaccardDiss -1.666144e-03 6.186920e-01            0
      557    466_543001 MorisitaHornDiss  1.777544e-02 3.062838e-01            0
      558    466_543001   BrayCurtisDiss  9.802613e-03 4.179580e-01            0
      559    466_569257      JaccardDiss  7.319553e-03 1.002969e-01            0
      560    466_569257 MorisitaHornDiss  2.775443e-02 1.211105e-02            1
      561    466_569257   BrayCurtisDiss  1.181676e-02 1.442074e-01            0
      562    466_540834      JaccardDiss -8.745367e-03 2.010208e-01            0
      563    466_540834 MorisitaHornDiss -2.957331e-03 8.193261e-01            0
      564    466_540834   BrayCurtisDiss  3.325654e-03 8.615410e-01            0
      565    466_540833      JaccardDiss -9.086712e-03 3.132445e-01            0
      566    466_540833 MorisitaHornDiss  1.533477e-02 7.404464e-01            0
      567    466_540833   BrayCurtisDiss  2.116950e-02 5.628495e-02            0
      568    466_543011      JaccardDiss  5.541516e-03 2.069439e-01            0
      569    466_543011 MorisitaHornDiss  1.664232e-02 7.027894e-02            0
      570    466_543011   BrayCurtisDiss  1.680908e-02 2.494271e-01            0
      571    466_541549      JaccardDiss  7.164306e-03 2.318008e-01            0
      572    466_541549 MorisitaHornDiss  6.137255e-03 2.266393e-01            0
      573    466_541549   BrayCurtisDiss -2.085316e-03 8.710409e-01            0
      574    466_545198      JaccardDiss -3.880373e-03 2.377590e-01            0
      575    466_545198 MorisitaHornDiss  8.636009e-03 3.200730e-01            0
      576    466_545198   BrayCurtisDiss  7.654941e-03 3.276804e-01            0
      577    466_559051      JaccardDiss -6.432308e-03 1.231861e-01            0
      578    466_559051 MorisitaHornDiss -8.300289e-03 3.119371e-01            0
      579    466_559051   BrayCurtisDiss -6.679391e-03 3.206382e-01            0
      580    466_543738      JaccardDiss -6.787330e-03 8.210876e-01            0
      581    466_543738 MorisitaHornDiss -4.528178e-02 1.122503e-01            0
      582    466_543738   BrayCurtisDiss -3.801937e-02 5.636255e-01            0
      583    466_547388      JaccardDiss -1.954332e-04 9.591423e-01            0
      584    466_547388 MorisitaHornDiss  1.694375e-02 7.896953e-02            0
      585    466_547388   BrayCurtisDiss  1.457989e-02 1.129476e-01            0
      586    466_565614      JaccardDiss  2.684655e-03 3.435761e-01            0
      587    466_565614 MorisitaHornDiss  1.711384e-03 8.944107e-01            0
      588    466_565614   BrayCurtisDiss -9.848860e-03 2.435129e-01            0
      589    466_562698      JaccardDiss -2.525585e-02 5.645567e-01            0
      590    466_562698 MorisitaHornDiss  8.872603e-03 9.449901e-01            0
      591    466_562698   BrayCurtisDiss -2.470670e-02 8.597512e-01            0
      592    466_559779      JaccardDiss -1.562245e-02 3.080402e-02            1
      593    466_559779 MorisitaHornDiss -2.534734e-03 9.335168e-01            0
      594    466_559779   BrayCurtisDiss  1.617009e-02 6.272578e-01            0
      595    466_560509      JaccardDiss  4.689341e-04 8.931867e-01            0
      596    466_560509 MorisitaHornDiss  1.023362e-02 4.691635e-01            0
      597    466_560509   BrayCurtisDiss -5.302021e-03 6.582674e-01            0
      598    466_545919      JaccardDiss  3.248603e-03 6.999049e-01            0
      599    466_545919 MorisitaHornDiss  1.665032e-02 2.136573e-01            0
      600    466_545919   BrayCurtisDiss  2.128706e-02 3.560262e-02            1
      601    466_545912      JaccardDiss -1.286032e-03 6.535691e-01            0
      602    466_545912 MorisitaHornDiss  1.769830e-02 8.959884e-02            0
      603    466_545912   BrayCurtisDiss  1.463310e-02 1.190096e-01            0
      604    466_548798      JaccardDiss  3.136447e-03 4.255803e-01            0
      605    466_548798 MorisitaHornDiss -1.005051e-03 9.033844e-01            0
      606    466_548798   BrayCurtisDiss -4.913829e-04 9.436225e-01            0
      607    466_552442      JaccardDiss  2.781225e-03 2.424591e-01            0
      608    466_552442 MorisitaHornDiss -2.462189e-04 9.404178e-01            0
      609    466_552442   BrayCurtisDiss  4.008438e-03 4.820540e-01            0
      610    466_553900      JaccardDiss -2.151694e-02 2.111730e-02            1
      611    466_553900 MorisitaHornDiss -1.850300e-02 5.823165e-01            0
      612    466_553900   BrayCurtisDiss -3.295757e-02 2.578277e-01            0
      613    466_555359      JaccardDiss  1.085736e-03 8.481826e-01            0
      614    466_555359 MorisitaHornDiss  9.513475e-03 5.693981e-01            0
      615    466_555359   BrayCurtisDiss  5.745551e-04 9.539066e-01            0
      616    466_559004      JaccardDiss  5.158377e-03 2.906998e-01            0
      617    466_559004 MorisitaHornDiss -9.856499e-03 1.985427e-01            0
      618    466_559004   BrayCurtisDiss -1.448712e-03 8.787918e-01            0
      619    466_553901      JaccardDiss -4.839089e-03 1.477336e-01            0
      620    466_553901 MorisitaHornDiss -1.981906e-02 4.038335e-03            1
      621    466_553901   BrayCurtisDiss -3.013013e-04 9.683001e-01            0
      622    466_552446      JaccardDiss  5.772440e-03 2.089083e-01            0
      623    466_552446 MorisitaHornDiss  1.773788e-03 4.157236e-01            0
      624    466_552446   BrayCurtisDiss -2.280796e-03 8.042028e-01            0
      625    466_553171      JaccardDiss  4.369149e-03 4.811378e-01            0
      626    466_553171 MorisitaHornDiss  1.467461e-03 6.649547e-01            0
      627    466_553171   BrayCurtisDiss  4.159435e-03 6.320921e-01            0
      628    466_553175      JaccardDiss  4.991545e-03 3.237821e-01            0
      629    466_553175 MorisitaHornDiss  2.491515e-04 9.616337e-01            0
      630    466_553175   BrayCurtisDiss -1.505193e-02 1.250559e-01            0
      631    466_556090      JaccardDiss  2.817695e-04 9.755086e-01            0
      632    466_556090 MorisitaHornDiss  1.099562e-02 5.975639e-01            0
      633    466_556090   BrayCurtisDiss  1.659003e-02 4.629161e-01            0
      634    466_557547      JaccardDiss  2.501878e-03 3.112565e-01            0
      635    466_557547 MorisitaHornDiss -1.018956e-03 7.633363e-01            0
      636    466_557547   BrayCurtisDiss -1.361824e-03 8.734259e-01            0
      637    466_554630      JaccardDiss  2.045639e-04 9.578134e-01            0
      638    466_554630 MorisitaHornDiss -1.024306e-02 1.242256e-01            0
      639    466_554630   BrayCurtisDiss -6.092638e-03 5.385697e-01            0
      640    466_553902      JaccardDiss  5.127831e-03 5.182047e-01            0
      641    466_553902 MorisitaHornDiss -1.917855e-02 1.202155e-01            0
      642    466_553902   BrayCurtisDiss  6.447727e-04 9.465382e-01            0
      643    466_549529      JaccardDiss -4.589679e-04 9.089372e-01            0
      644    466_549529 MorisitaHornDiss  9.191012e-04 9.624126e-01            0
      645    466_549529   BrayCurtisDiss  2.397324e-02 1.857697e-01            0
      646    466_551714      JaccardDiss -9.879219e-04 8.931545e-01            0
      647    466_551714 MorisitaHornDiss  4.089065e-03 8.334659e-01            0
      648    466_551714   BrayCurtisDiss  5.908842e-03 2.795396e-01            0
      649    466_550254      JaccardDiss  4.366252e-03 4.495225e-01            0
      650    466_550254 MorisitaHornDiss -1.893859e-03 8.997268e-01            0
      651    466_550254   BrayCurtisDiss -7.271335e-03 5.105767e-01            0
      652    466_549527      JaccardDiss  9.131462e-04 8.281664e-01            0
      653    466_549527 MorisitaHornDiss  9.664563e-03 4.457581e-01            0
      654    466_549527   BrayCurtisDiss  4.338800e-03 6.171938e-01            0
      655    466_553903      JaccardDiss  3.543041e-03 5.309292e-01            0
      656    466_553903 MorisitaHornDiss  1.166123e-02 4.058408e-01            0
      657    466_553903   BrayCurtisDiss  1.392752e-02 1.301050e-01            0
      658    466_550258      JaccardDiss  6.938726e-05 9.959606e-01            0
      659    466_550258 MorisitaHornDiss -3.266755e-03 6.079635e-01            0
      660    466_550258   BrayCurtisDiss -5.995561e-03 6.473849e-01            0
      661    466_556089      JaccardDiss  4.191409e-03 1.973014e-01            0
      662    466_556089 MorisitaHornDiss -9.839310e-03 3.291882e-01            0
      663    466_556089   BrayCurtisDiss -8.450760e-03 3.014168e-01            0
      664    466_556091      JaccardDiss  6.989608e-03 1.895114e-01            0
      665    466_556091 MorisitaHornDiss  6.501669e-03 1.501460e-01            0
      666    466_556091   BrayCurtisDiss  1.903990e-02 1.029933e-02            1
      667    466_556092      JaccardDiss  5.505845e-03 1.296566e-01            0
      668    466_556092 MorisitaHornDiss -8.091482e-04 9.201678e-01            0
      669    466_556092   BrayCurtisDiss -1.812052e-02 2.683278e-02            1
      670    466_553904      JaccardDiss  7.242678e-03 6.278196e-02            0
      671    466_553904 MorisitaHornDiss -4.462562e-03 6.448786e-01            0
      672    466_553904   BrayCurtisDiss -4.756019e-03 6.115934e-01            0
      673    466_552445      JaccardDiss  1.987080e-03 5.982934e-01            0
      674    466_552445 MorisitaHornDiss  2.499991e-03 8.376474e-01            0
      675    466_552445   BrayCurtisDiss  6.087035e-03 4.845907e-01            0
      676    466_554632      JaccardDiss  3.530810e-03 4.437498e-01            0
      677    466_554632 MorisitaHornDiss -7.666707e-03 2.514276e-01            0
      678    466_554632   BrayCurtisDiss  2.216044e-03 8.492773e-01            0
      679    466_556818      JaccardDiss  3.196803e-02 5.089144e-01            0
      680    466_556818 MorisitaHornDiss  2.271581e-03 9.059482e-01            0
      681    466_556818   BrayCurtisDiss  4.400392e-02 2.281207e-01            0
      682    466_556088      JaccardDiss  9.444121e-04 8.854939e-01            0
      683    466_556088 MorisitaHornDiss  2.208803e-02 5.964024e-02            0
      684    466_556088   BrayCurtisDiss  9.670032e-03 3.113577e-01            0
      685    466_550255      JaccardDiss  7.608125e-03 1.296157e-01            0
      686    466_550255 MorisitaHornDiss  5.821357e-03 7.550114e-01            0
      687    466_550255   BrayCurtisDiss -1.357561e-03 9.061950e-01            0
      688    466_553905      JaccardDiss  3.318250e-03 3.932346e-01            0
      689    466_553905 MorisitaHornDiss -1.761834e-02 1.702713e-01            0
      690    466_553905   BrayCurtisDiss -7.096022e-03 5.799313e-01            0
      691    466_555362      JaccardDiss  2.052134e-04 9.565173e-01            0
      692    466_555362 MorisitaHornDiss  4.522033e-04 9.358310e-01            0
      693    466_555362   BrayCurtisDiss  1.447145e-02 2.521532e-01            0
      694    466_559733      JaccardDiss -5.299836e-04 9.221469e-01            0
      695    466_559733 MorisitaHornDiss -6.946520e-03 1.338812e-01            0
      696    466_559733   BrayCurtisDiss -1.230094e-03 8.879199e-01            0
      697    466_557548      JaccardDiss -1.008136e-03 8.117725e-01            0
      698    466_557548 MorisitaHornDiss -2.371842e-03 3.562713e-01            0
      699    466_557548   BrayCurtisDiss -2.310968e-02 4.482510e-03            1
      700    466_550256      JaccardDiss  2.569224e-03 6.000259e-01            0
      701    466_550256 MorisitaHornDiss -2.240079e-03 6.129899e-01            0
      702    466_550256   BrayCurtisDiss  1.223475e-02 1.659860e-01            0
      703    466_554634      JaccardDiss -6.758422e-03 2.808760e-01            0
      704    466_554634 MorisitaHornDiss -2.091910e-03 4.027415e-01            0
      705    466_554634   BrayCurtisDiss -1.364530e-03 9.367080e-01            0
      706    466_554631      JaccardDiss -1.378457e-02 1.348197e-01            0
      707    466_554631 MorisitaHornDiss -5.764409e-03 5.511187e-01            0
      708    466_554631   BrayCurtisDiss  3.064574e-03 7.416407e-01            0
      709    466_553176      JaccardDiss  7.110727e-03 1.529530e-01            0
      710    466_553176 MorisitaHornDiss  5.338690e-03 1.594204e-01            0
      711    466_553176   BrayCurtisDiss  1.206797e-02 1.547874e-01            0
      712    466_556819      JaccardDiss  9.161660e-04 8.355915e-01            0
      713    466_556819 MorisitaHornDiss  1.214852e-03 9.126836e-01            0
      714    466_556819   BrayCurtisDiss -4.376833e-03 5.612830e-01            0
      715    466_550984      JaccardDiss  9.955261e-03 1.303314e-01            0
      716    466_550984 MorisitaHornDiss -4.847053e-03 7.149497e-01            0
      717    466_550984   BrayCurtisDiss  9.555720e-03 1.875082e-01            0
      718    466_561188      JaccardDiss  8.343963e-03 2.888320e-01            0
      719    466_561188 MorisitaHornDiss  4.260279e-03 6.092055e-01            0
      720    466_561188   BrayCurtisDiss  5.498779e-03 8.712603e-01            0
      721    466_558274      JaccardDiss  6.431943e-03 2.632918e-01            0
      722    466_558274 MorisitaHornDiss  2.085448e-02 2.852851e-01            0
      723    466_558274   BrayCurtisDiss  1.452774e-02 2.792567e-01            0
      724    466_555361      JaccardDiss  1.278317e-02 1.376697e-01            0
      725    466_555361 MorisitaHornDiss  3.006158e-03 6.339815e-01            0
      726    466_555361   BrayCurtisDiss  1.521419e-02 3.882312e-01            0
      727    466_553172      JaccardDiss -6.669585e-04 9.029285e-01            0
      728    466_553172 MorisitaHornDiss -1.858945e-03 6.200118e-01            0
      729    466_553172   BrayCurtisDiss  2.234746e-03 7.391180e-01            0
      730    466_556087      JaccardDiss  3.590039e-03 6.607557e-01            0
      731    466_556087 MorisitaHornDiss  1.384183e-02 5.155577e-01            0
      732    466_556087   BrayCurtisDiss  5.680998e-03 7.580512e-01            0
      733    466_548799      JaccardDiss  9.157509e-03 2.485210e-01            0
      734    466_548799 MorisitaHornDiss  5.178200e-02 9.150969e-04            1
      735    466_548799   BrayCurtisDiss  1.192940e-02 2.524631e-01            0
      736    466_550257      JaccardDiss -3.552975e-03 5.202311e-01            0
      737    466_550257 MorisitaHornDiss  9.252867e-03 4.812106e-01            0
      738    466_550257   BrayCurtisDiss  1.202080e-02 2.596719e-01            0
      739    466_559005      JaccardDiss  6.860373e-03 3.928072e-01            0
      740    466_559005 MorisitaHornDiss  2.235289e-04 9.923116e-01            0
      741    466_559005   BrayCurtisDiss -9.176009e-04 9.375278e-01            0
      742    466_559734      JaccardDiss -2.585281e-03 5.674846e-01            0
      743    466_559734 MorisitaHornDiss -1.345982e-03 9.147262e-01            0
      744    466_559734   BrayCurtisDiss -1.590025e-02 6.185370e-02            0
      745    466_551717      JaccardDiss  5.415690e-03 3.764074e-01            0
      746    466_551717 MorisitaHornDiss  9.375239e-04 9.342006e-01            0
      747    466_551717   BrayCurtisDiss  9.760425e-03 3.337548e-01            0
      748    466_553174      JaccardDiss -2.125604e-03 6.820023e-01            0
      749    466_553174 MorisitaHornDiss  1.622550e-02 1.696867e-01            0
      750    466_553174   BrayCurtisDiss  8.339037e-03 4.280398e-01            0
      751    466_559003      JaccardDiss  6.174105e-03 3.943069e-01            0
      752    466_559003 MorisitaHornDiss  4.633222e-04 9.702944e-01            0
      753    466_559003   BrayCurtisDiss -1.644795e-03 8.790710e-01            0
      754    466_550988      JaccardDiss  1.141237e-02 2.230683e-01            0
      755    466_550988 MorisitaHornDiss -1.009962e-02 7.881174e-01            0
      756    466_550988   BrayCurtisDiss -7.547046e-03 7.443956e-01            0
      757    466_556086      JaccardDiss  8.213436e-03 2.568925e-01            0
      758    466_556086 MorisitaHornDiss  1.522918e-02 3.208653e-01            0
      759    466_556086   BrayCurtisDiss  1.656038e-02 5.033584e-01            0
      760    466_560463      JaccardDiss -2.204136e-03 8.478002e-01            0
      761    466_560463 MorisitaHornDiss -2.312653e-02 1.963939e-01            0
      762    466_560463   BrayCurtisDiss -5.924146e-03 7.470369e-01            0
      763    466_549526      JaccardDiss -2.327339e-03 6.367582e-01            0
      764    466_549526 MorisitaHornDiss  1.247347e-03 9.419993e-01            0
      765    466_549526   BrayCurtisDiss -3.163443e-03 7.749842e-01            0
      766    466_550259      JaccardDiss -9.034893e-06 9.987791e-01            0
      767    466_550259 MorisitaHornDiss -2.546814e-02 2.236600e-01            0
      768    466_550259   BrayCurtisDiss -2.449557e-02 2.185082e-01            0
      769    466_542290      JaccardDiss -1.438899e-02 7.183679e-02            0
      770    466_542290 MorisitaHornDiss  7.273145e-03 6.107417e-01            0
      771    466_542290   BrayCurtisDiss  1.072674e-02 5.733037e-01            0
      772    466_565606      JaccardDiss  9.544748e-03 3.627949e-02            1
      773    466_565606 MorisitaHornDiss  1.453450e-02 4.494877e-01            0
      774    466_565606   BrayCurtisDiss  3.690830e-03 7.887813e-01            0
      775    466_553933      JaccardDiss -1.106933e-02 2.545248e-01            0
      776    466_553933 MorisitaHornDiss  2.114771e-02 3.060936e-01            0
      777    466_553933   BrayCurtisDiss  1.598875e-02 3.887301e-01            0
      778    466_562687      JaccardDiss  4.282522e-04 9.372547e-01            0
      779    466_562687 MorisitaHornDiss -1.143562e-02 4.772653e-01            0
      780    466_562687   BrayCurtisDiss -5.305448e-03 5.508102e-01            0
      781    466_556851      JaccardDiss -7.014685e-02 7.590495e-02            0
      782    466_556851 MorisitaHornDiss  5.164715e-02 7.284511e-01            0
      783    466_556851   BrayCurtisDiss  2.040163e-02 8.372337e-01            0
      784    466_571439      JaccardDiss  2.539249e-02 2.619489e-02            1
      785    466_571439 MorisitaHornDiss  1.824882e-02 4.785887e-01            0
      786    466_571439   BrayCurtisDiss  2.583441e-03 8.542028e-01            0
      787    466_565610      JaccardDiss -4.987458e-03 2.731958e-01            0
      788    466_565610 MorisitaHornDiss -2.921194e-02 6.640853e-02            0
      789    466_565610   BrayCurtisDiss -1.147446e-02 3.598380e-01            0
      790    466_565611      JaccardDiss  2.324958e-02 9.957962e-03            1
      791    466_565611 MorisitaHornDiss  4.020784e-02 3.709304e-01            0
      792    466_565611   BrayCurtisDiss -3.397746e-03 8.458784e-01            0
      793    466_541545      JaccardDiss -1.257115e-02 3.000164e-01            0
      794    466_541545 MorisitaHornDiss  4.978552e-02 1.418300e-01            0
      795    466_541545   BrayCurtisDiss  2.486101e-03 8.865356e-01            0
      796    466_546649      JaccardDiss -8.764503e-03 7.672251e-01            0
      797    466_546649 MorisitaHornDiss  4.149174e-02 8.129701e-01            0
      798    466_546649   BrayCurtisDiss  2.010270e-02 8.669855e-01            0
      799    466_566335      JaccardDiss  4.853078e-03 3.866018e-01            0
      800    466_566335 MorisitaHornDiss  5.332898e-03 8.329918e-01            0
      801    466_566335   BrayCurtisDiss  1.949147e-03 9.047307e-01            0
      802    466_543008      JaccardDiss -3.562373e-02 2.125943e-01            0
      803    466_543008 MorisitaHornDiss -1.128847e-02 8.943202e-01            0
      804    466_543008   BrayCurtisDiss  3.080334e-02 3.661904e-01            0
      805    466_542272      JaccardDiss  1.402729e-04 9.638818e-01            0
      806    466_542272 MorisitaHornDiss -2.844084e-02 2.667556e-01            0
      807    466_542272   BrayCurtisDiss -2.073940e-02 2.249905e-01            0
      808    466_564884      JaccardDiss  1.356043e-02 2.979658e-01            0
      809    466_564884 MorisitaHornDiss -1.580292e-02 8.040613e-01            0
      810    466_564884   BrayCurtisDiss -2.001872e-03 9.560715e-01            0
      811    466_558310      JaccardDiss  1.113154e-03 6.761293e-01            0
      812    466_558310 MorisitaHornDiss  4.054840e-03 7.272496e-01            0
      813    466_558310   BrayCurtisDiss -1.407132e-03 4.198909e-01            0
      814    466_541548      JaccardDiss  2.283507e-03 6.552727e-01            0
      815    466_541548 MorisitaHornDiss  1.147045e-02 4.301423e-01            0
      816    466_541548   BrayCurtisDiss  1.061172e-02 2.218690e-01            0
      817    466_568522      JaccardDiss  2.667092e-03 5.552345e-01            0
      818    466_568522 MorisitaHornDiss -2.263615e-03 8.045176e-01            0
      819    466_568522   BrayCurtisDiss -2.093801e-04 9.667777e-01            0
      820    466_561970      JaccardDiss  6.798114e-03 6.972189e-01            0
      821    466_561970 MorisitaHornDiss -2.967797e-02 6.328417e-01            0
      822    466_561970   BrayCurtisDiss -2.713978e-02 5.700118e-01            0
      823    466_568523      JaccardDiss -3.818182e-03 6.226307e-01            0
      824    466_568523 MorisitaHornDiss -3.585546e-02 3.335644e-01            0
      825    466_568523   BrayCurtisDiss -1.465479e-02 2.510755e-01            0
      826    466_553937      JaccardDiss  4.494298e-03 9.306781e-02            0
      827    466_553937 MorisitaHornDiss -8.255932e-03 1.764157e-01            0
      828    466_553937   BrayCurtisDiss  7.325045e-04 9.055635e-01            0
      829    466_564158      JaccardDiss -5.856616e-03 6.015005e-01            0
      830    466_564158 MorisitaHornDiss -8.132994e-03 8.611194e-01            0
      831    466_564158   BrayCurtisDiss  2.474783e-02 2.875319e-01            0
      832    466_564876      JaccardDiss -8.373206e-03 8.424904e-01            0
      833    466_564876 MorisitaHornDiss -3.023311e-02 7.296023e-01            0
      834    466_564876   BrayCurtisDiss -2.580806e-02 7.168354e-01            0
      835    466_545927      JaccardDiss -2.880595e-03 3.336018e-01            0
      836    466_545927 MorisitaHornDiss  1.771674e-02 2.050125e-01            0
      837    466_545927   BrayCurtisDiss  8.599557e-03 4.514019e-01            0
      838    466_551018      JaccardDiss  2.539930e-03 6.393671e-01            0
      839    466_551018 MorisitaHornDiss -7.720058e-04 9.277046e-01            0
      840    466_551018   BrayCurtisDiss -2.682994e-03 7.138200e-01            0
      841    466_569984      JaccardDiss  4.086957e-02 5.824243e-01            0
      842    466_569984 MorisitaHornDiss -2.588588e-02 9.595396e-01            0
      843    466_569984   BrayCurtisDiss -1.511925e-02 9.703158e-01            0
      844    466_556135      JaccardDiss -1.656315e-02 4.830491e-01            0
      845    466_556135 MorisitaHornDiss  3.667825e-02 5.686437e-01            0
      846    466_556135   BrayCurtisDiss  3.496328e-02 5.556066e-01            0
      847    466_558313      JaccardDiss  9.815704e-04 8.512678e-01            0
      848    466_558313 MorisitaHornDiss  1.127579e-03 7.641764e-01            0
      849    466_558313   BrayCurtisDiss  2.239759e-03 6.333524e-01            0
      850    466_557581      JaccardDiss  1.479661e-03 9.015562e-01            0
      851    466_557581 MorisitaHornDiss  2.874984e-02 1.830693e-02            1
      852    466_557581   BrayCurtisDiss  1.993242e-02 1.029958e-01            0
      853    466_547368      JaccardDiss  2.111757e-03 7.213481e-01            0
      854    466_547368 MorisitaHornDiss  3.868340e-02 1.542030e-01            0
      855    466_547368   BrayCurtisDiss  2.481293e-02 1.952753e-01            0
      856    466_548098      JaccardDiss -1.350997e-03 7.629589e-01            0
      857    466_548098 MorisitaHornDiss -4.398099e-03 8.327726e-01            0
      858    466_548098   BrayCurtisDiss  2.626921e-03 8.525547e-01            0
      859    466_544455      JaccardDiss -3.625215e-03 4.413750e-01            0
      860    466_544455 MorisitaHornDiss  2.225333e-02 3.426695e-02            1
      861    466_544455   BrayCurtisDiss -5.065063e-03 6.693325e-01            0
      862    466_554676      JaccardDiss  3.590344e-03 3.095039e-01            0
      863    466_554676 MorisitaHornDiss  4.861742e-03 4.828121e-01            0
      864    466_554676   BrayCurtisDiss -3.071948e-03 5.804448e-01            0
      865    466_565605      JaccardDiss -4.516758e-05 9.931947e-01            0
      866    466_565605 MorisitaHornDiss  5.971692e-03 7.761566e-01            0
      867    466_565605   BrayCurtisDiss  6.204392e-03 6.804624e-01            0
      868    466_561962      JaccardDiss -8.137000e-04 7.746145e-01            0
      869    466_561962 MorisitaHornDiss -1.993046e-02 1.411298e-02            1
      870    466_561962   BrayCurtisDiss -1.314992e-02 4.306310e-02            1
      871    466_548097      JaccardDiss  4.150168e-05 9.848674e-01            0
      872    466_548097 MorisitaHornDiss  1.487541e-02 2.232343e-01            0
      873    466_548097   BrayCurtisDiss  3.528379e-03 6.617022e-01            0
      874    466_564146      JaccardDiss  4.327937e-04 9.908319e-01            0
      875    466_564146 MorisitaHornDiss -5.425329e-02 3.059628e-01            0
      876    466_564146   BrayCurtisDiss -7.417269e-03 2.820607e-01            0
      877    466_544471      JaccardDiss  3.163689e-03 6.292679e-01            0
      878    466_544471 MorisitaHornDiss  2.137532e-02 2.097095e-01            0
      879    466_544471   BrayCurtisDiss  3.177439e-02 7.163420e-02            0
      880    466_557584      JaccardDiss  9.330232e-03 1.587793e-01            0
      881    466_557584 MorisitaHornDiss -1.436087e-02 4.020065e-01            0
      882    466_557584   BrayCurtisDiss -1.597297e-02 4.789426e-01            0
      883    466_543726      JaccardDiss  7.189794e-03 2.320166e-01            0
      884    466_543726 MorisitaHornDiss  7.005575e-03 3.727955e-01            0
      885    466_543726   BrayCurtisDiss  3.602279e-03 5.189215e-01            0
      886    466_553207      JaccardDiss  3.001146e-03 2.610320e-01            0
      887    466_553207 MorisitaHornDiss  1.713427e-02 5.756453e-01            0
      888    466_553207   BrayCurtisDiss  1.590489e-02 3.474079e-01            0
      889    466_551748      JaccardDiss  1.602412e-02 3.156523e-05            1
      890    466_551748 MorisitaHornDiss  1.318070e-02 4.499931e-01            0
      891    466_551748   BrayCurtisDiss  1.198336e-02 4.092870e-01            0
      892    466_551015      JaccardDiss  1.057744e-03 6.762909e-01            0
      893    466_551015 MorisitaHornDiss -1.183905e-02 5.935471e-01            0
      894    466_551015   BrayCurtisDiss -6.618058e-03 6.364019e-01            0
      895    466_559044      JaccardDiss  1.318869e-02 4.998320e-02            1
      896    466_559044 MorisitaHornDiss -8.673699e-03 6.639254e-01            0
      897    466_559044   BrayCurtisDiss  7.895299e-04 9.313066e-01            0
      898    466_557595      JaccardDiss -1.276812e-02 7.072029e-01            0
      899    466_557595 MorisitaHornDiss  1.477756e-01 2.007064e-01            0
      900    466_557595   BrayCurtisDiss  1.538916e-01 1.302335e-01            0
      901    466_559773      JaccardDiss  6.802721e-04 9.862262e-01            0
      902    466_559773 MorisitaHornDiss -2.712453e-03 9.807617e-01            0
      903    466_559773   BrayCurtisDiss  4.278733e-02 3.076173e-01            0
      904    466_554666      JaccardDiss -1.992771e-03 8.308196e-01            0
      905    466_554666 MorisitaHornDiss  1.817421e-02 4.237068e-01            0
      906    466_554666   BrayCurtisDiss  1.901468e-02 4.958065e-01            0
      907    466_547369      JaccardDiss  2.171760e-03 7.500817e-01            0
      908    466_547369 MorisitaHornDiss -1.293819e-02 6.333367e-01            0
      909    466_547369   BrayCurtisDiss -1.296756e-02 4.622423e-02            1
      910    466_550285      JaccardDiss  4.599322e-04 9.034943e-01            0
      911    466_550285 MorisitaHornDiss  3.854389e-02 8.230108e-02            0
      912    466_550285   BrayCurtisDiss  3.392953e-02 9.511903e-02            0
      913    466_561232      JaccardDiss  2.931352e-04 9.683067e-01            0
      914    466_561232 MorisitaHornDiss -9.150244e-03 4.544918e-01            0
      915    466_561232   BrayCurtisDiss -1.088462e-02 2.172922e-01            0
      916    466_557594      JaccardDiss -7.987851e-04 9.391140e-01            0
      917    466_557594 MorisitaHornDiss -3.474591e-02 7.643134e-02            0
      918    466_557594   BrayCurtisDiss -1.374629e-03 8.815249e-01            0
      919    466_559050      JaccardDiss  5.968463e-03 4.803697e-01            0
      920    466_559050 MorisitaHornDiss  3.452341e-03 8.306270e-01            0
      921    466_559050   BrayCurtisDiss  1.878804e-02 1.236810e-01            0
      922    466_546657      JaccardDiss  2.698413e-02 6.964465e-01            0
      923    466_546657 MorisitaHornDiss -7.740778e-02 5.077829e-01            0
      924    466_546657   BrayCurtisDiss -8.936618e-02 3.279150e-01            0
      925    466_565615      JaccardDiss  2.354488e-02 5.625644e-01            0
      926    466_565615 MorisitaHornDiss -5.955162e-02 5.889037e-01            0
      927    466_565615   BrayCurtisDiss -9.782322e-03 8.478624e-01            0
      928    466_555405      JaccardDiss -7.547382e-03 1.668608e-01            0
      929    466_555405 MorisitaHornDiss -1.185868e-02 6.343771e-01            0
      930    466_555405   BrayCurtisDiss  7.141719e-03 6.747411e-01            0
      931    466_559043      JaccardDiss  8.516484e-03 4.030802e-01            0
      932    466_559043 MorisitaHornDiss  5.661964e-03 8.160798e-01            0
      933    466_559043   BrayCurtisDiss -7.617230e-03 5.959008e-01            0
      934    466_543012      JaccardDiss  3.854910e-04 9.874169e-01            0
      935    466_543012 MorisitaHornDiss  9.138167e-03 6.774666e-01            0
      936    466_543012   BrayCurtisDiss -9.225698e-03 7.596357e-01            0
      937    466_549575      JaccardDiss  8.855332e-03 5.763578e-02            0
      938    466_549575 MorisitaHornDiss  1.353301e-03 8.795720e-01            0
      939    466_549575   BrayCurtisDiss  3.917244e-03 5.740289e-01            0
      940    466_547385      JaccardDiss -4.677615e-04 9.441309e-01            0
      941    466_547385 MorisitaHornDiss  1.436329e-02 6.470372e-01            0
      942    466_547385   BrayCurtisDiss  1.542822e-02 4.466456e-01            0
      943    466_551017      JaccardDiss -2.019163e-03 9.438586e-01            0
      944    466_551017 MorisitaHornDiss -2.733600e-02 6.902560e-01            0
      945    466_551017   BrayCurtisDiss -4.188695e-02 1.680745e-01            0
      946    466_543725      JaccardDiss -8.428047e-17 1.000000e+00            0
      947    466_543725 MorisitaHornDiss  8.470660e-02 5.156098e-01            0
      948    466_543725   BrayCurtisDiss  3.013440e-02 6.608294e-01            0
      949    466_558321      JaccardDiss  1.502166e-03 6.133103e-01            0
      950    466_558321 MorisitaHornDiss  1.509121e-02 2.144563e-01            0
      951    466_558321   BrayCurtisDiss -5.537518e-03 3.911635e-01            0
      952    466_559780      JaccardDiss -3.024845e-02 2.643564e-01            0
      953    466_559780 MorisitaHornDiss  1.058186e-01 5.173134e-02            0
      954    466_559780   BrayCurtisDiss  5.665359e-02 3.177334e-01            0
      955    466_541551      JaccardDiss -7.894737e-03 1.615715e-01            0
      956    466_541551 MorisitaHornDiss  8.900149e-03 1.411362e-01            0
      957    466_541551   BrayCurtisDiss -7.372180e-02 3.480908e-01            0
      958    466_548114      JaccardDiss  4.895659e-03 6.259579e-01            0
      959    466_548114 MorisitaHornDiss  7.366200e-03 6.036761e-01            0
      960    466_548114   BrayCurtisDiss -1.152791e-02 1.880276e-01            0
      961    466_546656      JaccardDiss  1.284585e-02 5.732356e-01            0
      962    466_546656 MorisitaHornDiss -2.546182e-01 4.507602e-01            0
      963    466_546656   BrayCurtisDiss  2.907936e-02 6.438547e-01            0
      964    466_554678      JaccardDiss  2.222219e-02 2.625957e-01            0
      965    466_554678 MorisitaHornDiss -3.833964e-03 9.356526e-01            0
      966    466_554678   BrayCurtisDiss  8.714727e-03 7.289760e-01            0
      967    466_555360      JaccardDiss -2.818646e-03 7.127145e-01            0
      968    466_555360 MorisitaHornDiss  7.969224e-03 3.562713e-01            0
      969    466_555360   BrayCurtisDiss  5.812112e-03 5.989568e-01            0
      970    466_554629      JaccardDiss  1.041667e-02 8.695385e-01            0
      971    466_554629 MorisitaHornDiss -4.522714e-02 2.071968e-01            0
      972    466_554629   BrayCurtisDiss -1.649966e-02 6.565059e-01            0
      973    466_551718      JaccardDiss -3.947202e-03 7.563146e-01            0
      974    466_551718 MorisitaHornDiss  5.159309e-04 6.277619e-01            0
      975    466_551718   BrayCurtisDiss -3.315786e-02 3.703338e-01            0
      976    466_551716      JaccardDiss -1.129450e-02 8.455953e-02            0
      977    466_551716 MorisitaHornDiss  1.758418e-03 1.240672e-01            0
      978    466_551716   BrayCurtisDiss  2.010090e-02 6.334920e-02            0
      979    466_558275      JaccardDiss -1.254846e-03 9.271993e-01            0
      980    466_558275 MorisitaHornDiss -1.243395e-04 7.864738e-01            0
      981    466_558275   BrayCurtisDiss -1.308509e-04 9.889366e-01            0
      982    466_552443      JaccardDiss  1.104283e-02 2.225076e-01            0
      983    466_552443 MorisitaHornDiss -9.007643e-03 5.897916e-01            0
      984    466_552443   BrayCurtisDiss  8.338384e-03 5.859919e-01            0
      985    466_557546      JaccardDiss  1.057999e-03 8.250307e-01            0
      986    466_557546 MorisitaHornDiss -5.567672e-03 7.407776e-01            0
      987    466_557546   BrayCurtisDiss -7.174921e-03 4.751933e-01            0
      988    466_553173      JaccardDiss  3.732822e-03 4.714964e-01            0
      989    466_553173 MorisitaHornDiss  2.301636e-02 1.243303e-01            0
      990    466_553173   BrayCurtisDiss  1.158134e-02 2.775486e-01            0
      991    466_564882      JaccardDiss  2.419896e-02 9.681676e-03            1
      992    466_564882 MorisitaHornDiss  5.045750e-03 8.483759e-01            0
      993    466_564882   BrayCurtisDiss  2.107561e-02 2.243032e-01            0
      994    466_556816      JaccardDiss  1.324078e-03 8.198886e-01            0
      995    466_556816 MorisitaHornDiss  2.283108e-02 2.219512e-01            0
      996    466_556816   BrayCurtisDiss  1.701608e-04 9.895470e-01            0
      997    466_557544      JaccardDiss  5.063966e-03 6.234915e-01            0
      998    466_557544 MorisitaHornDiss -1.924580e-02 6.946504e-01            0
      999    466_557544   BrayCurtisDiss  3.156164e-03 9.253679e-01            0
      1000   466_550987      JaccardDiss -1.418911e-03 9.244364e-01            0
      1001   466_550987 MorisitaHornDiss -3.289577e-03 8.278546e-01            0
      1002   466_550987   BrayCurtisDiss -1.608775e-03 9.466808e-01            0
      1003   466_558277      JaccardDiss -1.552366e-02 3.698052e-01            0
      1004   466_558277 MorisitaHornDiss -4.393220e-03 9.143572e-01            0
      1005   466_558277   BrayCurtisDiss  2.696486e-02 3.875211e-01            0
      1006   466_559732      JaccardDiss  1.111111e-01 3.333333e-01            0
      1007   466_559732 MorisitaHornDiss  1.795053e-01 3.402753e-01            0
      1008   466_559732   BrayCurtisDiss  8.115448e-02 6.725096e-01            0
      1009   466_562648      JaccardDiss  2.000000e-02 6.847438e-01            0
      1010   466_562648 MorisitaHornDiss  2.470599e-04 1.615843e-01            0
      1011   466_562648   BrayCurtisDiss -7.089079e-02 3.841353e-01            0
      1012   211_529239      JaccardDiss  2.395472e-02 3.908050e-01            0
      1013   211_529239 MorisitaHornDiss -5.062258e-03 7.935778e-01            0
      1014   211_529239   BrayCurtisDiss -8.818391e-03 5.014094e-01            0
      1015   211_525598      JaccardDiss -9.668737e-03 3.883657e-01            0
      1016   211_525598 MorisitaHornDiss -7.484706e-03 8.841017e-01            0
      1017   211_525598   BrayCurtisDiss -2.493655e-02 4.893079e-01            0
      1018   211_521960      JaccardDiss -1.519216e-02 3.442205e-01            0
      1019   211_521960 MorisitaHornDiss  3.372950e-04 9.854520e-01            0
      1020   211_521960   BrayCurtisDiss -1.811679e-02 2.620841e-01            0
      1021   211_523410      JaccardDiss  5.346533e-03 7.728276e-01            0
      1022   211_523410 MorisitaHornDiss  3.514863e-02 5.022309e-01            0
      1023   211_523410   BrayCurtisDiss  2.445693e-02 4.159965e-01            0
      1024   211_517585      JaccardDiss  3.158730e-02 6.068576e-01            0
      1025   211_517585 MorisitaHornDiss -4.435845e-02 7.631899e-01            0
      1026   211_517585   BrayCurtisDiss -2.014635e-02 8.403326e-01            0
      1027   211_516855      JaccardDiss -4.124650e-02 1.857185e-02            1
      1028   211_516855 MorisitaHornDiss -3.759856e-02 6.177226e-01            0
      1029   211_516855   BrayCurtisDiss -1.665243e-02 8.845325e-01            0
      1030  437_2075128      JaccardDiss  1.257674e-02 6.283191e-02            0
      1031  437_2075128 MorisitaHornDiss  2.342688e-02 4.247436e-01            0
      1032  437_2075128   BrayCurtisDiss  4.324530e-02 4.582327e-01            0
      1033  437_2077319      JaccardDiss -4.468544e-02 1.744970e-02            1
      1034  437_2077319 MorisitaHornDiss -6.583876e-03 4.741564e-01            0
      1035  437_2077319   BrayCurtisDiss -1.770812e-02 2.907778e-01            0
      1036  437_2076590      JaccardDiss -4.133045e-02 5.094798e-02            0
      1037  437_2076590 MorisitaHornDiss -3.947589e-02 5.181499e-01            0
      1038  437_2076590   BrayCurtisDiss -4.586584e-02 6.286736e-02            0
      1039  437_2078777      JaccardDiss  7.336755e-03 6.644001e-01            0
      1040  437_2078777 MorisitaHornDiss  5.098449e-03 9.202745e-01            0
      1041  437_2078777   BrayCurtisDiss  2.583975e-03 7.188927e-01            0
      1042  437_2076589      JaccardDiss  1.506136e-02 1.793857e-01            0
      1043  437_2076589 MorisitaHornDiss  3.914285e-02 3.214003e-01            0
      1044  437_2076589   BrayCurtisDiss  2.712042e-02 1.016688e-01            0
      1045  437_2075860      JaccardDiss -3.679716e-02 2.337099e-01            0
      1046  437_2075860 MorisitaHornDiss -6.724137e-02 1.160435e-01            0
      1047  437_2075860   BrayCurtisDiss -5.480613e-02 2.151844e-01            0
      1048  437_2074400      JaccardDiss  1.391352e-02 5.952543e-01            0
      1049  437_2074400 MorisitaHornDiss  1.591072e-02 6.069530e-01            0
      1050  437_2074400   BrayCurtisDiss  1.689664e-02 5.029739e-01            0
      1051  437_2074399      JaccardDiss  3.065634e-02 7.902396e-02            0
      1052  437_2074399 MorisitaHornDiss -1.487758e-03 9.702324e-01            0
      1053  437_2074399   BrayCurtisDiss  3.607616e-02 4.608442e-01            0
               intercept
      1     -21.06812300
      2      -0.91717475
      3      11.68745489
      4       1.45592710
      5      -3.41053410
      6      -3.02344584
      7     -14.07459139
      8     -22.31910862
      9     -15.14316644
      10     53.87658732
      11     34.71294026
      12     11.44514255
      13     -2.69249172
      14     -1.56383663
      15      2.53003024
      16      7.36159064
      17      6.72915469
      18      5.78242850
      19      0.16690423
      20    131.78559823
      21     88.93739622
      22     30.50765208
      23    385.70598229
      24    106.12612348
      25    -50.53313291
      26    -14.31584380
      27     44.15509585
      28     42.97729763
      29   -101.20378097
      30   -105.38809988
      31     20.37850267
      32    -36.62751061
      33    -18.99010082
      34    -37.06692701
      35    -39.83558785
      36    -65.99844374
      37    218.20686520
      38    245.32282114
      39    204.77741114
      40     71.03636700
      41      3.65929172
      42     79.37671842
      43     30.67250264
      44     -2.50061070
      45    -48.13069356
      46     93.18406589
      47     17.22241574
      48     42.82358964
      49     28.55927680
      50     11.59350744
      51     11.12837190
      52   -122.07209524
      53    -13.97249443
      54    -75.64967852
      55    -89.01047619
      56     42.15935329
      57     -7.60480740
      58     29.42829588
      59    -43.21216106
      60     32.24993800
      61      4.82275752
      62    -85.35640267
      63    -47.60359646
      64      3.76406015
      65      1.89923355
      66      2.67258114
      67     91.01754877
      68     88.26078024
      69     60.54880437
      70    -22.18698413
      71    -14.68712111
      72    -14.75898970
      73    -34.73599987
      74   -127.90657595
      75   -131.53431497
      76     53.50603630
      77     54.23436969
      78     57.63269703
      79   -569.83988958
      80   -881.74980457
      81   -648.93065406
      82    -72.73164015
      83     51.73912679
      84      8.62263797
      85    -27.78716221
      86    -34.41583579
      87    -62.50499527
      88    155.58325668
      89    -75.09693668
      90      1.82664798
      91     88.56673437
      92    -29.59316663
      93     43.22701856
      94    242.41789858
      95    267.16872420
      96    290.36259762
      97    -61.31666667
      98    147.90969294
      99     22.73722956
      100   301.95000000
      101   515.05330490
      102   402.71507937
      103  -108.78962963
      104    14.83205728
      105  -168.35011966
      106   -41.08857143
      107    50.68793840
      108    12.09410743
      109    35.68103277
      110    54.72538711
      111    39.21272943
      112    12.16274155
      113  -150.14507676
      114   -72.29540462
      115    28.80416667
      116    37.23102075
      117   -19.21633680
      118    17.02747430
      119   -90.83225601
      120   150.21446985
      121   -66.99565753
      122  -112.85547594
      123  -229.36160491
      124     4.65797343
      125   -55.30720825
      126   -23.71581910
      127    26.38528088
      128   131.20852524
      129    63.70023522
      130    32.99327806
      131    11.57803803
      132    44.66516581
      133   -19.57396119
      134    49.33083254
      135    38.42804107
      136    67.70578078
      137   109.78607011
      138    12.06655480
      139   121.36288998
      140   139.81785248
      141   116.86308545
      142     4.74207514
      143    -4.85254315
      144    -5.30261598
      145    32.81250000
      146   -17.60963000
      147   -50.24033407
      148   -10.63399624
      149     6.83809682
      150    32.71087437
      151   -66.41700044
      152     7.64364286
      153    22.72573212
      154   -85.98513859
      155   -14.79980276
      156   -12.92915210
      157   -10.25869855
      158    -5.55529926
      159   -16.74459376
      160    75.73932264
      161    88.22309565
      162   322.65679360
      163    -3.80833333
      164   -12.00990868
      165   -40.23774670
      166   -11.62059359
      167   -50.36442904
      168   -27.76240720
      169   -71.52378049
      170   -45.36099871
      171   -86.45899030
      172  -129.33065859
      173   -63.79070806
      174  -224.03567351
      175    11.04653680
      176   -52.95940384
      177   -41.88128449
      178   -31.54135677
      179    30.61652237
      180    12.07975617
      181    -0.86275084
      182  -184.85304485
      183  -111.02893822
      184   -16.09632616
      185     4.18749199
      186     7.69467124
      187    45.61725279
      188   -24.22123989
      189   -44.85818543
      190   212.58396179
      191    29.88327090
      192   115.53847564
      193   -83.78197479
      194  -252.43379114
      195  -114.04605408
      196   142.99179131
      197   251.54122250
      198   156.24595812
      199   -49.60555556
      200  -222.05334948
      201  -102.88753607
      202   -14.29106295
      203   -70.00771512
      204   -49.71214742
      205   -38.98842105
      206   -12.90358689
      207   -19.06265263
      208   -69.63599265
      209   -82.06690237
      210   -81.45990684
      211    24.16906243
      212  -131.24326400
      213   -54.76149137
      214  -105.44727011
      215   -42.13907121
      216   -66.90127642
      217    62.35325108
      218   -72.13104521
      219   -34.37602590
      220  -159.90151261
      221  -186.75786407
      222   -90.42954550
      223   -77.95234700
      224   100.53185125
      225    30.57219688
      226     0.14285714
      227    34.10906298
      228   -33.08650794
      229   144.28571429
      230   144.28571429
      231    96.52380952
      232  -502.16666667
      233    34.53276353
      234     0.38888889
      235   -66.93333333
      236   -37.21973583
      237   -27.06528175
      238   502.83333333
      239     0.75443861
      240    42.84636763
      241   -28.39991367
      242     2.14984543
      243   -34.88975875
      244   -74.71705168
      245   -11.39845444
      246   -63.35515484
      247   -59.52747432
      248    58.58767239
      249    16.29425089
      250   -75.80590164
      251   -19.06741448
      252   -79.07789175
      253    -8.03844128
      254     0.66331577
      255     0.04858513
      256   178.73214286
      257   178.73214286
      258   148.77728732
      259  -248.64285714
      260  -677.31778866
      261  -455.04301075
      262   -87.03435115
      263   -81.25588590
      264   -96.46412214
      265   -11.15662651
      266   -23.21236814
      267    -6.67786937
      268   -76.92222222
      269   -52.01924399
      270   -46.95213675
      271    24.34469962
      272    33.65996258
      273    20.79451574
      274    33.36265664
      275    43.48249922
      276    17.36311550
      277     0.66666667
      278   -17.37382737
      279   -24.35465502
      280   -21.97671288
      281  -125.07532567
      282   -52.04761809
      283    47.00884544
      284    60.41282332
      285    21.04006496
      286    30.59109312
      287    10.10495173
      288    15.79554656
      289    64.91896024
      290    64.91896024
      291    64.91896024
      292     8.41604785
      293    39.05505971
      294     7.45535467
      295    44.43840580
      296    87.87072821
      297     2.43598036
      298   -62.29585463
      299  -109.87019904
      300   -34.91952624
      301   -26.36973180
      302   -59.39846005
      303     7.07929744
      304   -37.92880259
      305   -17.12202879
      306   -13.59830097
      307    11.59139785
      308   -43.72643305
      309    33.23808006
      310    25.15209472
      311    38.35710831
      312   -20.85289712
      313    40.94055944
      314  -108.62564019
      315    23.61920163
      316   -30.41587678
      317    -8.69025051
      318    40.65395150
      319    41.55292259
      320    59.70405211
      321     7.77958001
      322   -12.75507137
      323   -26.33491891
      324     3.09889660
      325   -31.54737733
      326   -96.28546671
      327   -53.24055605
      328     0.66666667
      329     0.66666667
      330     0.88888889
      331     3.62948029
      332     4.50597372
      333     4.50597372
      334    39.96916522
      335    57.29623299
      336    35.32011884
      337    42.42903226
      338     2.73735692
      339   -46.07349942
      340     3.34131206
      341    30.39856090
      342    32.98859641
      343  -101.52040816
      344  -101.52040816
      345  -101.52040816
      346    35.35836299
      347   -16.15360697
      348    15.92088024
      349    47.41279070
      350    66.97171161
      351    66.52393981
      352  -142.28571429
      353  -142.28571429
      354  -142.28571429
      355    38.29236111
      356    29.64851449
      357    13.82044192
      358     1.00000000
      359     1.00000000
      360     1.00000000
      361    20.09591002
      362   -59.21034082
      363   -30.56301652
      364   -35.54374202
      365   -11.20753154
      366   -16.75527822
      367     1.00000000
      368     1.00000000
      369     1.00000000
      370    55.31065760
      371   101.08678328
      372     8.40599876
      373  -286.33333333
      374  -286.33333333
      375  -286.33333333
      376     5.01636905
      377    -9.79542112
      378    -3.35932649
      379   -42.39352701
      380   -20.78646618
      381   -23.46841097
      382    10.24969475
      383    34.63881621
      384    25.77004477
      385    32.68333333
      386    84.35634022
      387    54.91093412
      388    35.31034483
      389    92.82758621
      390    66.74565754
      391    31.64872521
      392    36.16997167
      393   -38.93838527
      394   286.50000000
      395   381.66666667
      396   229.40000000
      397   -43.72777778
      398   -58.63703704
      399   -54.88888889
      400     1.00000000
      401     1.00000000
      402     1.00000000
      403    36.81292517
      404    50.74675347
      405    42.73337972
      406    84.37500000
      407  -232.89573129
      408    50.92042484
      409   168.50000000
      410   168.50000000
      411    45.07894737
      412    85.38666667
      413    62.91500703
      414    36.86330041
      415   -19.76031488
      416    -8.01716129
      417   -10.73812789
      418   -55.03600000
      419  -172.96539111
      420  -110.86666729
      421    24.24265045
      422    76.11113954
      423    45.74545131
      424     1.00000000
      425     1.00000000
      426     1.00000000
      427   195.94722222
      428   163.86399562
      429   -14.57773109
      430    28.90262172
      431    57.28170230
      432    16.21961185
      433    77.13675214
      434    27.22473605
      435    -5.29226656
      436    21.66807260
      437    14.44538173
      438    18.01999772
      439    45.75862069
      440    71.67150635
      441    68.13793103
      442    38.36167341
      443     2.02176387
      444    44.59928966
      445  -177.53571429
      446   -18.94348216
      447   -67.01360544
      448     1.00000000
      449     1.00000000
      450     1.00000000
      451    41.29054054
      452    81.55185327
      453   -61.91506353
      454   -13.56811594
      455    -6.17189971
      456    -7.53230218
      457   109.33734940
      458     2.99554382
      459   120.48530197
      460     0.22222222
      461    40.35527916
      462    55.01804149
      463   999.16666667
      464   999.16666667
      465   666.44444444
      466   -19.45406504
      467   -36.76135084
      468   -33.94030197
      469   266.45918367
      470   266.45918367
      471   222.21598639
      472   -47.03040541
      473    53.98407989
      474    53.26144455
      475   -23.34523810
      476   -10.08252371
      477   -21.53103983
      478    26.25000000
      479    54.37191011
      480    52.22522523
      481     1.00000000
      482     1.00000000
      483     1.00000000
      484    90.90204082
      485   108.61459465
      486    11.10135290
      487    11.51711195
      488   -12.76104637
      489   -15.88657390
      490   235.35754190
      491   235.35754190
      492   118.17877095
      493    -7.68870523
      494    60.22756393
      495    35.27000654
      496    52.72089476
      497    52.69482441
      498    25.70743380
      499   402.40000000
      500    35.44423047
      501    93.81138020
      502    10.10144928
      503   -87.62000749
      504   -54.43494677
      505    38.30326198
      506    -7.22874266
      507   -11.97842962
      508   -30.95126354
      509   -47.42626231
      510   -16.11178827
      511   214.91803279
      512   214.91803279
      513   214.91803279
      514     2.21016381
      515    17.32682284
      516    11.11595102
      517   -36.73399015
      518   -58.83307109
      519   -44.65376213
      520     0.33333333
      521     0.25721785
      522    16.56337834
      523   -50.23026316
      524  -150.83624345
      525   -36.57250767
      526   -14.21487603
      527   -15.42061766
      528    96.03472072
      529  -718.50000000
      530  -718.50000000
      531  -142.90000000
      532    -3.88335218
      533    58.89472885
      534    34.96686732
      535   -13.97107210
      536     1.78201564
      537    18.00444564
      538   -12.11960856
      539   -14.87322690
      540    18.27778807
      541     4.95069669
      542   -22.58961361
      543   -24.97846836
      544    -1.77728579
      545     0.33256151
      546     0.34898978
      547    -6.76963780
      548   -46.52536491
      549   -34.21181339
      550    -5.35534277
      551   -16.62862483
      552   -19.71177641
      553    -6.07808618
      554   -12.52952279
      555   -13.71384710
      556     3.77314678
      557   -34.97396468
      558   -18.91599338
      559   -14.15341194
      560   -55.10038490
      561   -23.02399521
      562    17.89772824
      563     6.09448729
      564    -6.19897506
      565    18.54119449
      566   -30.46726539
      567   -41.83497218
      568   -10.69623174
      569   -33.14150393
      570   -33.10883888
      571   -13.97790632
      572   -12.19394839
      573     4.62488981
      574     8.21615816
      575   -17.10091419
      576   -14.79464966
      577    13.34040534
      578    17.16901861
      579    14.09508071
      580    14.06787330
      581    90.96638958
      582    76.60099143
      583     0.84054543
      584   -33.67738552
      585   -28.64215551
      586    -4.95805616
      587    -3.00345692
      588    20.33906658
      589    51.14502924
      590   -17.46654333
      591    50.08241137
      592    31.58807035
      593     5.27505009
      594   -31.69771226
      595    -0.46713769
      596   -20.19187982
      597    11.23076269
      598    -5.98726880
      599   -32.92745609
      600   -41.89483221
      601     3.04706673
      602   -35.07654575
      603   -28.66856377
      604    -5.83096510
      605     2.21699680
      606     1.53051883
      607    -5.20944444
      608     0.68014701
      609    -7.47719416
      610    43.11744666
      611    36.88100841
      612    65.80255074
      613    -1.63374695
      614   -18.63813798
      615    -0.43977631
      616    -9.88524310
      617    19.77129904
      618     3.30333489
      619    10.24059375
      620    39.75668828
      621     1.06227195
      622   -11.13160119
      623    -3.49320723
      624     4.99237684
      625    -8.31093131
      626    -2.86322621
      627    -7.89947411
      628    -9.64800700
      629    -0.43591125
      630    30.49800071
      631    -0.16539870
      632   -21.76758291
      633   -32.66455738
      634    -4.60666735
      635     2.11209237
      636     3.16695127
      637    -0.02072608
      638    20.53076218
      639    12.64665938
      640    -9.91433230
      641    38.32963960
      642    -0.93510160
      643     1.17020538
      644    -1.64924382
      645   -47.35214261
      646     2.25039747
      647    -7.71119950
      648   -10.90430212
      649    -8.44873303
      650     4.15979132
      651    15.09147178
      652    -1.46330226
      653   -19.07565449
      654    -8.15294339
      655    -6.70072627
      656   -23.16662302
      657   -27.37638255
      658     0.24756453
      659     6.63177608
      660    12.38218772
      661    -7.98522088
      662    19.86895810
      663    17.33653201
      664   -13.58348423
      665   -12.88819994
      666   -37.58653698
      667   -10.53885904
      668     1.76426820
      669    36.78228014
      670   -14.01642251
      671     9.03323738
      672     9.95491337
      673    -3.61075135
      674    -4.87512532
      675   -11.72882063
      676    -6.61760256
      677    15.38016209
      678    -3.90874575
      679   -63.43656344
      680    -4.49154869
      681   -87.30193343
      682    -1.51119213
      683   -43.90238135
      684   -18.92700911
      685   -14.83162664
      686   -11.07125112
      687     3.38119465
      688    -6.15188023
      689    35.37773774
      690    14.74913849
      691    -0.01732132
      692    -0.84118788
      693   -28.43835052
      694     1.43013108
      695    13.96205001
      696     3.08131638
      697     2.42484215
      698     4.77703061
      699    46.58940375
      700    -4.79718537
      701     4.57692757
      702   -23.85177553
      703    13.86083233
      704     4.20448668
      705     3.25890383
      706    27.94035645
      707    11.69924195
      708    -5.61574716
      709   -13.81294444
      710   -10.57248780
      711   -23.50384454
      712    -1.42924535
      713    -2.25032454
      714     9.33504759
      715   -19.56740345
      716     9.92391192
      717   -18.55878178
      718   -16.05551658
      719    -8.43436273
      720   -10.33393491
      721   -12.51935764
      722   -41.40151029
      723   -28.51415529
      724   -25.23321791
      725    -5.90427886
      726   -29.83585158
      727     1.81102699
      728     3.97498518
      729    -3.85677013
      730    -6.79027686
      731   -27.41503762
      732   -10.70279859
      733   -17.90842491
      734  -103.00883348
      735   -23.20843640
      736     7.52275288
      737   -17.95145609
      738   -23.40913435
      739   -13.33654614
      740     0.22118838
      741     2.46928244
      742     5.55280738
      743     2.81663726
      744    32.29633397
      745   -10.40168235
      746    -1.46259484
      747   -18.90834402
      748     4.67667321
      749   -32.23697972
      750   -16.22223614
      751   -11.96108392
      752    -0.68226070
      753     3.76244825
      754   -22.49329257
      755    20.72636269
      756    15.60433542
      757   -15.89054039
      758   -30.30288198
      759   -32.64698048
      760     4.79918526
      761    46.33508398
      762    12.51325010
      763     5.07492066
      764    -2.11421835
      765     6.78399747
      766     0.48166594
      767    51.25921165
      768    49.45304693
      769    29.05487022
      770   -14.35416950
      771   -20.78134733
      772   -18.56445848
      773   -28.45060250
      774    -6.67748577
      775    22.64735085
      776   -42.00327798
      777   -31.47501493
      778    -0.37930348
      779    23.29565266
      780    11.16027821
      781   140.92259674
      782  -103.07829531
      783   -40.33591595
      784   -50.46052398
      785   -36.19649073
      786    -4.64725192
      787    10.39990355
      788    58.86723113
      789    23.56546465
      790   -46.12013458
      791   -80.02217961
      792     7.40599454
      793    25.62670442
      794   -99.24861543
      795    -4.21983170
      796    17.98208339
      797   -82.41422581
      798   -39.70651857
      799    -9.29281437
      800    -9.99595888
      801    -3.11593457
      802    71.90583164
      803    23.33963496
      804   -60.90003167
      805     0.29223905
      806    57.32475295
      807    42.12398154
      808   -26.57525558
      809    32.14221671
      810     4.71256065
      811    -1.55383424
      812    -7.18179531
      813     3.76198364
      814    -4.13991932
      815   -22.59514507
      816   -20.62733523
      817    -4.85658897
      818     5.06554859
      819     1.03045883
      820   -13.18220967
      821    59.89448806
      822    54.95602258
      823     8.19418182
      824    72.37260646
      825    30.08919532
      826    -8.62121705
      827    16.76087986
      828    -0.91227765
      829    12.25084611
      830    16.94871947
      831   -48.93623874
      832    17.23444976
      833    61.05418346
      834    52.23276302
      835     6.17300861
      836   -35.08210361
      837   -16.71931782
      838    -4.62040450
      839     1.89171655
      840     6.05003381
      841   -80.75761675
      842    51.93280666
      843    30.63414868
      844    33.32049689
      845   -72.82934528
      846   -68.82369332
      847    -1.55571625
      848    -1.81699202
      849    -3.87054002
      850    -2.40985637
      851   -57.01751766
      852   -39.15804049
      853    -3.74274452
      854   -76.60771017
      855   -48.83942855
      856     3.21249004
      857     9.22156756
      858    -4.62911221
      859     7.75563591
      860   -44.02186159
      861    10.75859463
      862    -6.78943563
      863    -9.29181379
      864     6.84995202
      865     0.56187278
      866   -11.21640317
      867   -11.64196209
      868     2.04445773
      869    40.38366444
      870    26.97628146
      871     0.42507704
      872   -29.21191419
      873    -6.46446826
      874    -0.42996305
      875   108.56150972
      876    15.41188692
      877    -5.96410165
      878   -42.44432747
      879   -62.90359724
      880   -18.25977547
      881    29.10045642
      882    32.55853625
      883   -13.92177788
      884   -13.60907035
      885    -6.60711116
      886    -5.60090699
      887   -33.71526588
      888   -31.08970172
      889   -31.67648163
      890   -26.00634459
      891   -23.41838790
      892    -1.63534778
      893    24.08938648
      894    13.86924842
      895   -25.96551691
      896    17.60445613
      897    -0.69441644
      898    25.82626087
      899  -294.50528279
      900  -306.55384817
      901    -0.93741497
      902     6.00880354
      903   -84.67471518
      904     4.39908004
      905   -35.95540687
      906   -37.37245619
      907    -3.93924260
      908    26.20092304
      909    26.54202001
      910    -0.38691247
      911   -76.78401044
      912   -67.22118749
      913    -0.14720110
      914    18.99785993
      915    22.51148107
      916     2.16452533
      917    70.12330667
      918     3.47529976
      919   -11.45150008
      920    -6.55333426
      921   -37.05901475
      922   -53.58412698
      923   154.92373633
      924   179.01730780
      925   -46.65110449
      926   119.98557765
      927    20.39693807
      928    15.57038530
      929    24.04330917
      930   -13.70094851
      931   -16.59440018
      932   -10.85777655
      933    15.99942179
      934    -0.38509631
      935   -18.20265364
      936    19.01025849
      937   -17.23136167
      938    -2.20571042
      939    -7.17975354
      940     1.31732737
      941   -28.34751311
      942   -30.29388339
      943     4.42457551
      944    55.23785547
      945    84.59112543
      946     0.39444444
      947  -169.25562961
      948   -59.84886897
      949    -2.51738104
      950   -29.68926124
      951    11.79663894
      952    61.01091097
      953  -211.81482784
      954  -113.02717134
      955    16.21552250
      956   -17.79520044
      957   148.25360209
      958    -9.32147207
      959   -14.52165089
      960    23.68458670
      961   -25.35032938
      962   511.42795808
      963   -57.65559582
      964   -44.01895269
      965     8.20466819
      966   -16.75318347
      967     6.03339852
      968   -15.51572797
      969   -11.01222942
      970   -20.52199074
      971    90.87345220
      972    33.54172862
      973     8.32130226
      974    -1.01811276
      975    66.60923352
      976    22.86986373
      977    -3.48665938
      978   -39.72651554
      979     2.94522461
      980     0.25711929
      981     0.57478043
      982   -21.77398696
      983    18.09894569
      984   -16.23394345
      985    -1.62758130
      986    11.38373031
      987    14.86916662
      988    -7.15325920
      989   -45.81584157
      990   -22.69417869
      991   -47.71699102
      992    -9.53596970
      993   -41.21010492
      994    -2.27706499
      995   -45.23000793
      996     0.35113878
      997    -9.78082800
      998    38.82583855
      999    -5.73945685
      1000    3.29853731
      1001    7.21945099
      1002    4.00940855
      1003   31.11773879
      1004    8.98128191
      1005  -53.02125632
      1006 -220.96296296
      1007 -356.97355066
      1008 -160.96559764
      1009  -39.76444444
      1010   -0.49159436
      1011  141.77210934
      1012  -46.86265597
      1013   10.34951249
      1014   18.06741681
      1015   19.85237391
      1016   15.26156429
      1017   50.05263622
      1018   30.76608638
      1019   -0.35836009
      1020   36.47956067
      1021  -10.01215570
      1022  -69.43398006
      1023  -47.98518628
      1024  -61.89684407
      1025   88.21975811
      1026   40.46024940
      1027   82.46526611
      1028   74.73343717
      1029   33.71448393
      1030  -24.62227753
      1031  -46.76904605
      1032  -86.41452862
      1033   90.50351925
      1034   13.47488180
      1035   36.12774901
      1036   83.72677521
      1037   79.71503789
      1038   92.70050552
      1039  -14.11387344
      1040   -9.83864776
      1041   -4.59079640
      1042  -29.68621918
      1043  -78.48218615
      1044  -54.10235990
      1045   74.70235097
      1046  135.69532463
      1047  110.81053359
      1048  -27.35877030
      1049  -31.81630324
      1050  -33.55086209
      1051  -61.06660809
      1052    3.39923555
      1053  -72.01137734

---

    Code
      set.seed(42)
      gridding(meta, btf) %>% resampling(measure = "BIOMASS", resamps = 1L) %>%
        getBetaMetrics(measure = "BIOMASS") %>% getLinearRegressions(divType = "beta")
    Message
      OK: all SL studies have 1 grid cell
    Condition
      Warning in `resampling()`:
      NA values found and removed.
      Only a subset of `x` is used.
    Output
         assemblageID           metric        slope      pvalue significance
      1    211_529239      JaccardDiss  0.016466117 0.229606351            0
      2    211_529239 MorisitaHornDiss  0.011510256 0.741736591            0
      3    211_529239   BrayCurtisDiss -0.001134076 0.943233207            0
      4    211_525598      JaccardDiss -0.030644828 0.061738185            0
      5    211_525598 MorisitaHornDiss -0.060114737 0.209823011            0
      6    211_525598   BrayCurtisDiss -0.042005035 0.232230755            0
      7    211_521960      JaccardDiss  0.011140905 0.674201178            0
      8    211_521960 MorisitaHornDiss  0.003802853 0.900087766            0
      9    211_521960   BrayCurtisDiss -0.008648051 0.463893641            0
      10   211_523410      JaccardDiss  0.021703219 0.304793423            0
      11   211_523410 MorisitaHornDiss  0.052587214 0.327915588            0
      12   211_523410   BrayCurtisDiss  0.021383489 0.392355293            0
      13   211_517585      JaccardDiss -0.038344298 0.407566664            0
      14   211_517585 MorisitaHornDiss  0.005766211 0.972633870            0
      15   211_517585   BrayCurtisDiss -0.126064956 0.169584592            0
      16   211_516855      JaccardDiss  0.013562248 0.009648326            1
      17   211_516855 MorisitaHornDiss -0.049345362 0.410116711            0
      18   211_516855   BrayCurtisDiss -0.007715775 0.926900414            0
      19  437_2075128      JaccardDiss  0.012428120 0.085091524            0
      20  437_2075128 MorisitaHornDiss  0.049305201 0.208175388            0
      21  437_2075128   BrayCurtisDiss  0.036612792 0.523905114            0
      22  437_2077319      JaccardDiss -0.043230231 0.013422784            1
      23  437_2077319 MorisitaHornDiss  0.015534820 0.645994406            0
      24  437_2077319   BrayCurtisDiss -0.001983839 0.958180478            0
      25  437_2076590      JaccardDiss -0.047509346 0.034397566            1
      26  437_2076590 MorisitaHornDiss -0.015302393 0.648566611            0
      27  437_2076590   BrayCurtisDiss -0.027024560 0.106449963            0
      28  437_2078777      JaccardDiss -0.007139591 0.557799335            0
      29  437_2078777 MorisitaHornDiss -0.021803985 0.039011236            1
      30  437_2078777   BrayCurtisDiss -0.039083017 0.084954564            0
      31  437_2076589      JaccardDiss  0.015061360 0.179385743            0
      32  437_2076589 MorisitaHornDiss  0.062536228 0.245770912            0
      33  437_2076589   BrayCurtisDiss  0.030408842 0.252202834            0
      34  437_2075860      JaccardDiss -0.036797158 0.233709903            0
      35  437_2075860 MorisitaHornDiss -0.015957164 0.181915234            0
      36  437_2075860   BrayCurtisDiss -0.024477041 0.174019472            0
      37  437_2074400      JaccardDiss  0.016442445 0.519997777            0
      38  437_2074400 MorisitaHornDiss  0.006988277 0.099111013            0
      39  437_2074400   BrayCurtisDiss -0.013951057 0.312102595            0
      40  437_2074399      JaccardDiss  0.030656345 0.079023964            0
      41  437_2074399 MorisitaHornDiss  0.031622558 0.641753140            0
      42  437_2074399   BrayCurtisDiss  0.047328352 0.516437303            0
           intercept
      1   -31.997958
      2   -22.486480
      3     2.944410
      4    61.467806
      5   119.604204
      6    84.043341
      7   -21.506869
      8    -6.985901
      9    17.789439
      10  -42.308206
      11 -103.721817
      12  -41.543708
      13   76.804698
      14  -11.204027
      15  250.518796
      16  -26.195987
      17   97.986983
      18   16.127830
      19  -24.324486
      20  -98.725114
      21  -73.013310
      22   87.572339
      23  -30.930996
      24    4.581067
      25   96.157038
      26   30.988292
      27   54.760403
      28   14.990759
      29   44.394889
      30   79.277243
      31  -29.686219
      32 -125.413733
      33  -60.635169
      34   74.702351
      35   32.258323
      36   49.656646
      37  -32.451973
      38  -13.637705
      39   28.625699
      40  -61.066608
      41  -63.149637
      42  -94.577536

