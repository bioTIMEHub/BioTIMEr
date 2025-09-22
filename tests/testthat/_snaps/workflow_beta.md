# Whole workflow works consistently

    Code
      suppressWarnings({
        set.seed(42)
        getLinearRegressions(getBetaMetrics(resampling(gridding(meta, btf), measure = "ABUNDANCE",
        resamps = 1L), measure = "ABUNDANCE"), divType = "beta")
      })
    Message
      OK: all SL studies have 1 grid cell
    Output
           assemblageID           metric         slope       pvalue significance
      1       10_359170      JaccardDiss  1.071370e-02 1.523005e-01            0
      2       10_359170 MorisitaHornDiss  4.656071e-04 5.285384e-01            0
      3       10_359170   BrayCurtisDiss -5.768187e-03 4.980033e-01            0
      4       18_335699      JaccardDiss  2.789497e-03 1.139877e-01            0
      5       18_335699 MorisitaHornDiss  1.879866e-03 3.511275e-01            0
      6       18_335699   BrayCurtisDiss  2.597668e-03 1.403751e-01            0
      7       41_453357      JaccardDiss  7.420661e-03 1.915310e-02            1
      8       41_453357 MorisitaHornDiss  1.166606e-02 2.516155e-02            1
      9       41_453357   BrayCurtisDiss  8.008083e-03 6.489529e-02            0
      10      53_394335      JaccardDiss -1.921542e-02 2.162509e-01            0
      11      53_394335 MorisitaHornDiss -2.667143e-02 2.259319e-03            1
      12      53_394335   BrayCurtisDiss -8.492720e-03 3.578363e-01            0
      13      59_470660      JaccardDiss  5.403932e-03 1.580222e-01            0
      14      59_470660 MorisitaHornDiss  5.090131e-03 1.903194e-03            1
      15      59_470660   BrayCurtisDiss  7.497158e-03 3.033645e-02            1
      16     211_529239      JaccardDiss  3.530470e-03 8.322757e-01            0
      17     211_529239 MorisitaHornDiss  1.992507e-03 9.631687e-01            0
      18     211_529239   BrayCurtisDiss -7.095148e-04 9.818433e-01            0
      19     211_525598      JaccardDiss -5.140039e-03 7.964215e-01            0
      20     211_525598 MorisitaHornDiss -2.063733e-02 6.783959e-01            0
      21     211_525598   BrayCurtisDiss -2.387968e-04 9.950775e-01            0
      22     211_521960      JaccardDiss -1.307328e-02 4.252193e-01            0
      23     211_521960 MorisitaHornDiss -8.182698e-03 7.199222e-01            0
      24     211_521960   BrayCurtisDiss -1.606928e-02 2.653641e-01            0
      25     211_523410      JaccardDiss  5.458244e-03 8.073478e-01            0
      26     211_523410 MorisitaHornDiss  5.997662e-02 2.044657e-01            0
      27     211_523410   BrayCurtisDiss  2.506179e-02 4.188491e-01            0
      28     211_517585      JaccardDiss  7.944996e-03 8.985240e-01            0
      29     211_517585 MorisitaHornDiss  1.364727e-01 3.146540e-01            0
      30     211_517585   BrayCurtisDiss  8.670349e-02 3.321715e-01            0
      31     211_516855      JaccardDiss -3.598485e-03 9.234561e-01            0
      32     211_516855 MorisitaHornDiss -4.440630e-03 9.454092e-01            0
      33     211_516855   BrayCurtisDiss  4.794111e-02 6.580887e-01            0
      34     333_426984      JaccardDiss  3.387082e-03 1.093833e-02            1
      35     333_426984 MorisitaHornDiss  8.005620e-03 1.110660e-02            1
      36     333_426984   BrayCurtisDiss  6.441128e-03 2.005764e-04            1
      37    372_2374518      JaccardDiss  4.625850e-03 9.146805e-01            0
      38    372_2374518 MorisitaHornDiss  2.646915e-02 6.391178e-01            0
      39    372_2374518   BrayCurtisDiss  3.121226e-02 3.623392e-01            0
      40    372_2378881      JaccardDiss -1.132510e-02 8.628958e-01            0
      41    372_2378881 MorisitaHornDiss  1.362297e-01 4.994934e-01            0
      42    372_2378881   BrayCurtisDiss  3.533984e-02 6.124005e-01            0
      43    372_2426320      JaccardDiss -6.050622e-02 2.543934e-01            0
      44    372_2426320 MorisitaHornDiss -2.666203e-02 4.594106e-01            0
      45    372_2426320   BrayCurtisDiss -3.786545e-02 3.909772e-01            0
      46    372_2427777      JaccardDiss  5.372739e-02 1.429124e-01            0
      47    372_2427777 MorisitaHornDiss -7.414726e-03 7.454979e-01            0
      48    372_2427777   BrayCurtisDiss -6.167756e-03 8.574390e-01            0
      49    372_2428506      JaccardDiss  3.386084e-02 3.825023e-01            0
      50    372_2428506 MorisitaHornDiss  8.626298e-03 7.052876e-01            0
      51    372_2428506   BrayCurtisDiss  1.594014e-02 5.858213e-01            0
      52    372_2426316      JaccardDiss -1.913043e-02 5.854424e-01            0
      53    372_2426316 MorisitaHornDiss -6.751794e-02 1.805344e-01            0
      54    372_2426316   BrayCurtisDiss -4.335359e-02 3.024298e-01            0
      55    372_2408087      JaccardDiss -5.960784e-02 2.061337e-01            0
      56    372_2408087 MorisitaHornDiss -1.313172e-02 7.890493e-01            0
      57    372_2408087   BrayCurtisDiss -5.616281e-02 1.924379e-01            0
      58    372_2399318      JaccardDiss  4.850442e-02 3.131871e-01            0
      59    372_2399318 MorisitaHornDiss  1.699656e-02 4.304713e-01            0
      60    372_2399318   BrayCurtisDiss  3.626828e-02 3.474349e-01            0
      61    372_2347502      JaccardDiss  2.277433e-02 6.867923e-01            0
      62    372_2347502 MorisitaHornDiss  2.969225e-02 7.176152e-01            0
      63    372_2347502   BrayCurtisDiss  2.768780e-02 7.896958e-01            0
      64    372_2430698      JaccardDiss  1.991131e-02 5.852666e-01            0
      65    372_2430698 MorisitaHornDiss -1.532133e-02 7.366519e-01            0
      66    372_2430698   BrayCurtisDiss  1.591805e-02 6.783375e-01            0
      67    372_2428503      JaccardDiss  4.259409e-02 2.165066e-01            0
      68    372_2428503 MorisitaHornDiss  2.908939e-02 4.358611e-01            0
      69    372_2428503   BrayCurtisDiss  2.233101e-02 3.839022e-01            0
      70    372_2408078      JaccardDiss  4.243590e-02 4.622226e-01            0
      71    372_2408078 MorisitaHornDiss  3.997841e-03 9.298263e-01            0
      72    372_2408078   BrayCurtisDiss  7.995315e-03 7.956327e-01            0
      73    372_2397858      JaccardDiss -2.145297e-02 7.023312e-01            0
      74    372_2397858 MorisitaHornDiss -2.862894e-02 6.064956e-01            0
      75    372_2397858   BrayCurtisDiss -1.529447e-02 8.068983e-01            0
      76    372_2400785      JaccardDiss -6.045545e-02 3.437409e-02            1
      77    372_2400785 MorisitaHornDiss -6.320190e-02 3.376600e-02            1
      78    372_2400785   BrayCurtisDiss -3.844089e-02 1.618953e-01            0
      79    372_2437271      JaccardDiss  3.904983e-02 2.002322e-01            0
      80    372_2437271 MorisitaHornDiss -9.164307e-03 6.343522e-01            0
      81    372_2437271   BrayCurtisDiss -1.117184e-02 5.909601e-01            0
      82    372_2424858      JaccardDiss -2.334477e-02 5.658184e-01            0
      83    372_2424858 MorisitaHornDiss -1.130216e-02 8.483954e-01            0
      84    372_2424858   BrayCurtisDiss -1.542949e-02 7.059425e-01            0
      85    372_2410991      JaccardDiss -3.625086e-02 2.585965e-01            0
      86    372_2410991 MorisitaHornDiss  1.534932e-03 9.702658e-01            0
      87    372_2410991   BrayCurtisDiss -5.762013e-03 9.088443e-01            0
      88    372_2375241      JaccardDiss  3.658660e-03 6.988827e-01            0
      89    372_2375241 MorisitaHornDiss -9.371925e-04 9.835923e-01            0
      90    372_2375241   BrayCurtisDiss  1.164484e-02 6.637715e-01            0
      91    372_2406610      JaccardDiss -1.013651e-02 7.740356e-01            0
      92    372_2406610 MorisitaHornDiss -4.959700e-02 1.662313e-02            1
      93    372_2406610   BrayCurtisDiss -1.170861e-02 5.283409e-01            0
      94    372_2459963      JaccardDiss  5.723379e-02 3.258574e-01            0
      95    372_2459963 MorisitaHornDiss -4.901384e-03 8.119798e-01            0
      96    372_2459963   BrayCurtisDiss  9.368725e-03 7.705940e-01            0
      97    372_2442444      JaccardDiss  2.838828e-01 3.373396e-01            0
      98    372_2442444 MorisitaHornDiss  4.390241e-01 3.372876e-01            0
      99    372_2442444   BrayCurtisDiss  3.232323e-01 3.384415e-01            0
      100   372_2434415      JaccardDiss -4.721380e-02 7.564793e-03            1
      101   372_2434415 MorisitaHornDiss  4.481795e-02 1.738474e-01            0
      102   372_2434415   BrayCurtisDiss  1.612458e-02 5.979880e-01            0
      103   372_2367201      JaccardDiss  1.525824e-02 5.757240e-01            0
      104   372_2367201 MorisitaHornDiss  2.222931e-02 3.880741e-01            0
      105   372_2367201   BrayCurtisDiss -7.752737e-03 6.847972e-01            0
      106   372_2440940      JaccardDiss  2.450104e-02 6.215644e-01            0
      107   372_2440940 MorisitaHornDiss -1.317326e-02 7.770650e-01            0
      108   372_2440940   BrayCurtisDiss  1.335260e-02 7.743123e-01            0
      109   372_2443127      JaccardDiss  3.078399e-02 6.297813e-01            0
      110   372_2443127 MorisitaHornDiss -2.779699e-02 7.223076e-01            0
      111   372_2443127   BrayCurtisDiss -1.271375e-02 7.604383e-01            0
      112   372_2432888      JaccardDiss  1.336918e-01 1.752751e-01            0
      113   372_2432888 MorisitaHornDiss  4.375335e-02 7.712365e-01            0
      114   372_2432888   BrayCurtisDiss  6.570523e-02 3.424104e-01            0
      115   372_2428509      JaccardDiss -9.983516e-02 6.767967e-02            0
      116   372_2428509 MorisitaHornDiss -1.563961e-01 1.700481e-01            0
      117   372_2428509   BrayCurtisDiss -8.309950e-02 1.327421e-01            0
      118   372_2432885      JaccardDiss -4.965068e-17 1.000000e+00            0
      119   372_2432885 MorisitaHornDiss  0.000000e+00 1.000000e+00            0
      120   372_2432885   BrayCurtisDiss  1.119570e-05 9.999716e-01            0
      121   372_2421957      JaccardDiss -1.108374e-01 1.703630e-01            0
      122   372_2421957 MorisitaHornDiss  1.320170e-01 2.916101e-01            0
      123   372_2421957   BrayCurtisDiss -5.191167e-02 2.936253e-01            0
      124   372_2406614      JaccardDiss -4.488984e-02 5.388601e-02            0
      125   372_2406614 MorisitaHornDiss -6.034340e-02 1.426645e-01            0
      126   372_2406614   BrayCurtisDiss -4.861884e-02 3.575723e-04            1
      127   372_2402963      JaccardDiss  1.298077e-02 7.835712e-01            0
      128   372_2402963 MorisitaHornDiss -6.550025e-03 8.750590e-01            0
      129   372_2402963   BrayCurtisDiss -9.677564e-03 7.976895e-01            0
      130   372_2426315      JaccardDiss -5.928854e-03 8.304062e-01            0
      131   372_2426315 MorisitaHornDiss  7.479867e-02 5.658614e-01            0
      132   372_2426315   BrayCurtisDiss  3.611484e-02 4.543808e-01            0
      133   372_2427046      JaccardDiss -1.881229e-02 6.357420e-01            0
      134   372_2427046 MorisitaHornDiss  1.145388e-02 3.955261e-01            0
      135   372_2427046   BrayCurtisDiss  2.286349e-02 3.539182e-01            0
      136   372_2403683      JaccardDiss  1.447285e-02 8.580195e-01            0
      137   372_2403683 MorisitaHornDiss  8.640210e-02 4.048073e-01            0
      138   372_2403683   BrayCurtisDiss  7.587868e-02 2.524851e-01            0
      139   372_2369392      JaccardDiss -2.826017e-02 6.432493e-01            0
      140   372_2369392 MorisitaHornDiss  4.312189e-02 7.110788e-01            0
      141   372_2369392   BrayCurtisDiss  3.733211e-02 6.560098e-01            0
      142   372_2400047      JaccardDiss  8.349273e-03 7.231496e-01            0
      143   372_2400047 MorisitaHornDiss -2.242607e-03 9.326121e-01            0
      144   372_2400047   BrayCurtisDiss  2.530789e-03 9.124545e-01            0
      145   372_2431454      JaccardDiss  1.311960e-02 6.257317e-01            0
      146   372_2431454 MorisitaHornDiss  1.134975e-02 7.793652e-01            0
      147   372_2431454   BrayCurtisDiss -1.307887e-02 7.601309e-01            0
      148   372_2443903      JaccardDiss  2.101196e-02 7.321976e-01            0
      149   372_2443903 MorisitaHornDiss  7.905421e-02 3.624960e-01            0
      150   372_2443903   BrayCurtisDiss  3.707388e-02 5.415128e-01            0
      151   372_2394207      JaccardDiss  9.517703e-03 7.521684e-01            0
      152   372_2394207 MorisitaHornDiss  6.576474e-03 7.022169e-01            0
      153   372_2394207   BrayCurtisDiss -1.333173e-05 9.994981e-01            0
      154   372_2362812      JaccardDiss -7.312918e-02 5.015502e-01            0
      155   372_2362812 MorisitaHornDiss  7.977492e-02 4.736311e-02            1
      156   372_2362812   BrayCurtisDiss  1.700764e-03 9.165024e-01            0
      157   372_2410264      JaccardDiss  4.404894e-02 3.073515e-01            0
      158   372_2410264 MorisitaHornDiss  1.678648e-02 7.349989e-01            0
      159   372_2410264   BrayCurtisDiss  2.532862e-02 3.962931e-01            0
      160   372_2452656      JaccardDiss -1.452153e-02 1.769376e-01            0
      161   372_2452656 MorisitaHornDiss -1.228778e-02 4.812913e-01            0
      162   372_2452656   BrayCurtisDiss -2.358692e-02 6.506074e-02            0
      163   372_2379617      JaccardDiss -4.895105e-04 9.884350e-01            0
      164   372_2379617 MorisitaHornDiss -2.455888e-04 9.879244e-01            0
      165   372_2379617   BrayCurtisDiss  1.936517e-02 6.936817e-01            0
      166   372_2441713      JaccardDiss -1.648019e-02 1.723178e-01            0
      167   372_2441713 MorisitaHornDiss -7.151854e-03 8.153098e-01            0
      168   372_2441713   BrayCurtisDiss -2.651094e-02 4.523489e-01            0
      169   372_2442439      JaccardDiss  1.552082e-02 6.773696e-01            0
      170   372_2442439 MorisitaHornDiss  1.550325e-01 5.353155e-01            0
      171   372_2442439   BrayCurtisDiss  7.548580e-02 5.144550e-01            0
      172   372_2440221      JaccardDiss  3.892440e-02 6.144383e-01            0
      173   372_2440221 MorisitaHornDiss -8.886230e-04 9.853909e-01            0
      174   372_2440221   BrayCurtisDiss  4.317335e-04 9.903385e-01            0
      175   372_2438027      JaccardDiss -9.856631e-03 7.989784e-01            0
      176   372_2438027 MorisitaHornDiss  3.324596e-02 6.084797e-01            0
      177   372_2438027   BrayCurtisDiss  1.050006e-02 5.566963e-01            0
      178   372_2434379      JaccardDiss  4.705882e-03 9.263713e-01            0
      179   372_2434379 MorisitaHornDiss  1.364016e-02 8.032667e-01            0
      180   372_2434379   BrayCurtisDiss  1.132880e-01 5.174933e-01            0
      181   372_2435823      JaccardDiss  2.083333e-03 9.318006e-01            0
      182   372_2435823 MorisitaHornDiss  6.015271e-03 8.592846e-01            0
      183   372_2435823   BrayCurtisDiss  2.014220e-02 5.592771e-01            0
      184   372_2425589      JaccardDiss  5.174825e-02 4.824680e-01            0
      185   372_2425589 MorisitaHornDiss  4.102615e-02 1.786506e-01            0
      186   372_2425589   BrayCurtisDiss  3.935232e-02 2.466727e-01            0
      187   372_2427047      JaccardDiss  4.466871e-02 7.849948e-02            0
      188   372_2427047 MorisitaHornDiss  1.379232e-02 3.740141e-01            0
      189   372_2427047   BrayCurtisDiss  2.728917e-02 4.730707e-01            0
      190   372_2427776      JaccardDiss  1.091954e-02 7.640547e-01            0
      191   372_2427776 MorisitaHornDiss  2.779608e-02 1.425948e-01            0
      192   372_2427776   BrayCurtisDiss  2.034494e-02 5.792887e-01            0
      193   372_2429234      JaccardDiss -3.977951e-02 1.791731e-01            0
      194   372_2429234 MorisitaHornDiss -2.189743e-02 5.508812e-01            0
      195   372_2429234   BrayCurtisDiss -2.015247e-02 5.007004e-01            0
      196   372_2429233      JaccardDiss  2.343059e-02 4.301295e-01            0
      197   372_2429233 MorisitaHornDiss  2.879918e-02 7.084682e-01            0
      198   372_2429233   BrayCurtisDiss  3.781499e-02 6.078589e-01            0
      199   372_2425610      JaccardDiss -2.481502e-02 2.605766e-01            0
      200   372_2425610 MorisitaHornDiss -1.581525e-01 8.368063e-03            1
      201   372_2425610   BrayCurtisDiss -5.323151e-03 7.869723e-01            0
      202   372_2423417      JaccardDiss -1.736559e-01 3.062423e-01            0
      203   372_2423417 MorisitaHornDiss -4.367787e-01 3.355362e-01            0
      204   372_2423417   BrayCurtisDiss -2.925666e-01 3.398687e-01            0
      205   372_2404439      JaccardDiss -1.393260e-14 1.000000e+00            0
      206   372_2404439 MorisitaHornDiss  8.767184e-03 8.741506e-01            0
      207   372_2404439   BrayCurtisDiss -4.324007e-02 6.073445e-01            0
      208   372_2412474      JaccardDiss  6.253909e-02 7.216701e-01            0
      209   372_2412474 MorisitaHornDiss  6.151421e-02 7.410278e-01            0
      210   372_2412474   BrayCurtisDiss  9.955850e-02 1.300508e-01            0
      211   372_2419754      JaccardDiss -6.312596e-02 3.813262e-01            0
      212   372_2419754 MorisitaHornDiss  3.697797e-02 4.074886e-01            0
      213   372_2419754   BrayCurtisDiss  2.109171e-02 5.915185e-01            0
      214   372_2419028      JaccardDiss -8.150538e-02 2.694776e-02            1
      215   372_2419028 MorisitaHornDiss -1.253964e-01 9.333588e-02            0
      216   372_2419028   BrayCurtisDiss -9.241168e-02 6.716885e-02            0
      217   372_2409543      JaccardDiss  8.241758e-02 1.091826e-01            0
      218   372_2409543 MorisitaHornDiss  1.538714e-02 9.203492e-01            0
      219   372_2409543   BrayCurtisDiss  4.833333e-02 5.517498e-01            0
      220   372_2403696      JaccardDiss  3.100316e-02 2.352147e-02            1
      221   372_2403696 MorisitaHornDiss  1.536460e-02 8.837070e-01            0
      222   372_2403696   BrayCurtisDiss -7.676286e-03 8.672292e-01            0
      223   372_2400777      JaccardDiss -9.473684e-03 8.090411e-01            0
      224   372_2400777 MorisitaHornDiss -2.485722e-02 7.551557e-01            0
      225   372_2400777   BrayCurtisDiss -1.772779e-02 7.208033e-01            0
      226   372_2394218      JaccardDiss  2.839286e-02 4.722964e-01            0
      227   372_2394218 MorisitaHornDiss  4.984045e-02 4.089146e-01            0
      228   372_2394218   BrayCurtisDiss  1.656146e-02 6.316340e-01            0
      229   372_2399315      JaccardDiss -1.767457e-02 5.822545e-01            0
      230   372_2399315 MorisitaHornDiss  4.382554e-02 3.779166e-01            0
      231   372_2399315   BrayCurtisDiss  1.031126e-02 7.449079e-01            0
      232   372_2375959      JaccardDiss -2.476959e-02 5.951711e-01            0
      233   372_2375959 MorisitaHornDiss -1.641928e-02 2.706545e-01            0
      234   372_2375959   BrayCurtisDiss -3.367396e-02 9.831542e-02            0
      235   372_2363562      JaccardDiss -3.088578e-02 4.338620e-01            0
      236   372_2363562 MorisitaHornDiss  4.127414e-02 4.549160e-01            0
      237   372_2363562   BrayCurtisDiss  3.328123e-02 1.003296e-02            1
      238   372_2365726      JaccardDiss  9.159664e-02 3.273015e-01            0
      239   372_2365726 MorisitaHornDiss  1.072984e-01 1.852524e-01            0
      240   372_2365726   BrayCurtisDiss  6.039115e-02 4.170990e-01            0
      241   372_2435073      JaccardDiss -2.390977e-02 5.325825e-01            0
      242   372_2435073 MorisitaHornDiss  1.718706e-03 9.867807e-01            0
      243   372_2435073   BrayCurtisDiss  6.824043e-03 9.314827e-01            0
      244   372_2432889      JaccardDiss -1.785714e-02 6.606422e-01            0
      245   372_2432889 MorisitaHornDiss -3.217503e-02 6.606422e-01            0
      246   372_2432889   BrayCurtisDiss  3.410553e-03 9.620255e-01            0
      247   372_2433622      JaccardDiss -2.857143e-01 4.543711e-01            0
      248   372_2433622 MorisitaHornDiss -2.857143e-01 4.543711e-01            0
      249   372_2433622   BrayCurtisDiss -1.904762e-01 4.543711e-01            0
      250   372_2426326      JaccardDiss  3.586544e-14 1.000000e+00            0
      251   372_2426326 MorisitaHornDiss  1.282051e-01 2.549703e-01            0
      252   372_2426326   BrayCurtisDiss  8.333333e-02 3.333333e-01            0
      253   372_2428505      JaccardDiss  1.000000e-01 2.254033e-01            0
      254   372_2428505 MorisitaHornDiss  2.508581e-02 7.694936e-01            0
      255   372_2428505   BrayCurtisDiss  9.429632e-02 1.914472e-01            0
      256   372_2414636      JaccardDiss -2.500000e-01 3.333333e-01            0
      257   372_2414636 MorisitaHornDiss -3.750938e-04 3.333333e-01            0
      258   372_2414636   BrayCurtisDiss -2.119152e-02 8.708549e-01            0
      259   402_3191117      JaccardDiss  7.922012e-03 7.069602e-01            0
      260   402_3191117 MorisitaHornDiss  3.164840e-02 4.885610e-01            0
      261   402_3191117   BrayCurtisDiss  3.474088e-02 1.813044e-01            0
      262   402_3191116      JaccardDiss  1.738722e-02 6.984476e-01            0
      263   402_3191116 MorisitaHornDiss  7.362842e-02 2.486620e-01            0
      264   402_3191116   BrayCurtisDiss  8.882266e-02 2.165989e-01            0
      265   402_3190385      JaccardDiss  2.981693e-02 2.943622e-01            0
      266   402_3190385 MorisitaHornDiss -2.881915e-02 6.771102e-01            0
      267   402_3190385   BrayCurtisDiss -7.802869e-03 7.842066e-01            0
      268   431_5118319      JaccardDiss  1.530055e-03 9.434680e-01            0
      269   431_5118319 MorisitaHornDiss  1.551769e-02 5.470765e-01            0
      270   431_5118319   BrayCurtisDiss  2.109164e-02 3.502909e-01            0
      271   431_5122694      JaccardDiss  2.369668e-03 8.896733e-01            0
      272   431_5122694 MorisitaHornDiss  7.915789e-03 7.295369e-01            0
      273   431_5122694   BrayCurtisDiss  8.068475e-03 7.248790e-01            0
      274   431_4765710      JaccardDiss  1.785714e-02 8.789623e-01            0
      275   431_4765710 MorisitaHornDiss  1.785714e-02 8.789623e-01            0
      276   431_4765710   BrayCurtisDiss  1.484751e-02 8.789623e-01            0
      277   431_5103014      JaccardDiss  1.875000e-01 1.210377e-01            0
      278   431_5103014 MorisitaHornDiss  4.508239e-01 2.674443e-01            0
      279   431_5103014   BrayCurtisDiss  3.370859e-01 2.649574e-01            0
      280   431_4749643      JaccardDiss -5.057252e-02 3.060910e-01            0
      281   431_4749643 MorisitaHornDiss -4.689204e-02 3.361584e-01            0
      282   431_4749643   BrayCurtisDiss -2.571985e-02 5.852256e-01            0
      283   431_4750373      JaccardDiss -9.638554e-02 3.790796e-01            0
      284   431_4750373 MorisitaHornDiss -1.274809e-02 9.327607e-01            0
      285   431_4750373   BrayCurtisDiss  2.683648e-02 8.074404e-01            0
      286   431_4751834      JaccardDiss  0.000000e+00          NaN           NA
      287   431_4751834 MorisitaHornDiss  0.000000e+00          NaN           NA
      288   431_4751834   BrayCurtisDiss  0.000000e+00          NaN           NA
      289   431_5120509      JaccardDiss  1.904495e-02 2.490409e-01            0
      290   431_5120509 MorisitaHornDiss  1.832535e-02 2.601099e-01            0
      291   431_5120509   BrayCurtisDiss  1.675077e-02 1.181839e-01            0
      292   431_5132911      JaccardDiss -8.521303e-03 7.031386e-01            0
      293   431_5132911 MorisitaHornDiss -5.572041e-03 8.590033e-01            0
      294   431_5132911   BrayCurtisDiss -1.157932e-02 4.313288e-01            0
      295   431_5133641      JaccardDiss -3.237179e-17 4.785132e-02            1
      296   431_5133641 MorisitaHornDiss  8.851463e-03 6.188153e-01            0
      297   431_5133641   BrayCurtisDiss  1.251574e-02 3.686561e-01            0
      298   431_5132912      JaccardDiss -2.913402e-02 3.987381e-01            0
      299   431_5132912 MorisitaHornDiss -8.938901e-02 6.067614e-02            0
      300   431_5132912   BrayCurtisDiss -2.860260e-02 1.011846e-01            0
      301   431_4745246      JaccardDiss  1.978585e-02 3.053528e-01            0
      302   431_4745246 MorisitaHornDiss  4.294717e-02 2.306354e-01            0
      303   431_4745246   BrayCurtisDiss  1.033551e-02 7.056978e-01            0
      304   431_5104466      JaccardDiss -2.699055e-02 5.609407e-01            0
      305   431_5104466 MorisitaHornDiss -8.304786e-03 5.609407e-01            0
      306   431_5104466   BrayCurtisDiss -1.349528e-02 5.609407e-01            0
      307   431_4764980      JaccardDiss -3.211009e-02 6.055959e-01            0
      308   431_4764980 MorisitaHornDiss -3.211009e-02 6.055959e-01            0
      309   431_4764980   BrayCurtisDiss -3.211009e-02 6.055959e-01            0
      310   431_5122695      JaccardDiss  3.816007e-03 8.749111e-01            0
      311   431_5122695 MorisitaHornDiss  4.633440e-03 8.874967e-01            0
      312   431_5122695   BrayCurtisDiss -1.646312e-03 9.045723e-01            0
      313   431_5100824      JaccardDiss -2.717391e-02 4.272377e-01            0
      314   431_5100824 MorisitaHornDiss -2.717391e-02 4.272377e-01            0
      315   431_5100824   BrayCurtisDiss -1.164596e-02 4.272377e-01            0
      316   431_5101551      JaccardDiss  0.000000e+00          NaN           NA
      317   431_5101551 MorisitaHornDiss  0.000000e+00          NaN           NA
      318   431_5101551   BrayCurtisDiss  0.000000e+00          NaN           NA
      319   431_5101552      JaccardDiss -2.873563e-03 9.474841e-01            0
      320   431_5101552 MorisitaHornDiss -1.086977e-02 8.566457e-01            0
      321   431_5101552   BrayCurtisDiss -3.372334e-02 3.616229e-01            0
      322   431_4764250      JaccardDiss  9.708738e-03 8.554490e-01            0
      323   431_4764250 MorisitaHornDiss  5.974608e-03 8.554490e-01            0
      324   431_4764250   BrayCurtisDiss -6.572069e-03 8.468009e-01            0
      325   431_4743784      JaccardDiss -7.325269e-02 1.023930e-01            0
      326   431_4743784 MorisitaHornDiss -9.066607e-02 6.403530e-02            0
      327   431_4743784   BrayCurtisDiss -5.268817e-02 1.480946e-01            0
      328   431_5122698      JaccardDiss -1.229508e-03 9.184334e-01            0
      329   431_5122698 MorisitaHornDiss  2.758457e-02 6.108412e-01            0
      330   431_5122698   BrayCurtisDiss  4.178806e-03 3.832419e-01            0
      331   431_5111033      JaccardDiss -1.223776e-02 2.864066e-01            0
      332   431_5111033 MorisitaHornDiss -4.780376e-02 2.864066e-01            0
      333   431_5111033   BrayCurtisDiss -6.118881e-03 2.864066e-01            0
      334   431_5123428      JaccardDiss  2.527646e-02 6.286891e-01            0
      335   431_5123428 MorisitaHornDiss  4.212744e-03 6.286891e-01            0
      336   431_5123428   BrayCurtisDiss  1.518229e-02 4.849486e-01            0
      337   431_5123427      JaccardDiss -1.777251e-02 2.953558e-01            0
      338   431_5123427 MorisitaHornDiss  4.982231e-02 8.549355e-02            0
      339   431_5123427   BrayCurtisDiss  1.311031e-02 4.761274e-01            0
      340   431_5120507      JaccardDiss  2.516905e-02 4.462810e-01            0
      341   431_5120507 MorisitaHornDiss  1.367202e-02 7.498086e-01            0
      342   431_5120507   BrayCurtisDiss  1.358259e-02 5.766758e-01            0
      343   431_4756925      JaccardDiss  3.593952e-17 3.365930e-02            1
      344   431_4756925 MorisitaHornDiss  3.593952e-17 3.365930e-02            1
      345   431_4756925   BrayCurtisDiss  3.593952e-17 3.365930e-02            1
      346   431_5124881      JaccardDiss -1.666667e-02 3.333333e-01            0
      347   431_5124881 MorisitaHornDiss -4.605263e-02 3.333333e-01            0
      348   431_5124881   BrayCurtisDiss -2.500000e-02 3.333333e-01            0
      349   431_5119779      JaccardDiss  1.052867e-02 6.308475e-01            0
      350   431_5119779 MorisitaHornDiss  1.762457e-02 4.481437e-01            0
      351   431_5119779   BrayCurtisDiss -5.811332e-03 7.578299e-01            0
      352   431_4748913      JaccardDiss  1.357597e-02 1.112522e-01            0
      353   431_4748913 MorisitaHornDiss  2.081908e-02 1.733288e-01            0
      354   431_4748913   BrayCurtisDiss  1.630692e-02 8.424828e-02            0
      355   431_4756217      JaccardDiss -2.096774e-02 3.504545e-01            0
      356   431_4756217 MorisitaHornDiss -1.352758e-03 3.504545e-01            0
      357   431_4756217   BrayCurtisDiss  4.659200e-03 8.403353e-01            0
      358   431_5102284      JaccardDiss -1.374113e-02 2.324975e-01            0
      359   431_5102284 MorisitaHornDiss -5.030337e-02 2.324975e-01            0
      360   431_5102284   BrayCurtisDiss -2.290189e-02 2.324975e-01            0
      361   431_5102282      JaccardDiss  1.020408e-02 9.175214e-01            0
      362   431_5102282 MorisitaHornDiss  1.020408e-02 9.175214e-01            0
      363   431_5102282   BrayCurtisDiss  1.020408e-02 9.175214e-01            0
      364   431_5113947      JaccardDiss  4.715302e-02 3.064287e-01            0
      365   431_5113947 MorisitaHornDiss  6.646452e-02 1.670043e-01            0
      366   431_5113947   BrayCurtisDiss  1.595294e-02 9.486274e-02            0
      367   431_4770803      JaccardDiss -1.453488e-02 7.509899e-01            0
      368   431_4770803 MorisitaHornDiss -2.066006e-02 7.509899e-01            0
      369   431_4770803   BrayCurtisDiss -2.051984e-02 7.509899e-01            0
      370   431_5101553      JaccardDiss -3.571429e-01 2.122956e-01            0
      371   431_5101553 MorisitaHornDiss -3.571429e-01 2.122956e-01            0
      372   431_5101553   BrayCurtisDiss -3.571429e-01 2.122956e-01            0
      373   431_5101555      JaccardDiss -3.180810e-17 6.761540e-02            0
      374   431_5101555 MorisitaHornDiss -3.180810e-17 6.761540e-02            0
      375   431_5101555   BrayCurtisDiss -3.180810e-17 6.761540e-02            0
      376   431_5124152      JaccardDiss -8.306320e-18 1.057260e-01            0
      377   431_5124152 MorisitaHornDiss -8.306320e-18 1.057260e-01            0
      378   431_5124152   BrayCurtisDiss -8.306320e-18 1.057260e-01            0
      379   431_5100825      JaccardDiss -2.689162e-02 4.982276e-01            0
      380   431_5100825 MorisitaHornDiss -1.041906e-02 7.778803e-01            0
      381   431_5100825   BrayCurtisDiss -6.450117e-03 7.322760e-01            0
      382   431_5121236      JaccardDiss  1.037676e-02 5.354179e-01            0
      383   431_5121236 MorisitaHornDiss  8.210141e-03 8.010751e-01            0
      384   431_5121236   BrayCurtisDiss -2.825779e-04 9.799277e-01            0
      385   431_4749644      JaccardDiss -1.678108e-02 1.492354e-01            0
      386   431_4749644 MorisitaHornDiss -5.034325e-03 1.492354e-01            0
      387   431_4749644   BrayCurtisDiss -1.258581e-02 1.492354e-01            0
      388   431_4750374      JaccardDiss  2.721088e-02 9.125790e-02            0
      389   431_4750374 MorisitaHornDiss  5.344484e-02 3.626222e-02            1
      390   431_4750374   BrayCurtisDiss  2.350328e-02 4.259185e-02            1
      391   431_4781744      JaccardDiss  1.428571e-01 5.456289e-01            0
      392   431_4781744 MorisitaHornDiss  1.428571e-01 5.456289e-01            0
      393   431_4781744   BrayCurtisDiss  1.428571e-01 5.456289e-01            0
      394   431_4749627      JaccardDiss -5.158730e-03 7.691392e-01            0
      395   431_4749627 MorisitaHornDiss -1.896394e-02 2.923237e-01            0
      396   431_4749627   BrayCurtisDiss -1.604862e-02 3.163369e-01            0
      397   431_5123423      JaccardDiss -7.568807e-03 4.511750e-01            0
      398   431_5123423 MorisitaHornDiss -4.333261e-03 7.795259e-01            0
      399   431_5123423   BrayCurtisDiss -3.943870e-03 9.275550e-02            0
      400   431_4740155      JaccardDiss  2.991453e-02 1.146170e-02            1
      401   431_4740155 MorisitaHornDiss  1.424501e-02 1.146170e-02            1
      402   431_4740155   BrayCurtisDiss  1.994302e-02 1.146170e-02            1
      403   431_5120508      JaccardDiss -2.424242e-02 4.340886e-01            0
      404   431_5120508 MorisitaHornDiss -9.678484e-03 7.654816e-01            0
      405   431_5120508   BrayCurtisDiss -4.531639e-03 6.150648e-01            0
      406   431_5116133      JaccardDiss  9.770115e-02 2.757757e-01            0
      407   431_5116133 MorisitaHornDiss  1.053640e-01 2.531337e-01            0
      408   431_5116133   BrayCurtisDiss  5.514049e-02 1.764026e-01            0
      409   431_4743055      JaccardDiss -5.665722e-02 2.128846e-01            0
      410   431_4743055 MorisitaHornDiss -5.443140e-02 2.394599e-01            0
      411   431_4743055   BrayCurtisDiss -2.322946e-02 3.590575e-01            0
      412   431_4764249      JaccardDiss  1.785714e-01 2.122956e-01            0
      413   431_4764249 MorisitaHornDiss  1.190476e-01 2.122956e-01            0
      414   431_4764249   BrayCurtisDiss  2.142857e-01 2.122956e-01            0
      415   431_4751103      JaccardDiss  2.222222e-02 7.018576e-01            0
      416   431_4751103 MorisitaHornDiss  2.962963e-02 7.018576e-01            0
      417   431_4751103   BrayCurtisDiss  2.777778e-02 6.868879e-01            0
      418   431_4743804      JaccardDiss -2.659111e-02 2.479405e-01            0
      419   431_4743804 MorisitaHornDiss -2.659111e-02 2.479405e-01            0
      420   431_4743804   BrayCurtisDiss -1.519492e-02 2.479405e-01            0
      421   431_5125612      JaccardDiss  8.260447e-03 6.964465e-01            0
      422   431_5125612 MorisitaHornDiss -2.858899e-02 6.419681e-01            0
      423   431_5125612   BrayCurtisDiss -2.315258e-02 6.484180e-01            0
      424   431_4758387      JaccardDiss  8.333333e-02 5.859621e-14            1
      425   431_4758387 MorisitaHornDiss -9.970180e-02 4.154515e-01            0
      426   431_4758387   BrayCurtisDiss -1.312460e-01 3.549893e-01            0
      427   431_4756196      JaccardDiss -3.922739e-16 1.000000e+00            0
      428   431_4756196 MorisitaHornDiss -3.922739e-16 1.000000e+00            0
      429   431_4756196   BrayCurtisDiss -4.972173e-03 9.323845e-01            0
      430   431_5113218      JaccardDiss  2.285714e-02 5.749521e-01            0
      431   431_5113218 MorisitaHornDiss -2.750849e-02 6.326868e-01            0
      432   431_5113218   BrayCurtisDiss -1.074114e-02 8.269213e-01            0
      433   431_4735777      JaccardDiss -2.714441e-03 8.953348e-01            0
      434   431_4735777 MorisitaHornDiss  5.321864e-03 8.340786e-01            0
      435   431_4735777   BrayCurtisDiss -9.623927e-04 9.318067e-01            0
      436   431_5101554      JaccardDiss  3.600000e-02 2.933773e-01            0
      437   431_5101554 MorisitaHornDiss  3.600000e-02 2.933773e-01            0
      438   431_5101554   BrayCurtisDiss  3.600000e-02 2.933773e-01            0
      439   431_4752549      JaccardDiss  5.734625e-03 7.278231e-01            0
      440   431_4752549 MorisitaHornDiss  3.496079e-02 8.426927e-02            0
      441   431_4752549   BrayCurtisDiss -8.466448e-03 3.733224e-01            0
      442   431_4755487      JaccardDiss -1.494446e-17 5.672414e-01            0
      443   431_4755487 MorisitaHornDiss -1.494446e-17 5.672414e-01            0
      444   431_4755487   BrayCurtisDiss -1.494446e-17 5.672414e-01            0
      445   431_4754005      JaccardDiss -8.333333e-02 2.339080e-01            0
      446   431_4754005 MorisitaHornDiss -3.734756e-02 4.482059e-01            0
      447   431_4754005   BrayCurtisDiss -1.111111e-02 8.072720e-01            0
      448   431_4749628      JaccardDiss  1.344910e-02 5.140922e-01            0
      449   431_4749628 MorisitaHornDiss  2.931124e-02 3.197953e-01            0
      450   431_4749628   BrayCurtisDiss  1.045786e-02 6.386333e-01            0
      451   431_4781020      JaccardDiss -3.846154e-02 4.877543e-01            0
      452   431_4781020 MorisitaHornDiss -1.357466e-02 4.877543e-01            0
      453   431_4781020   BrayCurtisDiss  2.838338e-03 9.072507e-01            0
      454   431_4744516      JaccardDiss  5.623722e-03 7.206802e-01            0
      455   431_4744516 MorisitaHornDiss  7.873211e-04 7.206802e-01            0
      456   431_4744516   BrayCurtisDiss  2.829472e-03 8.381048e-01            0
      457   431_4781014      JaccardDiss  3.448276e-03 9.169545e-01            0
      458   431_4781014 MorisitaHornDiss  3.629764e-03 9.169545e-01            0
      459   431_4781014   BrayCurtisDiss  7.389163e-04 9.834642e-01            0
      460   431_4781021      JaccardDiss  1.889339e-02 6.057312e-01            0
      461   431_4781021 MorisitaHornDiss  9.957326e-04 6.057312e-01            0
      462   431_4781021   BrayCurtisDiss  5.167464e-02 1.206593e-01            0
      463   431_4737966      JaccardDiss -7.142857e-02 4.543711e-01            0
      464   431_4737966 MorisitaHornDiss -7.978989e-03 4.543711e-01            0
      465   431_4737966   BrayCurtisDiss -2.721088e-02 4.543711e-01            0
      466   431_4764251      JaccardDiss  4.652386e-17 9.911403e-02            0
      467   431_4764251 MorisitaHornDiss  4.652386e-17 9.911403e-02            0
      468   431_4764251   BrayCurtisDiss  4.652386e-17 9.911403e-02            0
      469   431_4781015      JaccardDiss  2.027027e-02 7.534015e-01            0
      470   431_4781015 MorisitaHornDiss  1.470458e-05 9.998539e-01            0
      471   431_4781015   BrayCurtisDiss  3.229501e-02 6.376979e-01            0
      472   431_5113944      JaccardDiss  1.666667e-02 6.617281e-01            0
      473   431_5113944 MorisitaHornDiss  8.263076e-03 6.712213e-01            0
      474   431_5113944   BrayCurtisDiss -1.404743e-04 9.886057e-01            0
      475   431_5111762      JaccardDiss -2.409639e-02 8.447699e-01            0
      476   431_5111762 MorisitaHornDiss  5.793035e-02 6.925092e-01            0
      477   431_5111762   BrayCurtisDiss -2.409639e-02 7.412832e-01            0
      478   431_5115406      JaccardDiss  0.000000e+00          NaN           NA
      479   431_5115406 MorisitaHornDiss -1.696386e-02 8.067647e-01            0
      480   431_5115406   BrayCurtisDiss  2.916667e-02 8.666773e-01            0
      481   431_4751102      JaccardDiss  1.154591e-13 1.000000e+00            0
      482   431_4751102 MorisitaHornDiss  1.154591e-13 1.000000e+00            0
      483   431_4751102   BrayCurtisDiss  7.678092e-14 1.000000e+00            0
      484   431_4736507      JaccardDiss -4.674797e-03 6.442188e-01            0
      485   431_4736507 MorisitaHornDiss -2.908440e-02 2.744028e-01            0
      486   431_4736507   BrayCurtisDiss -1.178862e-02 4.517647e-01            0
      487   431_4782480      JaccardDiss  2.040816e-02 9.087421e-01            0
      488   431_4782480 MorisitaHornDiss  2.040816e-02 9.087421e-01            0
      489   431_4782480   BrayCurtisDiss  1.700680e-02 9.087421e-01            0
      490   431_4776662      JaccardDiss -5.067568e-02 2.263248e-01            0
      491   431_4776662 MorisitaHornDiss  5.277744e-03 8.529887e-01            0
      492   431_4776662   BrayCurtisDiss  1.741424e-02 5.314681e-01            0
      493   431_4752550      JaccardDiss  6.892231e-03 8.556151e-01            0
      494   431_4752550 MorisitaHornDiss -3.529695e-03 9.318437e-01            0
      495   431_4752550   BrayCurtisDiss  7.375760e-03 6.446051e-01            0
      496   431_5109574      JaccardDiss -1.762821e-02 6.087920e-01            0
      497   431_5109574 MorisitaHornDiss -1.855009e-02 7.333133e-01            0
      498   431_5109574   BrayCurtisDiss -1.222651e-02 7.956942e-01            0
      499   431_4745264      JaccardDiss  9.900990e-03 8.625299e-01            0
      500   431_4745264 MorisitaHornDiss  9.900990e-03 8.625299e-01            0
      501   431_4745264   BrayCurtisDiss -9.900990e-04 9.779476e-01            0
      502   431_4740146      JaccardDiss -2.244898e-02 4.245912e-01            0
      503   431_4740146 MorisitaHornDiss -4.767774e-02 4.245912e-01            0
      504   431_4740146   BrayCurtisDiss -6.413994e-03 4.245912e-01            0
      505   431_4754011      JaccardDiss -1.159196e-02 3.819035e-01            0
      506   431_4754011 MorisitaHornDiss  5.277155e-03 5.535642e-01            0
      507   431_4754011   BrayCurtisDiss -1.962926e-03 8.985401e-01            0
      508   431_4754757      JaccardDiss -1.173184e-01 9.378311e-02            0
      509   431_4754757 MorisitaHornDiss -1.173184e-01 9.378311e-02            0
      510   431_4754757   BrayCurtisDiss -5.865922e-02 9.378311e-02            0
      511   431_4750359      JaccardDiss  1.056015e-02 6.748901e-01            0
      512   431_4750359 MorisitaHornDiss  2.777134e-03 9.079413e-01            0
      513   431_4750359   BrayCurtisDiss  1.002852e-02 7.049930e-01            0
      514   431_4745247      JaccardDiss  2.135231e-02 4.175636e-01            0
      515   431_4745247 MorisitaHornDiss  2.591743e-02 2.820413e-01            0
      516   431_4745247   BrayCurtisDiss  2.251740e-02 2.476671e-01            0
      517   431_5094987      JaccardDiss -2.000000e-01 2.254033e-01            0
      518   431_5094987 MorisitaHornDiss -1.761642e-02 2.254033e-01            0
      519   431_5094987   BrayCurtisDiss -4.660087e-02 4.773386e-01            0
      520   431_4752551      JaccardDiss -5.595813e-02 2.216293e-02            1
      521   431_4752551 MorisitaHornDiss -4.586787e-02 2.287348e-01            0
      522   431_4752551   BrayCurtisDiss -8.501333e-04 9.517153e-01            0
      523   431_4753280      JaccardDiss -2.076962e-02 3.634852e-01            0
      524   431_4753280 MorisitaHornDiss -2.277218e-03 9.172943e-01            0
      525   431_4753280   BrayCurtisDiss  7.247421e-03 6.595105e-01            0
      526   431_4751821      JaccardDiss  1.564380e-02 5.927123e-01            0
      527   431_4751821 MorisitaHornDiss  2.371961e-02 1.665767e-01            0
      528   431_4751821   BrayCurtisDiss  6.391916e-03 7.149820e-01            0
      529   431_4743785      JaccardDiss -6.329114e-03 6.083737e-01            0
      530   431_4743785 MorisitaHornDiss -6.329114e-03 6.083737e-01            0
      531   431_4743785   BrayCurtisDiss  1.290430e-02 2.586651e-01            0
      532   431_4756195      JaccardDiss  1.759324e-02 1.848276e-04            1
      533   431_4756195 MorisitaHornDiss  3.085649e-02 2.718768e-03            1
      534   431_4756195   BrayCurtisDiss  2.098985e-02 8.599015e-03            1
      535   431_4754008      JaccardDiss  1.960704e-14 1.000000e+00            0
      536   431_4754008 MorisitaHornDiss  1.510773e-14 1.000000e+00            0
      537   431_4754008   BrayCurtisDiss -2.539683e-02 8.566661e-01            0
      538   431_4753279      JaccardDiss -7.456140e-02 2.350639e-01            0
      539   431_4753279 MorisitaHornDiss -7.456140e-02 2.350639e-01            0
      540   431_4753279   BrayCurtisDiss -4.413377e-02 4.426691e-01            0
      541   431_4753278      JaccardDiss  7.231405e-03 8.988265e-01            0
      542   431_4753278 MorisitaHornDiss  7.829491e-03 8.897914e-01            0
      543   431_4753278   BrayCurtisDiss  1.584022e-02 7.407878e-01            0
      544   431_4754006      JaccardDiss -7.142857e-02 8.789623e-01            0
      545   431_4754006 MorisitaHornDiss -7.142857e-02 8.789623e-01            0
      546   431_4754006   BrayCurtisDiss -1.020408e-02 8.789623e-01            0
      547   437_2075128      JaccardDiss  1.109139e-02 7.481094e-01            0
      548   437_2075128 MorisitaHornDiss  3.186167e-02 4.781420e-01            0
      549   437_2075128   BrayCurtisDiss  2.186074e-02 4.764461e-01            0
      550   437_2077319      JaccardDiss -4.291412e-02 2.737488e-03            1
      551   437_2077319 MorisitaHornDiss -8.161581e-02 1.088658e-01            0
      552   437_2077319   BrayCurtisDiss -5.073505e-02 5.308646e-02            0
      553   437_2076590      JaccardDiss -4.229259e-02 6.689059e-02            0
      554   437_2076590 MorisitaHornDiss -2.409339e-02 6.665780e-01            0
      555   437_2076590   BrayCurtisDiss -4.014855e-02 4.853487e-02            1
      556   437_2078777      JaccardDiss -2.037887e-02 4.845053e-01            0
      557   437_2078777 MorisitaHornDiss -6.490825e-02 6.975278e-02            0
      558   437_2078777   BrayCurtisDiss -5.166463e-02 8.745485e-02            0
      559   437_2076589      JaccardDiss -3.754831e-03 8.460524e-01            0
      560   437_2076589 MorisitaHornDiss -3.830460e-02 3.452664e-01            0
      561   437_2076589   BrayCurtisDiss -1.734332e-02 5.649979e-01            0
      562   437_2075860      JaccardDiss  3.065291e-02 4.329568e-01            0
      563   437_2075860 MorisitaHornDiss  4.435453e-02 5.506232e-01            0
      564   437_2075860   BrayCurtisDiss  4.408651e-02 4.514822e-01            0
      565   437_2074400      JaccardDiss  1.391352e-02 5.952543e-01            0
      566   437_2074400 MorisitaHornDiss  1.591072e-02 6.069530e-01            0
      567   437_2074400   BrayCurtisDiss  1.689664e-02 5.029739e-01            0
      568   437_2074399      JaccardDiss  3.065634e-02 7.902396e-02            0
      569   437_2074399 MorisitaHornDiss -1.487758e-03 9.702324e-01            0
      570   437_2074399   BrayCurtisDiss  3.607616e-02 4.608442e-01            0
      571    466_544469      JaccardDiss -1.512442e-03 6.160680e-01            0
      572    466_544469 MorisitaHornDiss -4.309642e-03 8.121593e-01            0
      573    466_544469   BrayCurtisDiss  6.016561e-03 6.117067e-01            0
      574    466_541561      JaccardDiss -6.489946e-03 3.497086e-01            0
      575    466_541561 MorisitaHornDiss  3.315981e-03 7.960080e-01            0
      576    466_541561   BrayCurtisDiss  6.691036e-03 5.539787e-01            0
      577    466_544468      JaccardDiss -8.117180e-03 5.908839e-02            0
      578    466_544468 MorisitaHornDiss -8.725161e-03 3.561217e-01            0
      579    466_544468   BrayCurtisDiss -1.290663e-02 8.174387e-02            0
      580    466_541560      JaccardDiss  4.715934e-03 2.894155e-01            0
      581    466_541560 MorisitaHornDiss -8.863886e-03 2.615703e-01            0
      582    466_541560   BrayCurtisDiss -2.170892e-02 5.403173e-03            1
      583    466_544470      JaccardDiss -2.603986e-03 3.545939e-01            0
      584    466_544470 MorisitaHornDiss -1.367255e-02 1.049397e-01            0
      585    466_544470   BrayCurtisDiss -1.696957e-03 4.883741e-01            0
      586    466_540104      JaccardDiss -2.239579e-03 6.352422e-01            0
      587    466_540104 MorisitaHornDiss  1.574410e-02 3.492716e-01            0
      588    466_540104   BrayCurtisDiss  1.337825e-02 1.979035e-01            0
      589    466_548115      JaccardDiss  5.897192e-03 2.904526e-02            1
      590    466_548115 MorisitaHornDiss -1.087533e-03 8.995499e-01            0
      591    466_548115   BrayCurtisDiss -7.764468e-04 9.054659e-01            0
      592    466_560514      JaccardDiss -2.022641e-03 6.633063e-01            0
      593    466_560514 MorisitaHornDiss  5.738720e-03 5.443988e-01            0
      594    466_560514   BrayCurtisDiss -3.887308e-03 5.357890e-01            0
      595    466_543001      JaccardDiss -4.494565e-03 5.734545e-01            0
      596    466_543001 MorisitaHornDiss -1.496251e-03 9.394740e-01            0
      597    466_543001   BrayCurtisDiss  7.667397e-03 5.613557e-01            0
      598    466_569257      JaccardDiss  1.828384e-03 7.343622e-01            0
      599    466_569257 MorisitaHornDiss  2.846616e-02 2.096249e-02            1
      600    466_569257   BrayCurtisDiss  6.788543e-03 2.450914e-01            0
      601    466_540834      JaccardDiss  5.297456e-03 3.198837e-01            0
      602    466_540834 MorisitaHornDiss -3.541481e-03 4.981303e-01            0
      603    466_540834   BrayCurtisDiss -1.728526e-02 3.032572e-01            0
      604    466_540833      JaccardDiss -9.086712e-03 3.132445e-01            0
      605    466_540833 MorisitaHornDiss  1.533477e-02 7.404464e-01            0
      606    466_540833   BrayCurtisDiss  2.116950e-02 5.628495e-02            0
      607    466_543011      JaccardDiss  1.252596e-02 2.060633e-03            1
      608    466_543011 MorisitaHornDiss  1.384563e-04 9.876139e-01            0
      609    466_543011   BrayCurtisDiss  1.438880e-02 1.827553e-01            0
      610    466_541549      JaccardDiss  8.152129e-04 8.709972e-01            0
      611    466_541549 MorisitaHornDiss  4.280282e-03 5.883415e-01            0
      612    466_541549   BrayCurtisDiss  4.152148e-03 7.414261e-01            0
      613    466_545198      JaccardDiss  7.755770e-04 8.525467e-01            0
      614    466_545198 MorisitaHornDiss  1.270914e-02 1.800106e-01            0
      615    466_545198   BrayCurtisDiss -1.706974e-03 8.294038e-01            0
      616    466_559051      JaccardDiss  1.043902e-02 1.438829e-02            1
      617    466_559051 MorisitaHornDiss  2.846961e-02 3.459161e-02            1
      618    466_559051   BrayCurtisDiss  1.959210e-02 9.203157e-02            0
      619    466_543738      JaccardDiss -3.632479e-02 6.821940e-01            0
      620    466_543738 MorisitaHornDiss -2.997645e-02 1.838469e-01            0
      621    466_543738   BrayCurtisDiss -1.767765e-02 3.196719e-01            0
      622    466_547388      JaccardDiss  1.891739e-03 6.461155e-01            0
      623    466_547388 MorisitaHornDiss  2.604275e-02 5.450132e-03            1
      624    466_547388   BrayCurtisDiss  2.956258e-02 2.846021e-03            1
      625    466_565614      JaccardDiss  9.295478e-03 9.670063e-03            1
      626    466_565614 MorisitaHornDiss  3.607099e-02 2.801415e-02            1
      627    466_565614   BrayCurtisDiss  1.686321e-02 6.455007e-02            0
      628    466_562698      JaccardDiss -1.260504e-02 5.183790e-01            0
      629    466_562698 MorisitaHornDiss  1.355866e-02 9.014667e-01            0
      630    466_562698   BrayCurtisDiss  2.814853e-02 7.665241e-01            0
      631    466_559779      JaccardDiss  1.329322e-02 1.823053e-01            0
      632    466_559779 MorisitaHornDiss -4.637285e-03 8.972557e-01            0
      633    466_559779   BrayCurtisDiss  2.449535e-02 4.302307e-01            0
      634    466_560509      JaccardDiss  6.907060e-03 1.857900e-02            1
      635    466_560509 MorisitaHornDiss  2.280302e-02 5.536723e-02            0
      636    466_560509   BrayCurtisDiss  6.294058e-03 4.205205e-01            0
      637    466_545919      JaccardDiss  4.638583e-04 9.119537e-01            0
      638    466_545919 MorisitaHornDiss -1.337118e-02 2.786777e-01            0
      639    466_545919   BrayCurtisDiss -1.400303e-02 1.740609e-01            0
      640    466_545912      JaccardDiss  3.375765e-04 9.336572e-01            0
      641    466_545912 MorisitaHornDiss  6.084598e-03 6.313979e-01            0
      642    466_545912   BrayCurtisDiss  4.083892e-03 6.226745e-01            0
      643    466_548798      JaccardDiss -8.365072e-04 7.031931e-01            0
      644    466_548798 MorisitaHornDiss  1.551752e-02 1.017859e-01            0
      645    466_548798   BrayCurtisDiss  1.286336e-02 3.969900e-02            1
      646    466_552442      JaccardDiss  1.385264e-03 6.238744e-01            0
      647    466_552442 MorisitaHornDiss  8.603793e-03 1.920172e-01            0
      648    466_552442   BrayCurtisDiss  2.948281e-03 6.744741e-01            0
      649    466_553900      JaccardDiss -3.124440e-02 4.749040e-01            0
      650    466_553900 MorisitaHornDiss  6.643853e-04 9.838291e-01            0
      651    466_553900   BrayCurtisDiss  2.324692e-02 2.953350e-01            0
      652    466_555359      JaccardDiss -2.171472e-03 6.582222e-01            0
      653    466_555359 MorisitaHornDiss  2.192650e-02 1.102365e-01            0
      654    466_555359   BrayCurtisDiss  8.486308e-04 9.172673e-01            0
      655    466_559004      JaccardDiss  7.479820e-03 1.149301e-01            0
      656    466_559004 MorisitaHornDiss -2.214421e-03 7.702848e-01            0
      657    466_559004   BrayCurtisDiss  6.870292e-03 4.642040e-01            0
      658    466_553901      JaccardDiss  1.216544e-04 9.800178e-01            0
      659    466_553901 MorisitaHornDiss  1.520861e-03 8.410789e-01            0
      660    466_553901   BrayCurtisDiss  1.018148e-02 1.591485e-01            0
      661    466_552446      JaccardDiss  1.514882e-03 7.255683e-01            0
      662    466_552446 MorisitaHornDiss  4.945741e-03 1.302745e-02            1
      663    466_552446   BrayCurtisDiss  2.114409e-02 8.411134e-03            1
      664    466_553171      JaccardDiss -1.730493e-03 8.302622e-01            0
      665    466_553171 MorisitaHornDiss  9.583906e-03 5.132019e-02            0
      666    466_553171   BrayCurtisDiss  1.915725e-02 6.672718e-03            1
      667    466_553175      JaccardDiss  3.957228e-03 3.558802e-01            0
      668    466_553175 MorisitaHornDiss  6.387080e-03 2.053387e-01            0
      669    466_553175   BrayCurtisDiss  1.340428e-03 8.998452e-01            0
      670    466_556090      JaccardDiss  2.817695e-04 9.755086e-01            0
      671    466_556090 MorisitaHornDiss  1.099562e-02 5.975639e-01            0
      672    466_556090   BrayCurtisDiss  1.659003e-02 4.629161e-01            0
      673    466_557547      JaccardDiss  3.359991e-03 1.927679e-01            0
      674    466_557547 MorisitaHornDiss -3.989340e-03 2.151597e-01            0
      675    466_557547   BrayCurtisDiss -1.810059e-02 1.722502e-02            1
      676    466_554630      JaccardDiss  5.396128e-03 9.830398e-02            0
      677    466_554630 MorisitaHornDiss  8.602763e-04 8.968009e-01            0
      678    466_554630   BrayCurtisDiss  2.032099e-02 2.453125e-02            1
      679    466_553902      JaccardDiss -5.453148e-04 9.462428e-01            0
      680    466_553902 MorisitaHornDiss  5.355243e-03 7.672361e-01            0
      681    466_553902   BrayCurtisDiss  1.496209e-02 2.430922e-01            0
      682    466_549529      JaccardDiss -7.116313e-04 8.580827e-01            0
      683    466_549529 MorisitaHornDiss  1.833993e-02 3.392587e-01            0
      684    466_549529   BrayCurtisDiss  3.112673e-02 1.055081e-01            0
      685    466_551714      JaccardDiss  1.202739e-02 1.000628e-02            1
      686    466_551714 MorisitaHornDiss  1.047881e-02 4.672208e-01            0
      687    466_551714   BrayCurtisDiss -7.471561e-04 9.583094e-01            0
      688    466_550254      JaccardDiss  1.055511e-02 4.660809e-02            1
      689    466_550254 MorisitaHornDiss  2.721246e-02 5.773279e-02            0
      690    466_550254   BrayCurtisDiss  1.883216e-02 5.996467e-02            0
      691    466_549527      JaccardDiss  7.491537e-03 1.325730e-01            0
      692    466_549527 MorisitaHornDiss  2.867447e-02 9.698290e-03            1
      693    466_549527   BrayCurtisDiss  1.097122e-02 1.865982e-01            0
      694    466_553903      JaccardDiss  2.137322e-03 7.077980e-01            0
      695    466_553903 MorisitaHornDiss  1.935134e-02 1.489289e-01            0
      696    466_553903   BrayCurtisDiss  1.478354e-02 1.042610e-01            0
      697    466_550258      JaccardDiss -1.992589e-02 2.388018e-02            1
      698    466_550258 MorisitaHornDiss  1.281114e-03 8.963971e-01            0
      699    466_550258   BrayCurtisDiss  7.288575e-03 4.938229e-01            0
      700    466_556089      JaccardDiss  5.125226e-03 1.130923e-01            0
      701    466_556089 MorisitaHornDiss  9.580739e-03 2.985191e-01            0
      702    466_556089   BrayCurtisDiss  1.204206e-02 1.426952e-01            0
      703    466_556091      JaccardDiss  5.901143e-03 2.479465e-01            0
      704    466_556091 MorisitaHornDiss  1.220221e-02 1.246590e-02            1
      705    466_556091   BrayCurtisDiss  1.707429e-02 3.543166e-02            1
      706    466_556092      JaccardDiss -2.011447e-03 4.133601e-01            0
      707    466_556092 MorisitaHornDiss  5.426248e-03 6.069266e-01            0
      708    466_556092   BrayCurtisDiss  4.390515e-03 5.793324e-01            0
      709    466_553904      JaccardDiss  1.057410e-02 2.122883e-02            1
      710    466_553904 MorisitaHornDiss  1.070956e-02 1.858362e-01            0
      711    466_553904   BrayCurtisDiss  1.542521e-02 5.739812e-02            0
      712    466_552445      JaccardDiss -2.157685e-03 6.547536e-01            0
      713    466_552445 MorisitaHornDiss  1.317972e-02 2.679789e-01            0
      714    466_552445   BrayCurtisDiss  1.209866e-02 3.194122e-01            0
      715    466_554632      JaccardDiss -2.310159e-03 6.962859e-01            0
      716    466_554632 MorisitaHornDiss -1.325635e-04 9.859277e-01            0
      717    466_554632   BrayCurtisDiss  1.523092e-02 1.727739e-01            0
      718    466_556818      JaccardDiss  1.248751e-02 8.244189e-01            0
      719    466_556818 MorisitaHornDiss  1.208313e-02 4.273852e-01            0
      720    466_556818   BrayCurtisDiss -7.730367e-03 8.947874e-01            0
      721    466_556088      JaccardDiss  1.153414e-03 8.430250e-01            0
      722    466_556088 MorisitaHornDiss  1.122291e-02 4.137602e-01            0
      723    466_556088   BrayCurtisDiss -2.874528e-03 6.329367e-01            0
      724    466_550255      JaccardDiss  6.031400e-03 1.996293e-01            0
      725    466_550255 MorisitaHornDiss  1.449974e-02 5.139859e-01            0
      726    466_550255   BrayCurtisDiss  8.777206e-03 4.822016e-01            0
      727    466_553905      JaccardDiss -1.393930e-03 7.521240e-01            0
      728    466_553905 MorisitaHornDiss  1.808516e-02 1.664412e-01            0
      729    466_553905   BrayCurtisDiss  2.698875e-02 1.368067e-02            1
      730    466_555362      JaccardDiss  1.703216e-03 6.155233e-01            0
      731    466_555362 MorisitaHornDiss  1.433309e-03 7.827039e-01            0
      732    466_555362   BrayCurtisDiss -9.301278e-03 4.017582e-01            0
      733    466_559733      JaccardDiss  3.234121e-03 2.910111e-01            0
      734    466_559733 MorisitaHornDiss -6.442579e-03 3.196405e-01            0
      735    466_559733   BrayCurtisDiss -9.865663e-03 3.089812e-01            0
      736    466_557548      JaccardDiss  3.522774e-04 9.082318e-01            0
      737    466_557548 MorisitaHornDiss  1.594320e-03 5.774118e-01            0
      738    466_557548   BrayCurtisDiss  4.797609e-03 5.842554e-01            0
      739    466_550256      JaccardDiss  2.021594e-03 6.104229e-01            0
      740    466_550256 MorisitaHornDiss  6.007255e-03 3.970761e-01            0
      741    466_550256   BrayCurtisDiss -4.822021e-04 9.524963e-01            0
      742    466_554634      JaccardDiss  1.138361e-02 4.727254e-02            1
      743    466_554634 MorisitaHornDiss  8.161581e-04 7.308047e-01            0
      744    466_554634   BrayCurtisDiss  2.058460e-03 8.910355e-01            0
      745    466_554631      JaccardDiss  2.527695e-04 9.805965e-01            0
      746    466_554631 MorisitaHornDiss  1.141034e-02 2.702065e-01            0
      747    466_554631   BrayCurtisDiss  1.660416e-02 1.185432e-01            0
      748    466_553176      JaccardDiss -9.370009e-03 3.589723e-01            0
      749    466_553176 MorisitaHornDiss  1.471769e-04 9.841385e-01            0
      750    466_553176   BrayCurtisDiss  5.414377e-03 6.206622e-01            0
      751    466_556819      JaccardDiss  6.152205e-04 8.629489e-01            0
      752    466_556819 MorisitaHornDiss  1.442064e-02 1.625683e-01            0
      753    466_556819   BrayCurtisDiss -5.405626e-03 6.018008e-01            0
      754    466_550984      JaccardDiss  1.518891e-02 2.973861e-02            1
      755    466_550984 MorisitaHornDiss  2.135293e-02 1.622147e-01            0
      756    466_550984   BrayCurtisDiss  1.279772e-02 8.797353e-02            0
      757    466_561188      JaccardDiss -7.695578e-03 3.778347e-01            0
      758    466_561188 MorisitaHornDiss -7.365880e-03 5.746112e-02            0
      759    466_561188   BrayCurtisDiss  2.047730e-02 4.620731e-01            0
      760    466_558274      JaccardDiss  9.578570e-03 4.473053e-02            1
      761    466_558274 MorisitaHornDiss  9.128740e-03 6.376283e-01            0
      762    466_558274   BrayCurtisDiss  3.898585e-03 7.428311e-01            0
      763    466_555361      JaccardDiss -6.721434e-04 9.341128e-01            0
      764    466_555361 MorisitaHornDiss  6.715213e-03 2.954113e-01            0
      765    466_555361   BrayCurtisDiss  1.939543e-02 2.225888e-01            0
      766    466_553172      JaccardDiss -4.914818e-03 3.912626e-01            0
      767    466_553172 MorisitaHornDiss  1.058579e-02 3.415829e-01            0
      768    466_553172   BrayCurtisDiss  2.190443e-02 5.680784e-02            0
      769    466_556087      JaccardDiss  1.332659e-03 8.942226e-01            0
      770    466_556087 MorisitaHornDiss  1.471163e-02 4.678657e-01            0
      771    466_556087   BrayCurtisDiss  6.821110e-03 6.383187e-01            0
      772    466_548799      JaccardDiss  9.990010e-03 4.803617e-01            0
      773    466_548799 MorisitaHornDiss  1.480880e-02 7.049439e-01            0
      774    466_548799   BrayCurtisDiss  3.433170e-02 8.440933e-02            0
      775    466_550257      JaccardDiss  3.382762e-03 5.787308e-01            0
      776    466_550257 MorisitaHornDiss -3.201787e-03 7.128340e-01            0
      777    466_550257   BrayCurtisDiss  2.397490e-03 6.548802e-01            0
      778    466_559005      JaccardDiss -9.064604e-03 3.088387e-01            0
      779    466_559005 MorisitaHornDiss -3.533618e-03 8.281250e-01            0
      780    466_559005   BrayCurtisDiss  6.275228e-03 7.005021e-01            0
      781    466_559734      JaccardDiss  1.285104e-02 1.271089e-01            0
      782    466_559734 MorisitaHornDiss -3.744338e-03 7.756164e-01            0
      783    466_559734   BrayCurtisDiss -2.356283e-04 9.807854e-01            0
      784    466_551717      JaccardDiss -4.267274e-03 1.802409e-01            0
      785    466_551717 MorisitaHornDiss -5.617110e-04 9.673044e-01            0
      786    466_551717   BrayCurtisDiss  1.776341e-02 2.195195e-01            0
      787    466_553174      JaccardDiss  3.139492e-03 5.480750e-01            0
      788    466_553174 MorisitaHornDiss  1.262483e-02 1.585783e-01            0
      789    466_553174   BrayCurtisDiss -2.153794e-03 8.386864e-01            0
      790    466_559003      JaccardDiss  1.303056e-03 8.684888e-01            0
      791    466_559003 MorisitaHornDiss -8.605972e-03 6.822010e-01            0
      792    466_559003   BrayCurtisDiss  1.600693e-03 9.163705e-01            0
      793    466_550988      JaccardDiss  7.708666e-03 5.849938e-01            0
      794    466_550988 MorisitaHornDiss -4.519968e-02 3.744498e-01            0
      795    466_550988   BrayCurtisDiss -2.425233e-02 4.921683e-01            0
      796    466_556086      JaccardDiss -3.804168e-03 8.119873e-01            0
      797    466_556086 MorisitaHornDiss -9.646052e-03 4.620912e-01            0
      798    466_556086   BrayCurtisDiss -1.293800e-02 6.250721e-01            0
      799    466_560463      JaccardDiss  4.486901e-03 6.943218e-01            0
      800    466_560463 MorisitaHornDiss  1.054468e-02 5.817914e-01            0
      801    466_560463   BrayCurtisDiss  2.354356e-02 5.962528e-02            0
      802    466_549526      JaccardDiss  2.987255e-03 7.233625e-01            0
      803    466_549526 MorisitaHornDiss  1.706265e-02 3.389955e-01            0
      804    466_549526   BrayCurtisDiss  1.468188e-02 1.620708e-01            0
      805    466_550259      JaccardDiss -2.894328e-03 7.859736e-01            0
      806    466_550259 MorisitaHornDiss  6.014814e-03 7.381102e-01            0
      807    466_550259   BrayCurtisDiss  1.206458e-03 9.298621e-01            0
      808    466_542290      JaccardDiss  8.606630e-03 5.948299e-01            0
      809    466_542290 MorisitaHornDiss -1.262099e-02 5.592501e-02            0
      810    466_542290   BrayCurtisDiss  6.356106e-03 7.600296e-01            0
      811    466_565606      JaccardDiss  4.775535e-04 9.268321e-01            0
      812    466_565606 MorisitaHornDiss  2.313024e-02 7.060649e-02            0
      813    466_565606   BrayCurtisDiss  1.644665e-02 5.907371e-02            0
      814    466_553933      JaccardDiss -6.321461e-03 3.869026e-01            0
      815    466_553933 MorisitaHornDiss  8.108944e-03 7.124456e-01            0
      816    466_553933   BrayCurtisDiss  1.921354e-02 1.157049e-01            0
      817    466_562687      JaccardDiss  5.444044e-03 1.740783e-01            0
      818    466_562687 MorisitaHornDiss  6.663814e-03 6.890935e-01            0
      819    466_562687   BrayCurtisDiss  2.270620e-04 9.799280e-01            0
      820    466_556851      JaccardDiss -7.312121e-02 5.254656e-02            0
      821    466_556851 MorisitaHornDiss  8.060826e-02 5.810207e-01            0
      822    466_556851   BrayCurtisDiss  1.746405e-02 8.605673e-01            0
      823    466_571439      JaccardDiss  4.078390e-03 7.775610e-01            0
      824    466_571439 MorisitaHornDiss  1.075299e-02 7.292799e-01            0
      825    466_571439   BrayCurtisDiss -2.359648e-03 8.804861e-01            0
      826    466_565610      JaccardDiss  1.082844e-02 4.941274e-02            1
      827    466_565610 MorisitaHornDiss  3.768948e-02 3.960465e-02            1
      828    466_565610   BrayCurtisDiss  2.091394e-02 4.310936e-03            1
      829    466_565611      JaccardDiss -1.458787e-02 3.143186e-01            0
      830    466_565611 MorisitaHornDiss -2.463735e-02 5.250178e-01            0
      831    466_565611   BrayCurtisDiss  1.201053e-02 5.364095e-01            0
      832    466_541545      JaccardDiss  1.039871e-02 4.906836e-01            0
      833    466_541545 MorisitaHornDiss  5.434691e-02 2.448262e-01            0
      834    466_541545   BrayCurtisDiss  1.228193e-02 6.014918e-01            0
      835    466_546649      JaccardDiss  2.420757e-02 1.005584e-01            0
      836    466_546649 MorisitaHornDiss  9.802468e-02 5.203632e-01            0
      837    466_546649   BrayCurtisDiss  7.205582e-02 4.663479e-01            0
      838    466_566335      JaccardDiss -9.559113e-03 3.200480e-03            1
      839    466_566335 MorisitaHornDiss -1.968957e-03 9.118570e-01            0
      840    466_566335   BrayCurtisDiss  1.667145e-03 8.841597e-01            0
      841    466_543008      JaccardDiss  2.018256e-02 1.847681e-01            0
      842    466_543008 MorisitaHornDiss -3.013943e-02 8.338237e-01            0
      843    466_543008   BrayCurtisDiss -1.759564e-02 1.755204e-01            0
      844    466_542272      JaccardDiss -6.569865e-03 3.350875e-01            0
      845    466_542272 MorisitaHornDiss  2.792751e-02 3.138627e-01            0
      846    466_542272   BrayCurtisDiss  2.086731e-02 3.236699e-01            0
      847    466_564884      JaccardDiss -1.374486e-02 1.305589e-01            0
      848    466_564884 MorisitaHornDiss -3.837282e-02 4.505592e-01            0
      849    466_564884   BrayCurtisDiss -1.858466e-02 4.121212e-01            0
      850    466_558310      JaccardDiss  1.495081e-03 7.378251e-01            0
      851    466_558310 MorisitaHornDiss  7.118449e-03 2.525667e-01            0
      852    466_558310   BrayCurtisDiss  6.991023e-03 1.163011e-01            0
      853    466_541548      JaccardDiss  9.007386e-05 9.874671e-01            0
      854    466_541548 MorisitaHornDiss  9.800514e-03 1.215102e-01            0
      855    466_541548   BrayCurtisDiss  7.272155e-03 4.134287e-01            0
      856    466_568522      JaccardDiss  5.945133e-03 2.002899e-01            0
      857    466_568522 MorisitaHornDiss  1.743436e-02 1.300866e-01            0
      858    466_568522   BrayCurtisDiss  1.094956e-02 1.494983e-01            0
      859    466_561970      JaccardDiss -1.411436e-03 9.406630e-01            0
      860    466_561970 MorisitaHornDiss  8.588073e-02 1.370100e-01            0
      861    466_561970   BrayCurtisDiss  6.347282e-02 1.365342e-01            0
      862    466_568523      JaccardDiss -3.000000e-03 7.107026e-01            0
      863    466_568523 MorisitaHornDiss  3.587049e-02 3.331022e-01            0
      864    466_568523   BrayCurtisDiss  1.260949e-02 4.155911e-01            0
      865    466_553937      JaccardDiss  3.924262e-03 1.223737e-01            0
      866    466_553937 MorisitaHornDiss -7.773126e-03 2.292803e-01            0
      867    466_553937   BrayCurtisDiss  1.598997e-03 8.002345e-01            0
      868    466_564158      JaccardDiss  9.417391e-03 6.100939e-01            0
      869    466_564158 MorisitaHornDiss  5.739800e-02 2.307971e-01            0
      870    466_564158   BrayCurtisDiss  1.699438e-02 5.869925e-01            0
      871    466_564876      JaccardDiss -2.452153e-02 4.908429e-01            0
      872    466_564876 MorisitaHornDiss -4.277511e-02 6.037310e-01            0
      873    466_564876   BrayCurtisDiss -3.398662e-02 6.164979e-01            0
      874    466_545927      JaccardDiss -5.921004e-04 8.604707e-01            0
      875    466_545927 MorisitaHornDiss  6.766387e-03 6.172821e-01            0
      876    466_545927   BrayCurtisDiss  3.267139e-03 7.539157e-01            0
      877    466_551018      JaccardDiss -4.052364e-04 9.225107e-01            0
      878    466_551018 MorisitaHornDiss  1.498694e-02 8.565474e-02            0
      879    466_551018   BrayCurtisDiss  1.313113e-02 2.415135e-02            1
      880    466_569984      JaccardDiss  4.086957e-02 5.824243e-01            0
      881    466_569984 MorisitaHornDiss -2.588588e-02 9.595396e-01            0
      882    466_569984   BrayCurtisDiss -1.511925e-02 9.703158e-01            0
      883    466_556135      JaccardDiss -1.656315e-02 4.830491e-01            0
      884    466_556135 MorisitaHornDiss  3.667825e-02 5.686437e-01            0
      885    466_556135   BrayCurtisDiss  3.496328e-02 5.556066e-01            0
      886    466_558313      JaccardDiss  5.074301e-03 3.097694e-01            0
      887    466_558313 MorisitaHornDiss -2.661260e-03 6.442401e-01            0
      888    466_558313   BrayCurtisDiss  4.191814e-03 6.344704e-01            0
      889    466_557581      JaccardDiss  9.412955e-03 3.737436e-01            0
      890    466_557581 MorisitaHornDiss  6.907785e-03 7.641265e-01            0
      891    466_557581   BrayCurtisDiss  1.220037e-02 4.509556e-01            0
      892    466_547368      JaccardDiss -7.393847e-03 7.043479e-03            1
      893    466_547368 MorisitaHornDiss -5.272901e-02 1.563708e-02            1
      894    466_547368   BrayCurtisDiss -3.074333e-02 5.856626e-02            0
      895    466_548098      JaccardDiss -2.018572e-03 6.110881e-01            0
      896    466_548098 MorisitaHornDiss  3.232876e-02 3.390359e-02            1
      897    466_548098   BrayCurtisDiss  1.474529e-02 2.636140e-01            0
      898    466_544455      JaccardDiss -5.462550e-03 1.059030e-01            0
      899    466_544455 MorisitaHornDiss -7.431035e-03 6.336671e-01            0
      900    466_544455   BrayCurtisDiss -6.263561e-03 5.146810e-01            0
      901    466_554676      JaccardDiss  1.696488e-03 6.128224e-01            0
      902    466_554676 MorisitaHornDiss  2.102805e-02 1.557968e-03            1
      903    466_554676   BrayCurtisDiss  5.267361e-03 4.380936e-01            0
      904    466_565605      JaccardDiss  6.258747e-03 2.429026e-01            0
      905    466_565605 MorisitaHornDiss  2.449861e-02 2.134676e-01            0
      906    466_565605   BrayCurtisDiss  1.862295e-02 1.922208e-01            0
      907    466_561962      JaccardDiss  3.480586e-03 2.811889e-01            0
      908    466_561962 MorisitaHornDiss  1.330264e-02 2.310806e-01            0
      909    466_561962   BrayCurtisDiss -3.867951e-03 6.191778e-01            0
      910    466_548097      JaccardDiss  8.012390e-04 8.289634e-01            0
      911    466_548097 MorisitaHornDiss  1.249292e-02 3.586356e-03            1
      912    466_548097   BrayCurtisDiss  6.803688e-03 1.213512e-01            0
      913    466_564146      JaccardDiss -2.773728e-02 3.486290e-01            0
      914    466_564146 MorisitaHornDiss -8.029293e-03 9.191745e-01            0
      915    466_564146   BrayCurtisDiss  1.094602e-02 2.638494e-01            0
      916    466_544471      JaccardDiss  3.163689e-03 6.292679e-01            0
      917    466_544471 MorisitaHornDiss  2.137532e-02 2.097095e-01            0
      918    466_544471   BrayCurtisDiss  3.177439e-02 7.163420e-02            0
      919    466_557584      JaccardDiss -2.723385e-03 7.885367e-01            0
      920    466_557584 MorisitaHornDiss  1.057348e-02 4.298962e-01            0
      921    466_557584   BrayCurtisDiss  1.737151e-02 1.230467e-01            0
      922    466_543726      JaccardDiss  2.123341e-03 7.342688e-01            0
      923    466_543726 MorisitaHornDiss  1.278427e-02 4.711330e-02            1
      924    466_543726   BrayCurtisDiss  1.652051e-03 7.330525e-01            0
      925    466_553207      JaccardDiss  2.787146e-03 3.032566e-01            0
      926    466_553207 MorisitaHornDiss  2.127258e-02 4.814466e-01            0
      927    466_553207   BrayCurtisDiss  1.596107e-02 3.454706e-01            0
      928    466_551748      JaccardDiss -6.715514e-03 1.326388e-01            0
      929    466_551748 MorisitaHornDiss -2.079261e-02 2.735547e-01            0
      930    466_551748   BrayCurtisDiss -1.104195e-02 4.090195e-01            0
      931    466_551015      JaccardDiss -3.921459e-03 1.594007e-01            0
      932    466_551015 MorisitaHornDiss  3.657566e-03 8.684468e-01            0
      933    466_551015   BrayCurtisDiss  1.101012e-02 4.582131e-01            0
      934    466_559044      JaccardDiss  1.004123e-02 1.939984e-02            1
      935    466_559044 MorisitaHornDiss  1.990087e-02 7.328972e-02            0
      936    466_559044   BrayCurtisDiss  4.158747e-03 7.508563e-01            0
      937    466_557595      JaccardDiss  3.095652e-02 1.801673e-01            0
      938    466_557595 MorisitaHornDiss  3.709833e-02 7.966189e-01            0
      939    466_557595   BrayCurtisDiss  9.495758e-03 9.438451e-01            0
      940    466_559773      JaccardDiss  6.802721e-04 9.862262e-01            0
      941    466_559773 MorisitaHornDiss -2.712453e-03 9.807617e-01            0
      942    466_559773   BrayCurtisDiss  4.278733e-02 3.076173e-01            0
      943    466_554666      JaccardDiss  9.136033e-04 9.216911e-01            0
      944    466_554666 MorisitaHornDiss  2.592154e-03 8.836214e-01            0
      945    466_554666   BrayCurtisDiss  1.626733e-02 5.114563e-01            0
      946    466_547369      JaccardDiss  1.464346e-03 9.221371e-01            0
      947    466_547369 MorisitaHornDiss -4.425426e-03 9.168795e-01            0
      948    466_547369   BrayCurtisDiss -4.226093e-03 8.270562e-01            0
      949    466_550285      JaccardDiss -2.118332e-03 8.137928e-01            0
      950    466_550285 MorisitaHornDiss  4.467892e-02 3.759250e-02            1
      951    466_550285   BrayCurtisDiss  2.499298e-02 2.833074e-01            0
      952    466_561232      JaccardDiss  2.299860e-03 7.234209e-01            0
      953    466_561232 MorisitaHornDiss  4.023461e-02 1.405030e-01            0
      954    466_561232   BrayCurtisDiss  1.343939e-02 1.988181e-01            0
      955    466_557594      JaccardDiss  3.482038e-03 6.873379e-01            0
      956    466_557594 MorisitaHornDiss -1.471546e-02 3.395598e-01            0
      957    466_557594   BrayCurtisDiss  7.426966e-04 9.683752e-01            0
      958    466_559050      JaccardDiss  6.495399e-03 1.715374e-01            0
      959    466_559050 MorisitaHornDiss  4.141961e-02 7.577269e-02            0
      960    466_559050   BrayCurtisDiss  9.228708e-05 9.908581e-01            0
      961    466_546657      JaccardDiss -5.873016e-02 2.977982e-02            1
      962    466_546657 MorisitaHornDiss -2.999268e-02 8.255505e-01            0
      963    466_546657   BrayCurtisDiss  8.739960e-04 9.945817e-01            0
      964    466_565615      JaccardDiss  2.354488e-02 5.625644e-01            0
      965    466_565615 MorisitaHornDiss -5.955162e-02 5.889037e-01            0
      966    466_565615   BrayCurtisDiss -9.782322e-03 8.478624e-01            0
      967    466_555405      JaccardDiss  8.618711e-03 2.167918e-01            0
      968    466_555405 MorisitaHornDiss  4.546609e-02 4.150469e-02            1
      969    466_555405   BrayCurtisDiss  1.605521e-02 3.022694e-01            0
      970    466_559043      JaccardDiss  7.416056e-03 3.159220e-01            0
      971    466_559043 MorisitaHornDiss -5.713549e-03 8.330028e-01            0
      972    466_559043   BrayCurtisDiss -1.121967e-02 5.369707e-01            0
      973    466_543012      JaccardDiss  1.332092e-02 4.902576e-01            0
      974    466_543012 MorisitaHornDiss  2.746011e-02 3.001391e-01            0
      975    466_543012   BrayCurtisDiss  5.382295e-02 2.421552e-01            0
      976    466_549575      JaccardDiss  8.324533e-03 5.598632e-02            0
      977    466_549575 MorisitaHornDiss  4.740170e-03 5.833381e-01            0
      978    466_549575   BrayCurtisDiss  1.119148e-02 4.132660e-02            1
      979    466_547385      JaccardDiss  3.493464e-03 5.692629e-01            0
      980    466_547385 MorisitaHornDiss -1.344451e-02 6.409914e-01            0
      981    466_547385   BrayCurtisDiss -3.620792e-03 8.414580e-01            0
      982    466_551017      JaccardDiss  1.294538e-02 6.358826e-01            0
      983    466_551017 MorisitaHornDiss  6.617174e-02 1.654724e-01            0
      984    466_551017   BrayCurtisDiss  2.908405e-02 2.451102e-01            0
      985    466_543725      JaccardDiss -2.222222e-03 9.523353e-01            0
      986    466_543725 MorisitaHornDiss -1.498539e-01 5.379999e-02            0
      987    466_543725   BrayCurtisDiss -4.561351e-02 3.805381e-01            0
      988    466_558321      JaccardDiss  4.958340e-03 3.945659e-02            1
      989    466_558321 MorisitaHornDiss  5.147939e-03 7.371996e-01            0
      990    466_558321   BrayCurtisDiss -2.280130e-02 2.800729e-02            1
      991    466_559780      JaccardDiss  3.341737e-02 2.433593e-01            0
      992    466_559780 MorisitaHornDiss -1.382356e-01 1.004883e-01            0
      993    466_559780   BrayCurtisDiss -7.647603e-02 1.224104e-01            0
      994    466_541551      JaccardDiss -7.894737e-03 1.615715e-01            0
      995    466_541551 MorisitaHornDiss  8.900149e-03 1.411362e-01            0
      996    466_541551   BrayCurtisDiss -7.372180e-02 3.480908e-01            0
      997    466_548114      JaccardDiss -9.174491e-04 9.248869e-01            0
      998    466_548114 MorisitaHornDiss -6.346241e-04 9.559853e-01            0
      999    466_548114   BrayCurtisDiss  6.880068e-03 2.946663e-01            0
      1000   466_546656      JaccardDiss  5.632411e-02 4.234638e-01            0
      1001   466_546656 MorisitaHornDiss -2.508449e-01 4.451349e-01            0
      1002   466_546656   BrayCurtisDiss -1.378850e-02 8.212049e-01            0
      1003   466_554678      JaccardDiss  2.683856e-02 5.841755e-02            0
      1004   466_554678 MorisitaHornDiss  4.361756e-02 2.606701e-01            0
      1005   466_554678   BrayCurtisDiss  4.125393e-02 1.266929e-01            0
      1006   466_555360      JaccardDiss -9.095325e-04 9.092860e-01            0
      1007   466_555360 MorisitaHornDiss  1.299154e-02 1.855655e-01            0
      1008   466_555360   BrayCurtisDiss  4.439525e-03 6.779405e-01            0
      1009   466_554629      JaccardDiss  3.819444e-02 4.637948e-01            0
      1010   466_554629 MorisitaHornDiss  3.583133e-02 4.594699e-01            0
      1011   466_554629   BrayCurtisDiss  3.211154e-02 1.016078e-02            1
      1012   466_551718      JaccardDiss  3.063029e-03 8.100304e-01            0
      1013   466_551718 MorisitaHornDiss  3.153253e-04 7.684957e-01            0
      1014   466_551718   BrayCurtisDiss  1.263107e-03 9.737478e-01            0
      1015   466_551716      JaccardDiss  1.433592e-03 8.838047e-01            0
      1016   466_551716 MorisitaHornDiss  9.465821e-04 5.284726e-01            0
      1017   466_551716   BrayCurtisDiss  7.527789e-03 6.492242e-01            0
      1018   466_558275      JaccardDiss  9.521016e-03 4.964465e-01            0
      1019   466_558275 MorisitaHornDiss  6.140715e-04 9.529652e-02            0
      1020   466_558275   BrayCurtisDiss  8.566816e-04 9.405954e-01            0
      1021   466_552443      JaccardDiss -4.089850e-03 6.181706e-01            0
      1022   466_552443 MorisitaHornDiss  1.967037e-03 9.004211e-01            0
      1023   466_552443   BrayCurtisDiss -9.556496e-03 5.414800e-01            0
      1024   466_557546      JaccardDiss  3.024960e-03 5.726472e-01            0
      1025   466_557546 MorisitaHornDiss  4.072206e-03 7.277344e-01            0
      1026   466_557546   BrayCurtisDiss -1.344046e-02 1.593008e-01            0
      1027   466_553173      JaccardDiss  4.490841e-03 2.624943e-01            0
      1028   466_553173 MorisitaHornDiss  1.659768e-02 2.051047e-01            0
      1029   466_553173   BrayCurtisDiss  7.022958e-03 5.215393e-01            0
      1030   466_564882      JaccardDiss  1.820896e-02 2.152110e-01            0
      1031   466_564882 MorisitaHornDiss -7.867373e-03 7.339815e-01            0
      1032   466_564882   BrayCurtisDiss  6.552734e-03 7.225140e-01            0
      1033   466_556816      JaccardDiss  1.013603e-02 1.814273e-01            0
      1034   466_556816 MorisitaHornDiss  2.365492e-02 1.978877e-01            0
      1035   466_556816   BrayCurtisDiss  1.930400e-02 3.403208e-01            0
      1036   466_557544      JaccardDiss  3.997868e-03 7.098418e-01            0
      1037   466_557544 MorisitaHornDiss -2.242010e-02 6.386829e-01            0
      1038   466_557544   BrayCurtisDiss -2.478667e-02 2.587012e-01            0
      1039   466_550987      JaccardDiss  5.402930e-03 7.699126e-01            0
      1040   466_550987 MorisitaHornDiss -2.235320e-02 3.773459e-01            0
      1041   466_550987   BrayCurtisDiss -1.489277e-02 6.156105e-01            0
      1042   466_558277      JaccardDiss -1.552366e-02 3.698052e-01            0
      1043   466_558277 MorisitaHornDiss -4.393220e-03 9.143572e-01            0
      1044   466_558277   BrayCurtisDiss  2.696486e-02 3.875211e-01            0
      1045   466_559732      JaccardDiss  1.111111e-01 3.333333e-01            0
      1046   466_559732 MorisitaHornDiss  1.795053e-01 3.402753e-01            0
      1047   466_559732   BrayCurtisDiss  8.115448e-02 6.725096e-01            0
      1048   466_562648      JaccardDiss  2.000000e-02 6.847438e-01            0
      1049   466_562648 MorisitaHornDiss  2.470599e-04 1.615843e-01            0
      1050   466_562648   BrayCurtisDiss -7.089079e-02 3.841353e-01            0
               intercept
      1     -21.06812300
      2      -0.91717475
      3      11.68745489
      4      -4.88532201
      5      -3.41076810
      6      -4.50725912
      7     -14.07459139
      8     -22.31910862
      9     -15.14316644
      10     38.22141853
      11     52.82646249
      12     17.18841329
      13    -10.11659483
      14    -10.01157680
      15    -14.37429502
      16     -6.31303358
      17     -3.63306434
      18      1.92215315
      19     10.91077611
      20     41.52228773
      21      1.14725801
      22     26.61868354
      23     16.85093372
      24     32.60066839
      25    -10.11257079
      26   -118.62902997
      27    -49.15027925
      28    -15.00391138
      29   -270.09725018
      30   -171.25374136
      31      7.80378788
      32      8.96630748
      33    -94.39361049
      34     -6.23986365
      35    -15.54978420
      36    -12.32232748
      37     -8.73278912
      38    -52.94741359
      39    -62.29012055
      40     23.19915597
      41   -273.44258094
      42    -70.62563394
      43    122.10768700
      44     53.81044921
      45     76.49652377
      46   -107.74990916
      47     15.05172428
      48     12.67283687
      49    -67.73070227
      50    -17.25271083
      51    -31.81533785
      52     38.86900161
      53    136.05892050
      54     87.62565287
      55    120.46627451
      56     26.87905725
      57    113.49457864
      58    -97.12063650
      59    -34.04172176
      60    -72.55011054
      61    -45.28175198
      62    -59.39709439
      63    -55.11117538
      64    -39.53921656
      65     31.10890373
      66    -31.55067071
      67    -85.14263836
      68    -58.13810990
      69    -44.41357227
      70    -84.72525641
      71     -7.83170148
      72    -15.60409128
      73     43.59200325
      74     57.76171449
      75     31.13312145
      76    122.03332044
      77    127.35966859
      78     77.82018666
      79    -78.12551782
      80     18.60953781
      81     22.78564936
      82     47.55748665
      83     22.96667694
      84     31.50434654
      85     73.41656691
      86     -2.81732828
      87     12.07964959
      88     -6.89204419
      89      2.12208926
      90    -23.05369249
      91     20.98836349
      92     99.92072035
      93     24.00478413
      94   -114.34099126
      95      9.96208134
      96    -18.45831040
      97   -569.83988958
      98   -881.74980457
      99   -648.93065406
      100    95.29979443
      101   -89.91471190
      102   -32.03896622
      103   -29.98075434
      104   -44.11101571
      105    16.29242872
      106   -48.72862940
      107    26.73243552
      108   -26.37748449
      109   -61.29465170
      110    56.51092900
      111    26.21340672
      112  -268.08906810
      113   -87.43651896
      114  -131.44014058
      115   201.21461538
      116   314.88426157
      117   167.62888209
      118     0.48214286
      119     0.49590075
      120     0.52872692
      121   223.44797178
      122  -264.91332916
      123   104.96483475
      124    90.57194002
      125   121.54794817
      126    98.06083316
      127   -25.76837607
      128    13.33469447
      129    19.76998907
      130    12.16274155
      131  -150.14507676
      132   -72.29540462
      133    38.16854928
      134   -22.89739916
      135   -45.67007022
      136   -28.50364310
      137  -173.27155048
      138  -151.97073885
      139    57.44933373
      140   -86.35506811
      141   -74.51131547
      142   -16.25574758
      143     4.91212097
      144    -4.55623471
      145   -25.71387520
      146   -22.14484496
      147    26.94811853
      148   -41.69997618
      149  -158.46639311
      150   -73.98565592
      151   -18.76685824
      152   -13.10958698
      153     0.33940379
      154   147.56874722
      155  -159.72408856
      156    -2.85299426
      157   -87.98624626
      158   -33.36139953
      159   -50.38974629
      160    29.56056244
      161    24.88027188
      162    47.75704784
      163     1.48987179
      164     0.55931373
      165   -38.59374247
      166    33.54361305
      167    14.60901630
      168    53.68346292
      169   -30.73028417
      170  -311.18063957
      171  -151.27315910
      172   -77.88464996
      173     2.01481773
      174    -0.49448206
      175    20.19868035
      176   -66.53341537
      177   -20.66412704
      178    -8.96014260
      179   -27.27358082
      180  -227.25494345
      181    -3.80833333
      182   -12.00990868
      183   -40.23774670
      184  -103.43041958
      185   -82.17891107
      186   -78.65264220
      187   -89.61145255
      188   -27.67456088
      189   -54.64686105
      190   -21.64093982
      191   -55.77640529
      192   -40.62389507
      193    80.49029369
      194    44.22334491
      195    40.88918929
      196   -46.64264663
      197   -57.71748866
      198   -75.67193811
      199    50.32618498
      200   318.38247288
      201    11.19554169
      202   349.52007168
      203   878.16275959
      204   588.45198713
      205     0.34838710
      206   -17.52504960
      207    87.28192187
      208  -125.21984574
      209  -123.19925301
      210  -199.52735319
      211   127.43016129
      212   -73.97366258
      213   -41.93800782
      214   164.49112135
      215   252.68176744
      216   186.36592535
      217  -164.97527473
      218   -30.10933978
      219   -96.39618863
      220   -62.01978237
      221   -30.72408259
      222    15.71968544
      223    19.61362229
      224    50.62423307
      225    36.24565836
      226   -56.70125000
      227  -100.04716634
      228   -33.00319804
      229    35.89187267
      230   -87.64393358
      231   -20.25929809
      232    50.18894009
      233    33.20911514
      234    68.05052667
      235    62.35325108
      236   -82.77106414
      237   -66.61428807
      238  -183.64033613
      239  -215.32188020
      240  -120.88284050
      241    48.72651629
      242    -2.98004119
      243   -13.15827154
      244    35.94642857
      245    64.76833977
      246    -6.49265490
      247   575.14285714
      248   575.14285714
      249   383.76190476
      250     0.33333333
      251  -257.51851852
      252  -167.11111111
      253  -200.80000000
      254   -50.33864248
      255  -189.17371610
      256   502.83333333
      257     0.75443861
      258    42.84636763
      259   -15.45121643
      260   -63.36763302
      261   -69.32790115
      262   -34.46600877
      263  -147.97461722
      264  -178.32626927
      265   -59.52747432
      266    58.58767239
      267    16.29425089
      268    -2.45945355
      269   -30.72010691
      270   -41.48467041
      271    -3.88309637
      272   -15.00769239
      273   -15.31256415
      274   -34.94642857
      275   -34.94642857
      276   -28.88804173
      277  -373.29166667
      278  -898.28744850
      279  -671.45836051
      280   101.88740458
      281    94.53980371
      282    52.27535827
      283   193.00602410
      284    25.71319302
      285   -53.05443482
      286     1.00000000
      287     1.00000000
      288     1.00000000
      289   -37.81466181
      290   -36.45634797
      291   -32.77440581
      292    17.83533835
      293    11.96061050
      294    24.09831462
      295     0.66666667
      296   -17.37382737
      297   -24.35465502
      298    59.12216194
      299   179.83288959
      300    58.21137561
      301   -38.99581006
      302   -85.65040771
      303   -19.99159230
      304    54.98380567
      305    17.61040174
      306    27.99190283
      307    64.91896024
      308    64.91896024
      309    64.91896024
      310    -7.05641502
      311    -8.58996700
      312     4.16528162
      313    55.23550725
      314    55.23550725
      315    24.24378882
      316     1.00000000
      317     1.00000000
      318     1.00000000
      319     6.11494253
      320    22.20275334
      321    68.21510637
      322   -18.63106796
      323   -11.08065721
      324    14.04256908
      325   148.03696237
      326   182.97928614
      327   106.76236559
      328     3.12632058
      329   -54.33236884
      330    -7.38178711
      331    25.52360140
      332    96.79531796
      333    13.26180070
      334   -50.01579779
      335    -8.33596630
      336   -29.84498677
      337    36.07464455
      338   -99.23183804
      339   -25.54350321
      340   -49.64387678
      341   -26.80484000
      342   -26.41214773
      343     1.00000000
      344     1.00000000
      345     1.00000000
      346    34.23888889
      347    92.84429825
      348    50.85833333
      349   -20.68092891
      350   -34.88796718
      351    12.15950162
      352   -26.24400635
      353   -40.78708124
      354   -31.72055696
      355    42.42903226
      356     2.73735692
      357    -8.72880752
      358    28.41578014
      359   101.36334609
      360    46.69296690
      361   -20.20408163
      362   -20.20408163
      363   -20.20408163
      364   -93.68321471
      365  -132.29425986
      366   -30.99990572
      367    29.97674419
      368    42.18790062
      369    41.90834473
      370   715.42857143
      371   715.42857143
      372   715.42857143
      373     1.00000000
      374     1.00000000
      375     1.00000000
      376     1.00000000
      377     1.00000000
      378     1.00000000
      379    54.47464213
      380    21.70748422
      381    13.79771345
      382   -20.03991060
      383   -15.98707826
      384     1.43074409
      385    34.48207475
      386    11.04462243
      387    26.11155606
      388   -53.64399093
      389  -106.32075086
      390   -46.19276554
      391  -286.33333333
      392  -286.33333333
      393  -286.33333333
      394    10.91369048
      395    38.82720131
      396    33.00875677
      397    15.88455657
      398     9.52983802
      399     8.83020386
      400   -58.84188034
      401   -27.49613350
      402   -38.89458689
      403    49.31111111
      404    20.20750464
      405    10.01762918
      406  -195.25862069
      407  -210.56321839
      408  -109.67272032
      409   114.13172805
      410   109.68191016
      411    47.34900850
      412  -356.75000000
      413  -237.83333333
      414  -428.10000000
      415   -43.72777778
      416   -58.63703704
      417   -54.88888889
      418    53.79075850
      419    53.79075850
      420    31.16614771
      421   -15.77891156
      422    57.96630769
      423    47.12454609
      424  -167.25000000
      425   200.99743182
      426   264.71658619
      427     0.25000000
      428     0.25000000
      429    10.58922366
      430   -45.09000000
      431    55.58037719
      432    22.09899749
      433     6.22486428
      434    -9.75443374
      435     2.82154279
      436   -71.32800000
      437   -71.32800000
      438   -71.32800000
      439   -11.13212708
      440   -69.68540823
      441    17.81924790
      442     1.00000000
      443     1.00000000
      444     1.00000000
      445   167.97222222
      446    75.66164146
      447    23.01717172
      448   -26.17041199
      449   -58.09873759
      450   -20.17072312
      451    77.13675214
      452    27.22473605
      453    -5.29226656
      454   -11.06901840
      455    -1.54966258
      456    -5.22659351
      457    -6.15517241
      458    -6.53176044
      459    -0.74753695
      460   -37.69500675
      461    -1.98662873
      462  -102.94114833
      463   143.67857143
      464    16.93802985
      465    55.35374150
      466     1.00000000
      467     1.00000000
      468     1.00000000
      469   -40.04054054
      470     0.22077219
      471   -63.94170866
      472   -32.56666667
      473   -15.64873419
      474     1.24534395
      475    48.92771084
      476  -116.16867470
      477    49.12771084
      478     0.00000000
      479    34.19610503
      480   -57.97790363
      481     0.66666667
      482     0.66666667
      483     0.77777778
      484    10.17686992
      485    58.66282424
      486    24.30471545
      487   -40.22448980
      488   -40.22448980
      489   -33.35374150
      490   101.92229730
      491   -10.43450640
      492   -34.49921228
      493   -13.38408521
      494     7.44289688
      495   -14.01892152
      496    35.85416667
      497    37.88307875
      498    25.22972973
      499   -19.42574257
      500   -19.42574257
      501     2.64257426
      502    45.95102041
      503    96.46816565
      504    13.84314869
      505    23.40181791
      506   -10.39827234
      507     4.49792103
      508   235.35754190
      509   235.35754190
      510   118.17877095
      511   -21.07483930
      512    -5.46247110
      513   -19.74040808
      514   -42.44661922
      515   -51.70004886
      516   -44.29621233
      517   402.40000000
      518    35.44423047
      519    93.81138020
      520   112.84178744
      521    92.70836353
      522     2.53244760
      523    41.94661060
      524     4.70928192
      525   -13.95004260
      526   -30.95126354
      527   -47.42626231
      528   -12.27168113
      529    12.80752048
      530    12.80752048
      531   -25.32056231
      532   -34.88669951
      533   -61.20479030
      534   -41.37103258
      535     0.33333333
      536     0.25721785
      537    51.39894180
      538   150.28947368
      539   150.28947368
      540    89.27796053
      541   -14.21487603
      542   -15.42061766
      543   -31.32782369
      544   144.50000000
      545   144.50000000
      546    21.50000000
      547   -21.67825101
      548   -63.91617357
      549   -43.59531320
      550    86.93453243
      551   164.77500644
      552   102.70725648
      553    85.66505523
      554    48.78850649
      555    81.25325094
      556    41.64752652
      557   130.99587097
      558   104.51357209
      559     8.19077316
      560    77.41953048
      561    35.40315630
      562   -61.07463885
      563   -88.94721099
      564   -88.26036150
      565   -27.35877030
      566   -31.81630324
      567   -33.55086209
      568   -61.06660809
      569     3.39923555
      570   -72.01137734
      571     3.49314257
      572     9.00249392
      573   -11.44289822
      574    13.44396345
      575    -6.35401086
      576   -12.85918183
      577    16.96736592
      578    17.78585379
      579    26.32486514
      580    -8.99961667
      581    17.93425925
      582    43.98147732
      583     5.70958123
      584    28.17332909
      585     4.26068639
      586     4.93970931
      587   -31.16332383
      588   -26.08255642
      589   -11.39224438
      590     2.62732754
      591     2.08915460
      592     4.50927344
      593   -11.32046559
      594     8.19144318
      595     9.34924369
      596     3.36408854
      597   -14.68834477
      598    -3.15058247
      599   -56.22070753
      600   -12.82665338
      601   -10.10802544
      602     7.20688012
      603    35.02942305
      604    18.54119449
      605   -30.46726539
      606   -41.83497218
      607   -24.71508759
      608    -0.11406347
      609   -28.24740025
      610    -1.25892133
      611    -8.47197836
      612    -7.67161948
      613    -1.16005942
      614   -25.17225142
      615     4.00507610
      616   -20.47226827
      617   -56.55558373
      618   -38.53011433
      619    73.22435897
      620    60.16813386
      621    35.83126259
      622    -3.44541385
      623   -51.87444268
      624   -58.57158107
      625   -18.10611560
      626   -71.59440422
      627   -33.00819600
      628    25.75420168
      629   -27.04343718
      630   -56.06916727
      631   -26.19225579
      632     9.50180467
      633   -48.33384446
      634   -13.34590517
      635   -45.27087696
      636   -11.93196646
      637    -0.43841155
      638    27.17177964
      639    28.71030190
      640    -0.21154125
      641   -11.57989052
      642    -7.47053693
      643     2.13697391
      644   -30.74564047
      645   -25.12708670
      646    -2.29107960
      647   -16.97110951
      648    -5.17482591
      649    62.40215169
      650    -1.22298568
      651   -45.92105310
      652     4.85174299
      653   -43.42898423
      654    -0.96652656
      655   -14.51456414
      656     4.49981010
      657   -13.29402506
      658     0.30882931
      659    -2.90993498
      660   -19.88950613
      661    -2.62676703
      662    -9.83201662
      663   -41.79982552
      664     3.83766371
      665   -19.02491150
      666   -37.84360900
      667    -7.56970876
      668   -12.70417804
      669    -2.27169652
      670    -0.16539870
      671   -21.76758291
      672   -32.66455738
      673    -6.31990943
      674     8.03783252
      675    36.62028908
      676   -10.38830276
      677    -1.64564531
      678   -40.06267900
      679     1.54733208
      680   -10.52248299
      681   -29.42798227
      682     1.67620096
      683   -36.42260512
      684   -61.59458816
      685   -23.79081185
      686   -20.69655756
      687     2.03068202
      688   -20.82342255
      689   -54.04022007
      690   -37.08223554
      691   -14.60393369
      692   -57.02724002
      693   -21.40574712
      694    -3.89055349
      695   -38.53991771
      696   -29.08765240
      697    40.25978532
      698    -2.47047871
      699   -14.06503420
      700    -9.85632123
      701   -18.96594950
      702   -23.63650521
      703   -11.35443353
      704   -24.25705591
      705   -33.56561506
      706     4.57014363
      707   -10.68069577
      708    -8.07470065
      709   -20.56313797
      710   -21.27480794
      711   -30.35561260
      712     4.88078472
      713   -26.21124232
      714   -23.73838977
      715     5.15361671
      716     0.34995446
      717   -29.72956211
      718   -24.68331668
      719   -24.00998485
      720    15.61481026
      721    -1.91073385
      722   -22.13621005
      723     6.17334778
      724   -11.69543458
      725   -28.51808268
      726   -16.92032834
      727     3.38733725
      728   -35.95390167
      729   -53.34345221
      730    -2.91175435
      731    -2.80619306
      732    18.92601706
      733    -6.01998620
      734    12.96997506
      735    20.20435045
      736    -0.08867745
      737    -3.12725045
      738    -9.00388271
      739    -3.50744990
      740   -11.84289545
      741     1.40351197
      742   -22.41774780
      743    -1.60904632
      744    -3.66873216
      745    -0.13779014
      746   -22.63957868
      747   -32.65434924
      748    19.14430527
      749    -0.18801080
      750   -10.29437619
      751    -0.62339964
      752   -28.63015135
      753    11.47287830
      754   -29.99956725
      755   -42.34175799
      756   -24.98845718
      757    15.92198129
      758    14.74432181
      759   -40.19610540
      760   -18.88920841
      761   -17.94480453
      762    -7.26215250
      763     1.78759202
      764   -13.30004450
      765   -38.19748264
      766    10.39323749
      767   -20.94821275
      768   -43.12515948
      769    -2.24421720
      770   -29.12704787
      771   -13.14495226
      772   -19.60173160
      773   -29.30432266
      774   -67.99110471
      775    -6.29524712
      776     7.15008296
      777    -4.03682344
      778    18.50458661
      779     7.24495919
      780   -11.98558912
      781   -25.35434524
      782     7.59215669
      783     0.92103474
      784     8.92460388
      785     1.26309244
      786   -35.02300317
      787    -5.71151946
      788   -25.11969860
      789     4.78159315
      790    -2.18200398
      791    17.53556707
      792    -2.60091863
      793   -15.08639022
      794    91.00177165
      795    49.03796233
      796     8.02595686
      797    19.45539899
      798    26.35148799
      799    -8.68730552
      800   -20.84567494
      801   -46.49609752
      802    -5.66268954
      803   -33.92668684
      804   -29.04655422
      805     6.10413753
      806   -11.79147048
      807    -2.01516250
      808   -16.76772963
      809    25.28820354
      810   -12.07212678
      811    -0.42957701
      812   -45.48272865
      813   -32.09022513
      814    13.15995901
      815   -15.84263948
      816   -37.89047941
      817   -10.46254772
      818   -12.67530754
      819     0.21038382
      820   146.87726340
      821  -161.05842871
      822   -34.45488535
      823    -7.74210212
      824   -21.13887831
      825     5.28215786
      826   -21.23037244
      827   -74.84159804
      828   -41.00485912
      829    29.57847083
      830    49.85257468
      831   -23.22927186
      832   -20.36320754
      833  -108.32808472
      834   -23.74096932
      835   -47.94008925
      836  -195.44243388
      837  -143.57812318
      838    19.50573499
      839     4.55672708
      840    -2.63432778
      841   -40.00162272
      842    61.00900886
      843    36.15314160
      844    13.67185840
      845   -55.30251220
      846   -41.12074316
      847    27.77483651
      848    76.85167414
      849    37.54230958
      850    -2.38649708
      851   -13.49030160
      852   -13.07758166
      853     0.19786558
      854   -19.38124094
      855   -14.06418520
      856   -11.35265806
      857   -34.38578708
      858   -21.30163176
      859     3.22452051
      860  -171.31734143
      861  -126.35396102
      862     6.55945455
      863   -70.93584867
      864   -24.38484405
      865    -7.48571348
      866    15.78668934
      867    -2.61901209
      868   -18.39431081
      869  -114.61473277
      870   -33.49869714
      871    49.49342105
      872    86.10892479
      873    68.57080077
      874     1.62897156
      875   -13.28143791
      876    -6.09426257
      877     1.25203480
      878   -29.32788988
      879   -25.47181378
      880   -80.75761675
      881    51.93280666
      882    30.63414868
      883    33.32049689
      884   -72.82934528
      885   -68.82369332
      886    -9.77483203
      887     5.79248328
      888    -7.76059675
      889   -18.24471274
      890   -13.42078441
      891   -23.72486577
      892    15.23221968
      893   105.71806128
      894    62.07671613
      895     4.45691957
      896   -64.19667585
      897   -28.83008950
      898    11.39460062
      899    15.15255219
      900    13.16150205
      901    -3.06057585
      902   -41.70234084
      903    -9.90457995
      904   -11.97828488
      905   -48.20956070
      906   -36.43470123
      907    -6.52600924
      908   -26.18753162
      909     8.37000030
      910    -1.10919081
      911   -24.41143253
      912   -12.94217245
      913    55.77113948
      914    16.31598193
      915   -21.15548601
      916    -5.96410165
      917   -42.44432747
      918   -62.90359724
      919     5.89770037
      920   -20.76300371
      921   -34.12704157
      922    -3.78297079
      923   -25.12798613
      924    -2.68038710
      925    -5.17255023
      926   -41.99877280
      927   -31.20214991
      928    13.81068058
      929    42.00131664
      930    22.64318999
      931     8.30559768
      932    -6.89605640
      933   -21.39554463
      934   -19.73207992
      935   -39.58483653
      936    -7.58769890
      937   -61.38886957
      938   -73.76158342
      939   -18.56384893
      940    -0.93741497
      941     6.00880354
      942   -84.67471518
      943    -1.41853832
      944    -4.91810420
      945   -31.91807372
      946    -2.53348896
      947     9.26354007
      948     9.05032764
      949     4.74631068
      950   -89.07380757
      951   -49.37994041
      952    -4.12957597
      953   -79.87637377
      954   -26.04496617
      955    -6.49381614
      956    29.70739777
      957    -1.00268331
      958   -12.51581243
      959   -82.52371467
      960     0.46740222
      961   117.73015873
      962    60.15674666
      963    -1.34271889
      964   -46.65110449
      965   119.98557765
      966    20.39693807
      967   -16.83578987
      968   -90.70209223
      969   -31.57580149
      970   -14.37546856
      971    11.93695833
      972    23.20963324
      973   -26.38880685
      974   -54.90881307
      975  -107.34623395
      976   -16.17215409
      977    -9.00883016
      978   -21.69204391
      979    -6.63586818
      980    27.38791294
      981     7.87980407
      982   -25.58327920
      983  -132.24074982
      984   -57.69621738
      985     4.92138889
      986   300.72568392
      987    91.92012582
      988    -9.42042512
      989    -9.87445933
      990    46.25263680
      991   -66.72579832
      992   277.75862968
      993   154.03043825
      994    16.21552250
      995   -17.79520044
      996   148.25360209
      997     2.36496552
      998     1.55751130
      999   -13.16034210
      1000 -112.60258381
      1001  503.85472011
      1002   28.33655526
      1003  -53.32820863
      1004  -86.83637052
      1005  -82.02184839
      1006    2.19715384
      1007  -25.81762214
      1008   -8.41606453
      1009  -76.16087963
      1010  -71.48667054
      1011  -63.82651273
      1012   -5.64658330
      1013   -0.61840603
      1014   -1.97454957
      1015   -2.55450088
      1016   -1.86501679
      1017  -14.61172911
      1018  -18.50994780
      1019   -1.21415010
      1020   -1.37475041
      1021    8.39089850
      1022   -3.82756913
      1023   19.62521136
      1024   -5.54820499
      1025   -7.97961149
      1026   27.33480570
      1027   -8.73827807
      1028  -33.00179552
      1029  -13.60952286
      1030  -35.71471045
      1031   16.19562573
      1032  -12.26933971
      1033  -19.84054173
      1034  -47.05010348
      1035  -37.97809868
      1036   -7.64401208
      1037   45.18818728
      1038   50.26729745
      1039  -10.48420330
      1040   45.00223113
      1041   30.21823722
      1042   31.11773879
      1043    8.98128191
      1044  -53.02125632
      1045 -220.96296296
      1046 -356.97355066
      1047 -160.96559764
      1048  -39.76444444
      1049   -0.49159436
      1050  141.77210934

---

    Code
      suppressWarnings({
        set.seed(42)
        getLinearRegressions(getBetaMetrics(resampling(gridding(meta, btf), measure = "BIOMASS",
        resamps = 1L), measure = "BIOMASS"), divType = "beta")
      })
    Message
      OK: all SL studies have 1 grid cell
    Output
         assemblageID           metric        slope     pvalue significance
      1    211_529239      JaccardDiss  0.016466117 0.22960635            0
      2    211_529239 MorisitaHornDiss  0.011510256 0.74173659            0
      3    211_529239   BrayCurtisDiss -0.001134076 0.94323321            0
      4    211_525598      JaccardDiss  0.032689955 0.18079353            0
      5    211_525598 MorisitaHornDiss  0.001602610 0.97840575            0
      6    211_525598   BrayCurtisDiss  0.032382296 0.45926241            0
      7    211_521960      JaccardDiss  0.006851935 0.34064418            0
      8    211_521960 MorisitaHornDiss -0.028775825 0.50992577            0
      9    211_521960   BrayCurtisDiss -0.004350147 0.84200593            0
      10   211_523410      JaccardDiss  0.003897403 0.87381241            0
      11   211_523410 MorisitaHornDiss  0.001560858 0.97764793            0
      12   211_523410   BrayCurtisDiss -0.008425951 0.66724163            0
      13   211_517585      JaccardDiss  0.010483141 0.82505581            0
      14   211_517585 MorisitaHornDiss  0.095168598 0.56369228            0
      15   211_517585   BrayCurtisDiss  0.003554712 0.96540970            0
      16   211_516855      JaccardDiss -0.026427758 0.01429377            1
      17   211_516855 MorisitaHornDiss  0.019383665 0.76175499            0
      18   211_516855   BrayCurtisDiss  0.113142329 0.29418003            0
      19  437_2075128      JaccardDiss -0.007661296 0.58157514            0
      20  437_2075128 MorisitaHornDiss -0.039135333 0.45849128            0
      21  437_2075128   BrayCurtisDiss -0.052489363 0.14276155            0
      22  437_2077319      JaccardDiss -0.043230231 0.01342278            1
      23  437_2077319 MorisitaHornDiss  0.015534820 0.64599441            0
      24  437_2077319   BrayCurtisDiss -0.001983839 0.95818048            0
      25  437_2076590      JaccardDiss -0.047509346 0.03439757            1
      26  437_2076590 MorisitaHornDiss -0.015302393 0.64856661            0
      27  437_2076590   BrayCurtisDiss -0.027024560 0.10644996            0
      28  437_2078777      JaccardDiss -0.022538780 0.32036449            0
      29  437_2078777 MorisitaHornDiss -0.018621755 0.14238007            0
      30  437_2078777   BrayCurtisDiss -0.036675003 0.11773059            0
      31  437_2076589      JaccardDiss -0.003754831 0.84605241            0
      32  437_2076589 MorisitaHornDiss -0.053280726 0.42089575            0
      33  437_2076589   BrayCurtisDiss -0.004189265 0.91886950            0
      34  437_2075860      JaccardDiss  0.030652912 0.43295676            0
      35  437_2075860 MorisitaHornDiss  0.003918578 0.84858190            0
      36  437_2075860   BrayCurtisDiss  0.018181671 0.49264719            0
      37  437_2074400      JaccardDiss  0.016442445 0.51999778            0
      38  437_2074400 MorisitaHornDiss  0.006988277 0.09911101            0
      39  437_2074400   BrayCurtisDiss -0.013951057 0.31210259            0
      40  437_2074399      JaccardDiss  0.030656345 0.07902396            0
      41  437_2074399 MorisitaHornDiss  0.031622558 0.64175314            0
      42  437_2074399   BrayCurtisDiss  0.047328352 0.51643730            0
           intercept
      1   -31.997958
      2   -22.486480
      3     2.944410
      4   -64.113023
      5    -2.912963
      6   -63.606168
      7   -12.929526
      8    57.741255
      9     9.345201
      10   -6.940038
      11   -2.487318
      12   17.630655
      13  -19.964641
      14 -188.410681
      15   -6.335053
      16   53.137896
      17  -38.306041
      18 -223.632469
      19   16.115507
      20   79.305680
      21  106.349328
      22   87.572339
      23  -30.930996
      24    4.581067
      25   96.157038
      26   30.988292
      27   54.760403
      28   46.024747
      29   37.974657
      30   74.426649
      31    8.190773
      32  107.725797
      33    9.010821
      34  -61.074639
      35   -7.751547
      36  -36.215341
      37  -32.451973
      38  -13.637705
      39   28.625699
      40  -61.066608
      41  -63.149637
      42  -94.577536

