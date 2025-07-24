# Whole workflow works consistently

    Code
      set.seed(42)
      getLinearRegressions(getBetaMetrics(resampling(gridding(meta, btf), measure = "ABUNDANCE",
      resamps = 1L), measure = "ABUNDANCE"), divType = "beta")
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
      16     211_529239      JaccardDiss  3.530470e-03 8.322757e-01            0
      17     211_529239 MorisitaHornDiss  1.992507e-03 9.631687e-01            0
      18     211_529239   BrayCurtisDiss -7.095148e-04 9.818433e-01            0
      19     211_525598      JaccardDiss  1.278094e-02 4.487828e-01            0
      20     211_525598 MorisitaHornDiss  3.551656e-02 4.227943e-01            0
      21     211_525598   BrayCurtisDiss  1.301650e-02 6.129288e-01            0
      22     211_521960      JaccardDiss  5.948235e-03 6.837945e-01            0
      23     211_521960 MorisitaHornDiss  3.667050e-02 3.093164e-01            0
      24     211_521960   BrayCurtisDiss  2.307049e-02 3.866386e-01            0
      25     211_523410      JaccardDiss  1.630804e-02 5.818831e-01            0
      26     211_523410 MorisitaHornDiss  2.733634e-02 5.941606e-01            0
      27     211_523410   BrayCurtisDiss  3.506641e-02 3.114953e-01            0
      28     211_517585      JaccardDiss  1.415584e-02 8.500299e-01            0
      29     211_517585 MorisitaHornDiss -7.452762e-02 6.199935e-01            0
      30     211_517585   BrayCurtisDiss -4.887046e-02 6.164565e-01            0
      31     211_516855      JaccardDiss -3.321078e-02 4.742078e-02            1
      32     211_516855 MorisitaHornDiss -1.597223e-02 7.883851e-01            0
      33     211_516855   BrayCurtisDiss -1.860710e-02 8.725725e-01            0
      34     333_426984      JaccardDiss -3.500063e-03 1.798133e-01            0
      35     333_426984 MorisitaHornDiss -2.566129e-03 6.364875e-01            0
      36     333_426984   BrayCurtisDiss -6.037783e-04 8.635878e-01            0
      37    372_2374518      JaccardDiss -3.819820e-02 1.732131e-01            0
      38    372_2374518 MorisitaHornDiss -3.200000e-03 9.724946e-01            0
      39    372_2374518   BrayCurtisDiss -1.616930e-03 9.732820e-01            0
      40    372_2378881      JaccardDiss -1.492762e-02 7.326181e-01            0
      41    372_2378881 MorisitaHornDiss -1.915546e-01 2.323427e-01            0
      42    372_2378881   BrayCurtisDiss -5.255309e-02 4.102329e-01            0
      43    372_2426320      JaccardDiss -7.042233e-02 2.583769e-01            0
      44    372_2426320 MorisitaHornDiss -5.586665e-02 1.281251e-01            0
      45    372_2426320   BrayCurtisDiss -7.395699e-02 1.198980e-01            0
      46    372_2427777      JaccardDiss -4.132035e-02 2.489149e-01            0
      47    372_2427777 MorisitaHornDiss  4.187276e-02 1.017532e-02            1
      48    372_2427777   BrayCurtisDiss  4.741979e-02 6.492477e-02            0
      49    372_2428506      JaccardDiss  1.546377e-02 2.006465e-01            0
      50    372_2428506 MorisitaHornDiss  3.295799e-04 9.867086e-01            0
      51    372_2428506   BrayCurtisDiss  5.672591e-03 7.811793e-01            0
      52    372_2426316      JaccardDiss -4.141707e-02 2.045922e-01            0
      53    372_2426316 MorisitaHornDiss -5.617189e-03 9.293326e-01            0
      54    372_2426316   BrayCurtisDiss -1.101554e-02 8.235250e-01            0
      55    372_2408087      JaccardDiss -5.960784e-02 2.061337e-01            0
      56    372_2408087 MorisitaHornDiss -1.313172e-02 7.890493e-01            0
      57    372_2408087   BrayCurtisDiss -5.616281e-02 1.924379e-01            0
      58    372_2399318      JaccardDiss -5.337674e-02 1.538279e-01            0
      59    372_2399318 MorisitaHornDiss  5.051641e-03 8.705232e-01            0
      60    372_2399318   BrayCurtisDiss -3.617613e-02 3.460636e-01            0
      61    372_2347502      JaccardDiss -3.903941e-02 2.976020e-01            0
      62    372_2347502 MorisitaHornDiss  2.487282e-02 7.007890e-01            0
      63    372_2347502   BrayCurtisDiss  5.651578e-02 4.134829e-01            0
      64    372_2430698      JaccardDiss -4.104647e-02 2.590852e-01            0
      65    372_2430698 MorisitaHornDiss -3.188692e-02 4.459985e-01            0
      66    372_2430698   BrayCurtisDiss -1.889129e-02 5.632688e-01            0
      67    372_2428503      JaccardDiss  3.343109e-03 9.299202e-01            0
      68    372_2428503 MorisitaHornDiss -4.061383e-02 4.701373e-01            0
      69    372_2428503   BrayCurtisDiss -3.025434e-02 4.784042e-01            0
      70    372_2408078      JaccardDiss  9.410256e-02 5.118360e-03            1
      71    372_2408078 MorisitaHornDiss -2.370370e-02 4.746781e-01            0
      72    372_2408078   BrayCurtisDiss  3.359519e-02 3.409588e-01            0
      73    372_2397858      JaccardDiss -2.145297e-02 7.023312e-01            0
      74    372_2397858 MorisitaHornDiss -2.862894e-02 6.064956e-01            0
      75    372_2397858   BrayCurtisDiss -1.529447e-02 8.068983e-01            0
      76    372_2400785      JaccardDiss  1.391912e-02 6.798409e-01            0
      77    372_2400785 MorisitaHornDiss  8.332758e-03 6.632109e-01            0
      78    372_2400785   BrayCurtisDiss  2.144014e-02 1.388329e-01            0
      79    372_2437271      JaccardDiss  5.058651e-03 8.943070e-01            0
      80    372_2437271 MorisitaHornDiss  8.168811e-03 5.410503e-01            0
      81    372_2437271   BrayCurtisDiss  5.447740e-03 7.601520e-01            0
      82    372_2424858      JaccardDiss -2.334477e-02 5.658184e-01            0
      83    372_2424858 MorisitaHornDiss -1.130216e-02 8.483954e-01            0
      84    372_2424858   BrayCurtisDiss -1.542949e-02 7.059425e-01            0
      85    372_2410991      JaccardDiss -3.677331e-03 9.191999e-01            0
      86    372_2410991 MorisitaHornDiss -1.919561e-02 6.334728e-01            0
      87    372_2410991   BrayCurtisDiss -2.411749e-02 6.239361e-01            0
      88    372_2375241      JaccardDiss  3.658660e-03 6.988827e-01            0
      89    372_2375241 MorisitaHornDiss -9.371925e-04 9.835923e-01            0
      90    372_2375241   BrayCurtisDiss  1.164484e-02 6.637715e-01            0
      91    372_2406610      JaccardDiss -5.232642e-03 8.779507e-01            0
      92    372_2406610 MorisitaHornDiss  5.940313e-02 8.434555e-02            0
      93    372_2406610   BrayCurtisDiss  6.565902e-02 7.361656e-03            1
      94    372_2459963      JaccardDiss -2.631216e-02 5.641774e-01            0
      95    372_2459963 MorisitaHornDiss -2.693030e-02 2.330721e-01            0
      96    372_2459963   BrayCurtisDiss -2.850156e-02 1.988471e-01            0
      97    372_2442444      JaccardDiss  2.838828e-01 3.373396e-01            0
      98    372_2442444 MorisitaHornDiss  4.390241e-01 3.372876e-01            0
      99    372_2442444   BrayCurtisDiss  3.232323e-01 3.384415e-01            0
      100   372_2434415      JaccardDiss -2.930154e-02 6.012735e-01            0
      101   372_2434415 MorisitaHornDiss  4.053692e-02 1.978815e-01            0
      102   372_2434415   BrayCurtisDiss  2.837124e-02 4.389224e-01            0
      103   372_2367201      JaccardDiss  2.194169e-02 4.898121e-01            0
      104   372_2367201 MorisitaHornDiss -1.253263e-02 7.387797e-01            0
      105   372_2367201   BrayCurtisDiss  8.332890e-03 8.105601e-01            0
      106   372_2440940      JaccardDiss -1.086957e-02 7.988322e-01            0
      107   372_2440940 MorisitaHornDiss  1.946862e-02 3.657453e-01            0
      108   372_2440940   BrayCurtisDiss  3.066231e-03 9.458876e-01            0
      109   372_2443127      JaccardDiss  6.669868e-02 9.696515e-02            0
      110   372_2443127 MorisitaHornDiss  7.124752e-03 9.008638e-01            0
      111   372_2443127   BrayCurtisDiss  3.575307e-02 2.973160e-01            0
      112   372_2432888      JaccardDiss -3.853801e-02 4.632395e-01            0
      113   372_2432888 MorisitaHornDiss  2.200378e-02 8.665000e-01            0
      114   372_2432888   BrayCurtisDiss -7.601976e-03 8.567693e-01            0
      115   372_2428509      JaccardDiss -9.983516e-02 6.767967e-02            0
      116   372_2428509 MorisitaHornDiss -1.563961e-01 1.700481e-01            0
      117   372_2428509   BrayCurtisDiss -8.309950e-02 1.327421e-01            0
      118   372_2432885      JaccardDiss -2.892857e-01 2.254033e-01            0
      119   372_2432885 MorisitaHornDiss -2.975405e-01 2.254033e-01            0
      120   372_2432885   BrayCurtisDiss -2.640767e-01 2.254033e-01            0
      121   372_2421957      JaccardDiss  2.910053e-02 8.370296e-01            0
      122   372_2421957 MorisitaHornDiss -1.223772e-01 3.750566e-01            0
      123   372_2421957   BrayCurtisDiss  3.613369e-03 9.602920e-01            0
      124   372_2406614      JaccardDiss -2.230157e-02 5.029968e-01            0
      125   372_2406614 MorisitaHornDiss -2.227165e-02 7.542979e-01            0
      126   372_2406614   BrayCurtisDiss -2.630356e-02 5.247618e-01            0
      127   372_2402963      JaccardDiss -1.261941e-02 6.654849e-01            0
      128   372_2402963 MorisitaHornDiss -2.148401e-02 6.778873e-01            0
      129   372_2402963   BrayCurtisDiss -2.414529e-03 9.427238e-01            0
      130   372_2426315      JaccardDiss -5.928854e-03 8.304062e-01            0
      131   372_2426315 MorisitaHornDiss  7.479867e-02 5.658614e-01            0
      132   372_2426315   BrayCurtisDiss  3.611484e-02 4.543808e-01            0
      133   372_2427046      JaccardDiss -1.412338e-02 5.786922e-01            0
      134   372_2427046 MorisitaHornDiss -1.844753e-02 4.920935e-01            0
      135   372_2427046   BrayCurtisDiss  9.705892e-03 7.293620e-01            0
      136   372_2403683      JaccardDiss  5.769231e-02 3.433747e-01            0
      137   372_2403683 MorisitaHornDiss -8.737828e-02 5.061814e-01            0
      138   372_2403683   BrayCurtisDiss -1.815294e-02 8.463842e-01            0
      139   372_2369392      JaccardDiss -2.826017e-02 6.432493e-01            0
      140   372_2369392 MorisitaHornDiss  4.312189e-02 7.110788e-01            0
      141   372_2369392   BrayCurtisDiss  3.733211e-02 6.560098e-01            0
      142   372_2400047      JaccardDiss  8.349273e-03 7.231496e-01            0
      143   372_2400047 MorisitaHornDiss -2.242607e-03 9.326121e-01            0
      144   372_2400047   BrayCurtisDiss  2.530789e-03 9.124545e-01            0
      145   372_2431454      JaccardDiss  1.311960e-02 6.257317e-01            0
      146   372_2431454 MorisitaHornDiss  1.134975e-02 7.793652e-01            0
      147   372_2431454   BrayCurtisDiss -1.307887e-02 7.601309e-01            0
      148   372_2443903      JaccardDiss  3.306230e-02 5.864191e-01            0
      149   372_2443903 MorisitaHornDiss  7.952264e-02 3.555310e-01            0
      150   372_2443903   BrayCurtisDiss  5.331189e-02 4.140962e-01            0
      151   372_2394207      JaccardDiss  9.517703e-03 7.521684e-01            0
      152   372_2394207 MorisitaHornDiss  6.576474e-03 7.022169e-01            0
      153   372_2394207   BrayCurtisDiss -1.333173e-05 9.994981e-01            0
      154   372_2362812      JaccardDiss -2.707633e-02 8.317831e-01            0
      155   372_2362812 MorisitaHornDiss -3.473803e-02 7.140298e-01            0
      156   372_2362812   BrayCurtisDiss  1.031517e-02 4.168310e-01            0
      157   372_2410264      JaccardDiss -2.210490e-02 6.359116e-01            0
      158   372_2410264 MorisitaHornDiss -5.686000e-02 3.589842e-01            0
      159   372_2410264   BrayCurtisDiss -2.650305e-02 4.756116e-01            0
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
      172   372_2440221      JaccardDiss  4.418756e-02 6.409673e-01            0
      173   372_2440221 MorisitaHornDiss -4.673831e-02 3.960244e-01            0
      174   372_2440221   BrayCurtisDiss -1.505071e-02 6.893848e-01            0
      175   372_2438027      JaccardDiss -7.495462e-03 8.419623e-01            0
      176   372_2438027 MorisitaHornDiss  4.723129e-02 5.703868e-01            0
      177   372_2438027   BrayCurtisDiss -1.597176e-03 9.799154e-01            0
      178   372_2434379      JaccardDiss -3.743316e-02 2.597046e-01            0
      179   372_2434379 MorisitaHornDiss -4.382087e-02 1.366001e-01            0
      180   372_2434379   BrayCurtisDiss -1.602999e-01 1.491734e-01            0
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
      193   372_2429234      JaccardDiss -1.767128e-02 7.131265e-01            0
      194   372_2429234 MorisitaHornDiss -2.450935e-03 9.532193e-01            0
      195   372_2429234   BrayCurtisDiss -6.775249e-03 8.714687e-01            0
      196   372_2429233      JaccardDiss  2.343059e-02 4.301295e-01            0
      197   372_2429233 MorisitaHornDiss  2.879918e-02 7.084682e-01            0
      198   372_2429233   BrayCurtisDiss  3.781499e-02 6.078589e-01            0
      199   372_2425610      JaccardDiss -2.481502e-02 2.605766e-01            0
      200   372_2425610 MorisitaHornDiss -1.581525e-01 8.368063e-03            1
      201   372_2425610   BrayCurtisDiss -5.323151e-03 7.869723e-01            0
      202   372_2423417      JaccardDiss  8.333333e-03 9.729090e-01            0
      203   372_2423417 MorisitaHornDiss -1.748655e-03 9.977972e-01            0
      204   372_2423417   BrayCurtisDiss -3.488832e-03 9.934646e-01            0
      205   372_2404439      JaccardDiss -1.393260e-14 1.000000e+00            0
      206   372_2404439 MorisitaHornDiss  8.767184e-03 8.741506e-01            0
      207   372_2404439   BrayCurtisDiss -4.324007e-02 6.073445e-01            0
      208   372_2412474      JaccardDiss  6.253909e-02 7.216701e-01            0
      209   372_2412474 MorisitaHornDiss  6.151421e-02 7.410278e-01            0
      210   372_2412474   BrayCurtisDiss  9.955850e-02 1.300508e-01            0
      211   372_2419754      JaccardDiss -6.312596e-02 3.813262e-01            0
      212   372_2419754 MorisitaHornDiss  3.697797e-02 4.074886e-01            0
      213   372_2419754   BrayCurtisDiss  2.109171e-02 5.915185e-01            0
      214   372_2419028      JaccardDiss  1.082215e-02 8.392282e-01            0
      215   372_2419028 MorisitaHornDiss  5.076155e-02 5.948144e-01            0
      216   372_2419028   BrayCurtisDiss  2.742185e-02 6.745609e-01            0
      217   372_2409543      JaccardDiss  8.241758e-02 1.091826e-01            0
      218   372_2409543 MorisitaHornDiss  1.538714e-02 9.203492e-01            0
      219   372_2409543   BrayCurtisDiss  4.833333e-02 5.517498e-01            0
      220   372_2403696      JaccardDiss  3.100316e-02 2.352147e-02            1
      221   372_2403696 MorisitaHornDiss  1.536460e-02 8.837070e-01            0
      222   372_2403696   BrayCurtisDiss -7.676286e-03 8.672292e-01            0
      223   372_2400777      JaccardDiss -3.830409e-02 3.310749e-01            0
      224   372_2400777 MorisitaHornDiss -3.539547e-02 2.773248e-01            0
      225   372_2400777   BrayCurtisDiss -2.467663e-02 2.859588e-01            0
      226   372_2394218      JaccardDiss  3.482668e-02 3.597420e-01            0
      227   372_2394218 MorisitaHornDiss  4.091850e-02 6.081363e-01            0
      228   372_2394218   BrayCurtisDiss  4.067252e-02 1.704733e-01            0
      229   372_2399315      JaccardDiss -1.767457e-02 5.822545e-01            0
      230   372_2399315 MorisitaHornDiss  4.382554e-02 3.779166e-01            0
      231   372_2399315   BrayCurtisDiss  1.031126e-02 7.449079e-01            0
      232   372_2375959      JaccardDiss  5.748387e-02 1.975988e-01            0
      233   372_2375959 MorisitaHornDiss  2.712493e-02 1.773771e-01            0
      234   372_2375959   BrayCurtisDiss  4.026337e-02 1.010301e-01            0
      235   372_2363562      JaccardDiss -3.088578e-02 4.338620e-01            0
      236   372_2363562 MorisitaHornDiss  4.127414e-02 4.549160e-01            0
      237   372_2363562   BrayCurtisDiss  3.328123e-02 1.003296e-02            1
      238   372_2365726      JaccardDiss  9.159664e-02 3.273015e-01            0
      239   372_2365726 MorisitaHornDiss  1.072984e-01 1.852524e-01            0
      240   372_2365726   BrayCurtisDiss  6.039115e-02 4.170990e-01            0
      241   372_2435073      JaccardDiss  1.478697e-02 7.211138e-01            0
      242   372_2435073 MorisitaHornDiss -4.495510e-02 9.927436e-02            0
      243   372_2435073   BrayCurtisDiss -1.729577e-02 4.074058e-01            0
      244   372_2432889      JaccardDiss -1.785714e-02 6.606422e-01            0
      245   372_2432889 MorisitaHornDiss -3.217503e-02 6.606422e-01            0
      246   372_2432889   BrayCurtisDiss  3.410553e-03 9.620255e-01            0
      247   372_2433622      JaccardDiss -7.142857e-02 8.789623e-01            0
      248   372_2433622 MorisitaHornDiss -7.142857e-02 8.789623e-01            0
      249   372_2433622   BrayCurtisDiss -4.761905e-02 8.789623e-01            0
      250   372_2426326      JaccardDiss  2.500000e-01 3.333333e-01            0
      251   372_2426326 MorisitaHornDiss -1.709402e-02 9.216369e-01            0
      252   372_2426326   BrayCurtisDiss -2.466750e-14 1.000000e+00            0
      253   372_2428505      JaccardDiss  1.000000e-01 2.254033e-01            0
      254   372_2428505 MorisitaHornDiss  2.508581e-02 7.694936e-01            0
      255   372_2428505   BrayCurtisDiss  9.429632e-02 1.914472e-01            0
      256   372_2414636      JaccardDiss -2.500000e-01 3.333333e-01            0
      257   372_2414636 MorisitaHornDiss -3.750938e-04 3.333333e-01            0
      258   372_2414636   BrayCurtisDiss -2.119152e-02 8.708549e-01            0
      259   402_3191117      JaccardDiss  1.002065e-02 6.209559e-01            0
      260   402_3191117 MorisitaHornDiss  3.413513e-03 9.376674e-01            0
      261   402_3191117   BrayCurtisDiss  2.788530e-02 3.177313e-01            0
      262   402_3191116      JaccardDiss  3.739326e-02 1.671914e-01            0
      263   402_3191116 MorisitaHornDiss  5.762249e-03 9.362878e-01            0
      264   402_3191116   BrayCurtisDiss  3.169658e-02 6.788678e-01            0
      265   402_3190385      JaccardDiss  2.981693e-02 2.943622e-01            0
      266   402_3190385 MorisitaHornDiss -2.881915e-02 6.771102e-01            0
      267   402_3190385   BrayCurtisDiss -7.802869e-03 7.842066e-01            0
      268   431_5118319      JaccardDiss -6.120219e-03 8.254031e-01            0
      269   431_5118319 MorisitaHornDiss  3.107606e-02 1.676665e-01            0
      270   431_5118319   BrayCurtisDiss  1.209861e-02 5.558724e-01            0
      271   431_5122694      JaccardDiss -7.037539e-03 4.565284e-01            0
      272   431_5122694 MorisitaHornDiss -1.904726e-02 3.032747e-01            0
      273   431_5122694   BrayCurtisDiss -4.998170e-03 5.431578e-01            0
      274   431_4765710      JaccardDiss -8.928571e-02 2.122956e-01            0
      275   431_4765710 MorisitaHornDiss -8.928571e-02 2.122956e-01            0
      276   431_4765710   BrayCurtisDiss -7.423756e-02 2.122956e-01            0
      277   431_5103014      JaccardDiss  1.875000e-01 1.210377e-01            0
      278   431_5103014 MorisitaHornDiss  4.508239e-01 2.674443e-01            0
      279   431_5103014   BrayCurtisDiss  3.370859e-01 2.649574e-01            0
      280   431_4749643      JaccardDiss  3.944020e-02 3.858569e-01            0
      281   431_4749643 MorisitaHornDiss  3.678184e-02 4.239438e-01            0
      282   431_4749643   BrayCurtisDiss  4.325700e-02 3.437346e-01            0
      283   431_4750373      JaccardDiss  6.024096e-03 9.366276e-01            0
      284   431_4750373 MorisitaHornDiss  1.199820e-02 9.366276e-01            0
      285   431_4750373   BrayCurtisDiss  5.829771e-03 9.366276e-01            0
      286   431_4751834      JaccardDiss  0.000000e+00          NaN           NA
      287   431_4751834 MorisitaHornDiss  0.000000e+00          NaN           NA
      288   431_4751834   BrayCurtisDiss  0.000000e+00          NaN           NA
      289   431_5120509      JaccardDiss -3.991038e-03 5.322808e-01            0
      290   431_5120509 MorisitaHornDiss  1.631063e-02 2.057240e-01            0
      291   431_5120509   BrayCurtisDiss  1.624345e-02 2.301430e-01            0
      292   431_5132911      JaccardDiss -8.521303e-03 7.031386e-01            0
      293   431_5132911 MorisitaHornDiss -5.572041e-03 8.590033e-01            0
      294   431_5132911   BrayCurtisDiss -1.157932e-02 4.313288e-01            0
      295   431_5133641      JaccardDiss -3.237179e-17 4.785132e-02            1
      296   431_5133641 MorisitaHornDiss  8.851463e-03 6.188153e-01            0
      297   431_5133641   BrayCurtisDiss  1.251574e-02 3.686561e-01            0
      298   431_5132912      JaccardDiss  2.918425e-02 3.806238e-01            0
      299   431_5132912 MorisitaHornDiss  1.959835e-02 7.268793e-01            0
      300   431_5132912   BrayCurtisDiss  5.952605e-03 6.126116e-01            0
      301   431_4745246      JaccardDiss  8.535071e-03 4.660607e-01            0
      302   431_4745246 MorisitaHornDiss  5.492880e-02 3.243551e-03            1
      303   431_4745246   BrayCurtisDiss  3.685727e-03 2.296022e-01            0
      304   431_5104466      JaccardDiss -1.484480e-02 7.723926e-01            0
      305   431_5104466 MorisitaHornDiss -4.567632e-03 7.723926e-01            0
      306   431_5104466   BrayCurtisDiss -7.422402e-03 7.723926e-01            0
      307   431_4764980      JaccardDiss -3.211009e-02 6.055959e-01            0
      308   431_4764980 MorisitaHornDiss -3.211009e-02 6.055959e-01            0
      309   431_4764980   BrayCurtisDiss -3.211009e-02 6.055959e-01            0
      310   431_5122695      JaccardDiss -3.919142e-03 8.502029e-01            0
      311   431_5122695 MorisitaHornDiss -1.912207e-02 5.492964e-01            0
      312   431_5122695   BrayCurtisDiss -3.287185e-03 8.094094e-01            0
      313   431_5100824      JaccardDiss  1.086957e-02 7.598349e-01            0
      314   431_5100824 MorisitaHornDiss  1.086957e-02 7.598349e-01            0
      315   431_5100824   BrayCurtisDiss  1.086957e-02 7.598349e-01            0
      316   431_5101551      JaccardDiss  0.000000e+00          NaN           NA
      317   431_5101551 MorisitaHornDiss  0.000000e+00          NaN           NA
      318   431_5101551   BrayCurtisDiss  0.000000e+00          NaN           NA
      319   431_5101552      JaccardDiss  3.424330e-02 5.136238e-02            0
      320   431_5101552 MorisitaHornDiss  7.810696e-02 1.419081e-01            0
      321   431_5101552   BrayCurtisDiss  1.646836e-02 6.024321e-01            0
      322   431_4764250      JaccardDiss  2.750809e-02 2.927072e-01            0
      323   431_4764250 MorisitaHornDiss  3.841647e-02 2.927072e-01            0
      324   431_4764250   BrayCurtisDiss  3.300971e-02 2.927072e-01            0
      325   431_4743784      JaccardDiss  3.158602e-02 2.402720e-01            0
      326   431_4743784 MorisitaHornDiss  1.867757e-02 5.290231e-01            0
      327   431_4743784   BrayCurtisDiss  2.388885e-02 3.725687e-01            0
      328   431_5122698      JaccardDiss -7.650273e-03 4.148999e-01            0
      329   431_5122698 MorisitaHornDiss -4.787846e-02 5.582549e-02            0
      330   431_5122698   BrayCurtisDiss  3.970687e-04 9.500914e-01            0
      331   431_5111033      JaccardDiss  2.272727e-02 2.823263e-01            0
      332   431_5111033 MorisitaHornDiss  7.516522e-02 1.620566e-01            0
      333   431_5111033   BrayCurtisDiss  1.871188e-02 2.009122e-01            0
      334   431_5123428      JaccardDiss  2.053712e-02 7.046442e-01            0
      335   431_5123428 MorisitaHornDiss  3.422854e-03 7.046442e-01            0
      336   431_5123428   BrayCurtisDiss -2.013192e-02 1.817181e-01            0
      337   431_5123427      JaccardDiss  1.184834e-03 9.620224e-01            0
      338   431_5123427 MorisitaHornDiss -3.074063e-02 5.811731e-01            0
      339   431_5123427   BrayCurtisDiss -1.708791e-02 1.905393e-01            0
      340   431_5120507      JaccardDiss  6.761833e-03 7.533089e-01            0
      341   431_5120507 MorisitaHornDiss  1.343753e-02 7.533089e-01            0
      342   431_5120507   BrayCurtisDiss -1.143177e-03 9.473173e-01            0
      343   431_4756925      JaccardDiss -6.345178e-03 8.482298e-01            0
      344   431_4756925 MorisitaHornDiss -5.489912e-03 8.463623e-01            0
      345   431_4756925   BrayCurtisDiss -7.360406e-03 8.162582e-01            0
      346   431_5124881      JaccardDiss  1.666667e-02 3.333333e-01            0
      347   431_5124881 MorisitaHornDiss  4.605263e-02 3.333333e-01            0
      348   431_5124881   BrayCurtisDiss  2.500000e-02 3.333333e-01            0
      349   431_5119779      JaccardDiss -3.853047e-03 5.195660e-01            0
      350   431_5119779 MorisitaHornDiss -1.715669e-03 3.567426e-01            0
      351   431_5119779   BrayCurtisDiss -1.013015e-03 4.766860e-01            0
      352   431_4748913      JaccardDiss -1.964183e-02 7.538188e-02            0
      353   431_4748913 MorisitaHornDiss -2.846872e-02 2.284897e-01            0
      354   431_4748913   BrayCurtisDiss -1.735865e-02 2.800730e-01            0
      355   431_4756217      JaccardDiss -2.096774e-02 3.504545e-01            0
      356   431_4756217 MorisitaHornDiss -1.352758e-03 3.504545e-01            0
      357   431_4756217   BrayCurtisDiss  4.659200e-03 8.403353e-01            0
      358   431_5102284      JaccardDiss  6.944444e-03 7.849694e-01            0
      359   431_5102284 MorisitaHornDiss -1.275507e-02 8.111860e-01            0
      360   431_5102284   BrayCurtisDiss  1.216509e-02 7.648947e-01            0
      361   431_5102282      JaccardDiss  1.020408e-02 9.175214e-01            0
      362   431_5102282 MorisitaHornDiss  1.020408e-02 9.175214e-01            0
      363   431_5102282   BrayCurtisDiss  1.020408e-02 9.175214e-01            0
      364   431_5113947      JaccardDiss  5.711744e-02 1.964029e-01            0
      365   431_5113947 MorisitaHornDiss  8.427646e-02 4.698581e-02            1
      366   431_5113947   BrayCurtisDiss  1.478449e-02 1.350121e-01            0
      367   431_4770803      JaccardDiss -2.325581e-02 5.823435e-01            0
      368   431_4770803 MorisitaHornDiss -3.305610e-02 5.823435e-01            0
      369   431_4770803   BrayCurtisDiss -3.283174e-02 5.823435e-01            0
      370   431_5101553      JaccardDiss  7.142857e-02 8.789623e-01            0
      371   431_5101553 MorisitaHornDiss  7.142857e-02 8.789623e-01            0
      372   431_5101553   BrayCurtisDiss  7.142857e-02 8.789623e-01            0
      373   431_5101555      JaccardDiss -2.187500e-02 5.592607e-01            0
      374   431_5101555 MorisitaHornDiss -7.993891e-04 9.826697e-01            0
      375   431_5101555   BrayCurtisDiss -2.604167e-04 9.929278e-01            0
      376   431_5124152      JaccardDiss  2.947404e-18 7.723926e-01            0
      377   431_5124152 MorisitaHornDiss  2.947404e-18 7.723926e-01            0
      378   431_5124152   BrayCurtisDiss  2.947404e-18 7.723926e-01            0
      379   431_5100825      JaccardDiss -9.713701e-03 8.351057e-01            0
      380   431_5100825 MorisitaHornDiss  3.001290e-02 1.112136e-01            0
      381   431_5100825   BrayCurtisDiss  1.571547e-02 6.560935e-02            0
      382   431_5121236      JaccardDiss  1.133461e-02 3.298009e-01            0
      383   431_5121236 MorisitaHornDiss  7.173865e-03 8.470315e-01            0
      384   431_5121236   BrayCurtisDiss  9.481333e-03 1.711937e-01            0
      385   431_4749644      JaccardDiss  8.009153e-03 5.574822e-01            0
      386   431_4749644 MorisitaHornDiss  2.402746e-03 5.574822e-01            0
      387   431_4749644   BrayCurtisDiss  6.006865e-03 5.574822e-01            0
      388   431_4750374      JaccardDiss -1.020408e-02 7.579246e-01            0
      389   431_4750374 MorisitaHornDiss -2.408317e-02 7.029289e-01            0
      390   431_4750374   BrayCurtisDiss -1.311545e-02 6.240748e-01            0
      391   431_4781744      JaccardDiss  1.428571e-01 5.456289e-01            0
      392   431_4781744 MorisitaHornDiss  1.428571e-01 5.456289e-01            0
      393   431_4781744   BrayCurtisDiss  1.428571e-01 5.456289e-01            0
      394   431_4749627      JaccardDiss -1.666667e-02 1.599305e-01            0
      395   431_4749627 MorisitaHornDiss -8.934092e-03 6.304718e-01            0
      396   431_4749627   BrayCurtisDiss -8.214286e-03 5.832385e-01            0
      397   431_5123423      JaccardDiss -1.834862e-03 8.821584e-01            0
      398   431_5123423 MorisitaHornDiss  1.256589e-02 1.128592e-01            0
      399   431_5123423   BrayCurtisDiss  2.473123e-03 5.739112e-01            0
      400   431_4740155      JaccardDiss  2.991453e-02 1.146170e-02            1
      401   431_4740155 MorisitaHornDiss  1.424501e-02 1.146170e-02            1
      402   431_4740155   BrayCurtisDiss  1.994302e-02 1.146170e-02            1
      403   431_5120508      JaccardDiss  9.848485e-03 6.162787e-01            0
      404   431_5120508 MorisitaHornDiss  2.705654e-02 4.976100e-01            0
      405   431_5120508   BrayCurtisDiss  1.165153e-02 6.672874e-01            0
      406   431_5116133      JaccardDiss -1.724138e-02 6.783662e-01            0
      407   431_5116133 MorisitaHornDiss -4.597701e-02 6.286093e-01            0
      408   431_5116133   BrayCurtisDiss -3.287682e-02 5.602455e-01            0
      409   431_4743055      JaccardDiss  1.203966e-02 7.833485e-01            0
      410   431_4743055 MorisitaHornDiss  9.915014e-03 8.183816e-01            0
      411   431_4743055   BrayCurtisDiss  1.331445e-02 6.071318e-01            0
      412   431_4764249      JaccardDiss  1.785714e-01 2.122956e-01            0
      413   431_4764249 MorisitaHornDiss  1.190476e-01 2.122956e-01            0
      414   431_4764249   BrayCurtisDiss  2.142857e-01 2.122956e-01            0
      415   431_4751103      JaccardDiss  2.222222e-02 7.018576e-01            0
      416   431_4751103 MorisitaHornDiss  2.962963e-02 7.018576e-01            0
      417   431_4751103   BrayCurtisDiss  2.777778e-02 6.868879e-01            0
      418   431_4743804      JaccardDiss  2.179599e-02 2.252223e-01            0
      419   431_4743804 MorisitaHornDiss  2.366422e-02 2.573832e-01            0
      420   431_4743804   BrayCurtisDiss  8.068668e-03 6.443739e-01            0
      421   431_5125612      JaccardDiss -1.797862e-02 2.977982e-02            1
      422   431_5125612 MorisitaHornDiss -2.498702e-02 6.913652e-01            0
      423   431_5125612   BrayCurtisDiss -2.096175e-02 6.849153e-01            0
      424   431_4758387      JaccardDiss -4.166667e-02 6.666667e-01            0
      425   431_4758387 MorisitaHornDiss  1.158437e-01 2.512152e-01            0
      426   431_4758387   BrayCurtisDiss  1.365067e-01 3.116773e-01            0
      427   431_4756196      JaccardDiss -8.333333e-02 1.339746e-01            0
      428   431_4756196 MorisitaHornDiss -8.333333e-02 1.339746e-01            0
      429   431_4756196   BrayCurtisDiss -2.192982e-02 1.339746e-01            0
      430   431_5113218      JaccardDiss -3.761905e-02 3.360346e-01            0
      431   431_5113218 MorisitaHornDiss -1.413242e-02 7.629721e-01            0
      432   431_5113218   BrayCurtisDiss -7.309591e-03 8.733064e-01            0
      433   431_4735777      JaccardDiss  1.552660e-02 2.286681e-01            0
      434   431_4735777 MorisitaHornDiss  1.462049e-02 4.992548e-01            0
      435   431_4735777   BrayCurtisDiss  8.232159e-03 2.651400e-01            0
      436   431_5101554      JaccardDiss -3.025000e-02 3.809417e-01            0
      437   431_5101554 MorisitaHornDiss -3.291594e-02 3.368202e-01            0
      438   431_5101554   BrayCurtisDiss -3.280000e-02 3.383305e-01            0
      439   431_4752549      JaccardDiss -1.260629e-02 2.653394e-01            0
      440   431_4752549 MorisitaHornDiss -4.605506e-02 6.505236e-02            0
      441   431_4752549   BrayCurtisDiss -2.227438e-02 1.221762e-01            0
      442   431_4755487      JaccardDiss -1.494446e-17 5.672414e-01            0
      443   431_4755487 MorisitaHornDiss -1.494446e-17 5.672414e-01            0
      444   431_4755487   BrayCurtisDiss -1.494446e-17 5.672414e-01            0
      445   431_4754005      JaccardDiss  1.388889e-02 9.005747e-01            0
      446   431_4754005 MorisitaHornDiss -8.793290e-03 8.851274e-01            0
      447   431_4754005   BrayCurtisDiss -2.525253e-02 5.260613e-01            0
      448   431_4749628      JaccardDiss -1.395982e-02 2.434600e-01            0
      449   431_4749628 MorisitaHornDiss -2.853955e-02 2.434600e-01            0
      450   431_4749628   BrayCurtisDiss -1.155296e-02 2.434600e-01            0
      451   431_4781020      JaccardDiss -3.846154e-02 4.877543e-01            0
      452   431_4781020 MorisitaHornDiss -1.357466e-02 4.877543e-01            0
      453   431_4781020   BrayCurtisDiss  2.838338e-03 9.072507e-01            0
      454   431_4744516      JaccardDiss -1.414451e-02 2.090852e-01            0
      455   431_4744516 MorisitaHornDiss -1.980232e-03 2.090852e-01            0
      456   431_4744516   BrayCurtisDiss  2.638466e-03 8.347289e-01            0
      457   431_4781014      JaccardDiss -2.241379e-02 3.766977e-01            0
      458   431_4781014 MorisitaHornDiss -2.359347e-02 3.766977e-01            0
      459   431_4781014   BrayCurtisDiss -2.241379e-02 3.766977e-01            0
      460   431_4781021      JaccardDiss -1.889339e-02 6.057312e-01            0
      461   431_4781021 MorisitaHornDiss -9.957326e-04 6.057312e-01            0
      462   431_4781021   BrayCurtisDiss -2.195068e-02 6.365026e-01            0
      463   431_4737966      JaccardDiss  8.928571e-02 2.122956e-01            0
      464   431_4737966 MorisitaHornDiss  9.973736e-03 2.122956e-01            0
      465   431_4737966   BrayCurtisDiss  3.401361e-02 2.122956e-01            0
      466   431_4764251      JaccardDiss  1.480305e-17 6.768684e-01            0
      467   431_4764251 MorisitaHornDiss  1.480305e-17 6.768684e-01            0
      468   431_4764251   BrayCurtisDiss  1.480305e-17 6.768684e-01            0
      469   431_4781015      JaccardDiss -2.027027e-02 6.512571e-01            0
      470   431_4781015 MorisitaHornDiss -4.052584e-02 6.512571e-01            0
      471   431_4781015   BrayCurtisDiss -8.245534e-03 6.512571e-01            0
      472   431_5113944      JaccardDiss  3.985507e-02 1.910890e-01            0
      473   431_5113944 MorisitaHornDiss  2.089272e-02 1.687016e-01            0
      474   431_5113944   BrayCurtisDiss  5.835222e-03 5.266867e-01            0
      475   431_5111762      JaccardDiss -6.024096e-02 4.511787e-01            0
      476   431_5111762 MorisitaHornDiss -1.188315e-01 4.511787e-01            0
      477   431_5111762   BrayCurtisDiss -2.771084e-02 6.915737e-01            0
      478   431_5115406      JaccardDiss  0.000000e+00          NaN           NA
      479   431_5115406 MorisitaHornDiss -1.696386e-02 8.067647e-01            0
      480   431_5115406   BrayCurtisDiss  2.916667e-02 8.666773e-01            0
      481   431_4751102      JaccardDiss -5.000000e-01 3.333333e-01            0
      482   431_4751102 MorisitaHornDiss -5.000000e-01 3.333333e-01            0
      483   431_4751102   BrayCurtisDiss -3.333333e-01 3.333333e-01            0
      484   431_4736507      JaccardDiss -3.861789e-03 8.147107e-01            0
      485   431_4736507 MorisitaHornDiss  1.010676e-02 7.752893e-01            0
      486   431_4736507   BrayCurtisDiss  6.445993e-03 7.270460e-01            0
      487   431_4782480      JaccardDiss -1.326531e-01 2.420754e-01            0
      488   431_4782480 MorisitaHornDiss -1.326531e-01 2.420754e-01            0
      489   431_4782480   BrayCurtisDiss -1.105442e-01 2.420754e-01            0
      490   431_4776662      JaccardDiss  2.815315e-02 4.827163e-01            0
      491   431_4776662 MorisitaHornDiss  2.290603e-03 8.694407e-01            0
      492   431_4776662   BrayCurtisDiss -5.700133e-03 8.160248e-01            0
      493   431_4752550      JaccardDiss  2.255639e-02 6.625802e-02            0
      494   431_4752550 MorisitaHornDiss  1.773157e-02 2.852968e-01            0
      495   431_4752550   BrayCurtisDiss  2.022449e-02 2.155984e-01            0
      496   431_5109574      JaccardDiss -1.282051e-02 7.245413e-01            0
      497   431_5109574 MorisitaHornDiss -2.680414e-02 6.000201e-01            0
      498   431_5109574   BrayCurtisDiss -2.574003e-02 5.376391e-01            0
      499   431_4745264      JaccardDiss -3.337899e-18 2.826335e-01            0
      500   431_4745264 MorisitaHornDiss -3.337899e-18 2.826335e-01            0
      501   431_4745264   BrayCurtisDiss -3.337899e-18 2.826335e-01            0
      502   431_4740146      JaccardDiss -2.244898e-02 4.245912e-01            0
      503   431_4740146 MorisitaHornDiss -4.767774e-02 4.245912e-01            0
      504   431_4740146   BrayCurtisDiss -6.413994e-03 4.245912e-01            0
      505   431_4754011      JaccardDiss -1.416795e-03 8.633014e-01            0
      506   431_4754011 MorisitaHornDiss  1.130055e-02 1.804487e-01            0
      507   431_4754011   BrayCurtisDiss  5.358431e-03 7.647385e-01            0
      508   431_4754757      JaccardDiss -1.173184e-01 9.378311e-02            0
      509   431_4754757 MorisitaHornDiss -1.173184e-01 9.378311e-02            0
      510   431_4754757   BrayCurtisDiss -5.865922e-02 9.378311e-02            0
      511   431_4750359      JaccardDiss  1.790634e-02 2.599978e-01            0
      512   431_4750359 MorisitaHornDiss -1.083249e-02 5.232176e-01            0
      513   431_4750359   BrayCurtisDiss -5.902659e-03 6.200804e-01            0
      514   431_4745247      JaccardDiss -2.592781e-02 2.818823e-01            0
      515   431_4745247 MorisitaHornDiss -2.591474e-02 2.818823e-01            0
      516   431_4745247   BrayCurtisDiss -1.238590e-02 2.818823e-01            0
      517   431_5094987      JaccardDiss -2.000000e-01 2.254033e-01            0
      518   431_5094987 MorisitaHornDiss -1.761642e-02 2.254033e-01            0
      519   431_5094987   BrayCurtisDiss -4.660087e-02 4.773386e-01            0
      520   431_4752551      JaccardDiss  3.623188e-02 1.886857e-01            0
      521   431_4752551 MorisitaHornDiss  3.517815e-02 1.204316e-01            0
      522   431_4752551   BrayCurtisDiss  1.508448e-02 6.339126e-01            0
      523   431_4753280      JaccardDiss -1.885831e-02 3.722702e-01            0
      524   431_4753280 MorisitaHornDiss  1.707199e-02 5.428723e-02            0
      525   431_4753280   BrayCurtisDiss  1.785911e-02 2.124104e-01            0
      526   431_4751821      JaccardDiss  1.564380e-02 5.927123e-01            0
      527   431_4751821 MorisitaHornDiss  2.371961e-02 1.665767e-01            0
      528   431_4751821   BrayCurtisDiss  6.391916e-03 7.149820e-01            0
      529   431_4743785      JaccardDiss -1.265823e-02 1.476370e-01            0
      530   431_4743785 MorisitaHornDiss -1.265823e-02 1.476370e-01            0
      531   431_4743785   BrayCurtisDiss -5.063291e-03 1.476370e-01            0
      532   431_4756195      JaccardDiss  1.759324e-02 1.848276e-04            1
      533   431_4756195 MorisitaHornDiss  3.085649e-02 2.718768e-03            1
      534   431_4756195   BrayCurtisDiss  2.098985e-02 8.599015e-03            1
      535   431_4754008      JaccardDiss  1.960704e-14 1.000000e+00            0
      536   431_4754008 MorisitaHornDiss  1.510773e-14 1.000000e+00            0
      537   431_4754008   BrayCurtisDiss -2.539683e-02 8.566661e-01            0
      538   431_4753279      JaccardDiss  3.070175e-02 6.633290e-01            0
      539   431_4753279 MorisitaHornDiss  3.070175e-02 6.633290e-01            0
      540   431_4753279   BrayCurtisDiss  2.453237e-02 4.474178e-01            0
      541   431_4753278      JaccardDiss  7.231405e-03 8.988265e-01            0
      542   431_4753278 MorisitaHornDiss  7.829491e-03 8.897914e-01            0
      543   431_4753278   BrayCurtisDiss  1.584022e-02 7.407878e-01            0
      544   431_4754006      JaccardDiss  3.571429e-01 2.122956e-01            0
      545   431_4754006 MorisitaHornDiss  3.571429e-01 2.122956e-01            0
      546   431_4754006   BrayCurtisDiss  5.102041e-02 2.122956e-01            0
      547   437_2075128      JaccardDiss  1.109139e-02 7.481094e-01            0
      548   437_2075128 MorisitaHornDiss  3.186167e-02 4.781420e-01            0
      549   437_2075128   BrayCurtisDiss  2.186074e-02 4.764461e-01            0
      550   437_2077319      JaccardDiss -4.291412e-02 2.737488e-03            1
      551   437_2077319 MorisitaHornDiss -8.161581e-02 1.088658e-01            0
      552   437_2077319   BrayCurtisDiss -5.073505e-02 5.308646e-02            0
      553   437_2076590      JaccardDiss -4.229259e-02 6.689059e-02            0
      554   437_2076590 MorisitaHornDiss -2.409339e-02 6.665780e-01            0
      555   437_2076590   BrayCurtisDiss -4.014855e-02 4.853487e-02            1
      556   437_2078777      JaccardDiss -9.224643e-03 4.638123e-01            0
      557   437_2078777 MorisitaHornDiss -5.679039e-02 5.576998e-02            0
      558   437_2078777   BrayCurtisDiss -4.161940e-02 6.385536e-02            0
      559   437_2076589      JaccardDiss  1.506136e-02 1.793857e-01            0
      560   437_2076589 MorisitaHornDiss  3.914285e-02 3.214003e-01            0
      561   437_2076589   BrayCurtisDiss  2.712042e-02 1.016688e-01            0
      562   437_2075860      JaccardDiss -3.679716e-02 2.337099e-01            0
      563   437_2075860 MorisitaHornDiss -6.724137e-02 1.160435e-01            0
      564   437_2075860   BrayCurtisDiss -5.480613e-02 2.151844e-01            0
      565   437_2074400      JaccardDiss  1.391352e-02 5.952543e-01            0
      566   437_2074400 MorisitaHornDiss  1.591072e-02 6.069530e-01            0
      567   437_2074400   BrayCurtisDiss  1.689664e-02 5.029739e-01            0
      568   437_2074399      JaccardDiss  3.065634e-02 7.902396e-02            0
      569   437_2074399 MorisitaHornDiss -1.487758e-03 9.702324e-01            0
      570   437_2074399   BrayCurtisDiss  3.607616e-02 4.608442e-01            0
      571    466_544469      JaccardDiss  2.181455e-03 4.705203e-01            0
      572    466_544469 MorisitaHornDiss -2.924266e-02 1.028374e-01            0
      573    466_544469   BrayCurtisDiss -1.718643e-02 2.044255e-01            0
      574    466_541561      JaccardDiss  7.233741e-03 3.788266e-01            0
      575    466_541561 MorisitaHornDiss -7.775125e-04 9.532931e-01            0
      576    466_541561   BrayCurtisDiss -8.761381e-03 3.714550e-01            0
      577    466_544468      JaccardDiss  3.510864e-03 5.015513e-01            0
      578    466_544468 MorisitaHornDiss  5.573931e-03 4.031761e-01            0
      579    466_544468   BrayCurtisDiss  6.433366e-03 3.277253e-01            0
      580    466_541560      JaccardDiss  8.609426e-04 8.127899e-01            0
      581    466_541560 MorisitaHornDiss  2.506482e-02 1.219796e-02            1
      582    466_541560   BrayCurtisDiss  2.161523e-02 6.518479e-03            1
      583    466_544470      JaccardDiss  5.923376e-04 8.740250e-01            0
      584    466_544470 MorisitaHornDiss  4.635211e-03 6.492353e-01            0
      585    466_544470   BrayCurtisDiss  1.392913e-02 2.037743e-01            0
      586    466_540104      JaccardDiss  8.457695e-03 7.327983e-02            0
      587    466_540104 MorisitaHornDiss  3.861472e-05 9.973821e-01            0
      588    466_540104   BrayCurtisDiss -1.298366e-03 8.696163e-01            0
      589    466_548115      JaccardDiss  4.598597e-03 1.319161e-01            0
      590    466_548115 MorisitaHornDiss  9.097542e-03 2.540182e-01            0
      591    466_548115   BrayCurtisDiss  8.113118e-03 1.770602e-01            0
      592    466_560514      JaccardDiss  3.262346e-03 5.992842e-01            0
      593    466_560514 MorisitaHornDiss  6.332215e-03 2.322302e-01            0
      594    466_560514   BrayCurtisDiss  7.109016e-03 4.898054e-01            0
      595    466_543001      JaccardDiss -2.085616e-03 5.476001e-01            0
      596    466_543001 MorisitaHornDiss  1.741928e-02 3.198422e-01            0
      597    466_543001   BrayCurtisDiss  9.591754e-03 4.252701e-01            0
      598    466_569257      JaccardDiss  5.267836e-03 2.409375e-01            0
      599    466_569257 MorisitaHornDiss  1.795417e-02 1.597790e-01            0
      600    466_569257   BrayCurtisDiss  3.473143e-03 7.244655e-01            0
      601    466_540834      JaccardDiss -9.430299e-03 2.312910e-01            0
      602    466_540834 MorisitaHornDiss -4.902738e-03 4.736590e-01            0
      603    466_540834   BrayCurtisDiss  7.773460e-03 6.000826e-01            0
      604    466_540833      JaccardDiss -9.086712e-03 3.132445e-01            0
      605    466_540833 MorisitaHornDiss  1.533477e-02 7.404464e-01            0
      606    466_540833   BrayCurtisDiss  2.116950e-02 5.628495e-02            0
      607    466_543011      JaccardDiss  7.048594e-03 1.088380e-01            0
      608    466_543011 MorisitaHornDiss  2.622744e-02 2.127152e-02            1
      609    466_543011   BrayCurtisDiss  2.411920e-02 5.101580e-02            0
      610    466_541549      JaccardDiss  3.061856e-04 9.591131e-01            0
      611    466_541549 MorisitaHornDiss  2.066571e-03 6.907460e-01            0
      612    466_541549   BrayCurtisDiss -1.868173e-03 8.777976e-01            0
      613    466_545198      JaccardDiss -3.635841e-03 3.313681e-01            0
      614    466_545198 MorisitaHornDiss  7.373042e-03 4.998828e-01            0
      615    466_545198   BrayCurtisDiss  9.573561e-03 2.057037e-01            0
      616    466_559051      JaccardDiss -4.301382e-03 3.783173e-01            0
      617    466_559051 MorisitaHornDiss -4.808221e-03 6.111053e-01            0
      618    466_559051   BrayCurtisDiss -6.186344e-03 4.770282e-01            0
      619    466_543738      JaccardDiss -3.632479e-02 6.821940e-01            0
      620    466_543738 MorisitaHornDiss -2.997645e-02 1.838469e-01            0
      621    466_543738   BrayCurtisDiss -1.767765e-02 3.196719e-01            0
      622    466_547388      JaccardDiss -7.479668e-04 8.153536e-01            0
      623    466_547388 MorisitaHornDiss  2.162366e-02 3.845468e-02            1
      624    466_547388   BrayCurtisDiss  1.358389e-02 8.922219e-02            0
      625    466_565614      JaccardDiss  8.403075e-04 7.770667e-01            0
      626    466_565614 MorisitaHornDiss  2.518751e-02 1.859909e-01            0
      627    466_565614   BrayCurtisDiss  8.747356e-04 9.246648e-01            0
      628    466_562698      JaccardDiss -1.801471e-02 4.098955e-01            0
      629    466_562698 MorisitaHornDiss -9.795316e-02 4.325210e-01            0
      630    466_562698   BrayCurtisDiss -8.053831e-02 5.393221e-01            0
      631    466_559779      JaccardDiss -1.562245e-02 3.080402e-02            1
      632    466_559779 MorisitaHornDiss -2.534734e-03 9.335168e-01            0
      633    466_559779   BrayCurtisDiss  1.617009e-02 6.272578e-01            0
      634    466_560509      JaccardDiss  2.115735e-03 5.409269e-01            0
      635    466_560509 MorisitaHornDiss  5.507309e-03 7.338217e-01            0
      636    466_560509   BrayCurtisDiss -5.489138e-03 6.561532e-01            0
      637    466_545919      JaccardDiss -2.930693e-03 7.319381e-01            0
      638    466_545919 MorisitaHornDiss  2.376895e-03 8.703415e-01            0
      639    466_545919   BrayCurtisDiss  1.074888e-02 3.110482e-01            0
      640    466_545912      JaccardDiss -1.364931e-03 6.336104e-01            0
      641    466_545912 MorisitaHornDiss  1.593684e-02 6.891413e-02            0
      642    466_545912   BrayCurtisDiss  1.324021e-02 1.657507e-01            0
      643    466_548798      JaccardDiss  4.579587e-03 1.054309e-01            0
      644    466_548798 MorisitaHornDiss -1.777625e-05 9.985383e-01            0
      645    466_548798   BrayCurtisDiss  1.341719e-03 8.404485e-01            0
      646    466_552442      JaccardDiss  1.663163e-03 5.553504e-01            0
      647    466_552442 MorisitaHornDiss  8.935914e-03 1.701339e-01            0
      648    466_552442   BrayCurtisDiss  6.633414e-03 2.160830e-01            0
      649    466_553900      JaccardDiss -2.151694e-02 2.111730e-02            1
      650    466_553900 MorisitaHornDiss -1.850300e-02 5.823165e-01            0
      651    466_553900   BrayCurtisDiss -3.295757e-02 2.578277e-01            0
      652    466_555359      JaccardDiss  5.396163e-03 2.448854e-01            0
      653    466_555359 MorisitaHornDiss -3.243194e-04 9.826700e-01            0
      654    466_555359   BrayCurtisDiss -3.824858e-03 7.024775e-01            0
      655    466_559004      JaccardDiss  5.158377e-03 2.906998e-01            0
      656    466_559004 MorisitaHornDiss -9.856499e-03 1.985427e-01            0
      657    466_559004   BrayCurtisDiss -1.448712e-03 8.787918e-01            0
      658    466_553901      JaccardDiss -4.839089e-03 1.477336e-01            0
      659    466_553901 MorisitaHornDiss -1.981906e-02 4.038335e-03            1
      660    466_553901   BrayCurtisDiss -3.013013e-04 9.683001e-01            0
      661    466_552446      JaccardDiss  1.827813e-03 7.067930e-01            0
      662    466_552446 MorisitaHornDiss  1.886447e-03 3.905481e-01            0
      663    466_552446   BrayCurtisDiss  8.490313e-03 3.115464e-01            0
      664    466_553171      JaccardDiss -1.343646e-03 8.375072e-01            0
      665    466_553171 MorisitaHornDiss  4.257713e-03 3.908171e-01            0
      666    466_553171   BrayCurtisDiss -2.659608e-03 7.412957e-01            0
      667    466_553175      JaccardDiss  4.991545e-03 3.237821e-01            0
      668    466_553175 MorisitaHornDiss  2.491515e-04 9.616337e-01            0
      669    466_553175   BrayCurtisDiss -1.505193e-02 1.250559e-01            0
      670    466_556090      JaccardDiss  2.817695e-04 9.755086e-01            0
      671    466_556090 MorisitaHornDiss  1.099562e-02 5.975639e-01            0
      672    466_556090   BrayCurtisDiss  1.659003e-02 4.629161e-01            0
      673    466_557547      JaccardDiss  1.780534e-03 4.464214e-01            0
      674    466_557547 MorisitaHornDiss  9.017695e-05 9.786444e-01            0
      675    466_557547   BrayCurtisDiss  1.261955e-03 8.811343e-01            0
      676    466_554630      JaccardDiss  2.045639e-04 9.578134e-01            0
      677    466_554630 MorisitaHornDiss -1.024306e-02 1.242256e-01            0
      678    466_554630   BrayCurtisDiss -6.092638e-03 5.385697e-01            0
      679    466_553902      JaccardDiss  6.733826e-03 4.300880e-01            0
      680    466_553902 MorisitaHornDiss -1.920963e-02 1.196131e-01            0
      681    466_553902   BrayCurtisDiss -3.632217e-03 7.111304e-01            0
      682    466_549529      JaccardDiss -4.589679e-04 9.089372e-01            0
      683    466_549529 MorisitaHornDiss  9.191012e-04 9.624126e-01            0
      684    466_549529   BrayCurtisDiss  2.397324e-02 1.857697e-01            0
      685    466_551714      JaccardDiss -9.879219e-04 8.931545e-01            0
      686    466_551714 MorisitaHornDiss  4.089065e-03 8.334659e-01            0
      687    466_551714   BrayCurtisDiss  5.908842e-03 2.795396e-01            0
      688    466_550254      JaccardDiss  4.366252e-03 4.495225e-01            0
      689    466_550254 MorisitaHornDiss -1.893859e-03 8.997268e-01            0
      690    466_550254   BrayCurtisDiss -7.271335e-03 5.105767e-01            0
      691    466_549527      JaccardDiss  3.525564e-03 5.004223e-01            0
      692    466_549527 MorisitaHornDiss  6.787828e-03 5.890519e-01            0
      693    466_549527   BrayCurtisDiss -5.103635e-04 9.523708e-01            0
      694    466_553903      JaccardDiss  3.543041e-03 5.309292e-01            0
      695    466_553903 MorisitaHornDiss  1.166123e-02 4.058408e-01            0
      696    466_553903   BrayCurtisDiss  1.392752e-02 1.301050e-01            0
      697    466_550258      JaccardDiss -8.051593e-03 5.555100e-01            0
      698    466_550258 MorisitaHornDiss -1.017695e-02 2.745656e-01            0
      699    466_550258   BrayCurtisDiss -1.263522e-02 3.541003e-01            0
      700    466_556089      JaccardDiss  4.191409e-03 1.973014e-01            0
      701    466_556089 MorisitaHornDiss -9.839310e-03 3.291882e-01            0
      702    466_556089   BrayCurtisDiss -8.450760e-03 3.014168e-01            0
      703    466_556091      JaccardDiss  7.721379e-03 1.414275e-01            0
      704    466_556091 MorisitaHornDiss  6.530184e-03 1.476501e-01            0
      705    466_556091   BrayCurtisDiss  1.840055e-02 1.442581e-02            1
      706    466_556092      JaccardDiss  5.505845e-03 1.296566e-01            0
      707    466_556092 MorisitaHornDiss -8.091482e-04 9.201678e-01            0
      708    466_556092   BrayCurtisDiss -1.812052e-02 2.683278e-02            1
      709    466_553904      JaccardDiss  7.645817e-03 6.234564e-02            0
      710    466_553904 MorisitaHornDiss -3.325011e-03 7.309135e-01            0
      711    466_553904   BrayCurtisDiss -3.657189e-03 6.954377e-01            0
      712    466_552445      JaccardDiss  8.510291e-03 3.254548e-02            1
      713    466_552445 MorisitaHornDiss  8.229559e-03 5.028761e-01            0
      714    466_552445   BrayCurtisDiss  5.162181e-03 5.575785e-01            0
      715    466_554632      JaccardDiss  3.530810e-03 4.437498e-01            0
      716    466_554632 MorisitaHornDiss -7.666707e-03 2.514276e-01            0
      717    466_554632   BrayCurtisDiss  2.216044e-03 8.492773e-01            0
      718    466_556818      JaccardDiss  3.196803e-02 5.089144e-01            0
      719    466_556818 MorisitaHornDiss  2.271581e-03 9.059482e-01            0
      720    466_556818   BrayCurtisDiss  4.400392e-02 2.281207e-01            0
      721    466_556088      JaccardDiss  9.444121e-04 8.854939e-01            0
      722    466_556088 MorisitaHornDiss  2.208803e-02 5.964024e-02            0
      723    466_556088   BrayCurtisDiss  9.670032e-03 3.113577e-01            0
      724    466_550255      JaccardDiss  7.608125e-03 1.296157e-01            0
      725    466_550255 MorisitaHornDiss  1.066597e-03 9.601633e-01            0
      726    466_550255   BrayCurtisDiss -2.790829e-03 8.074950e-01            0
      727    466_553905      JaccardDiss  3.318250e-03 3.932346e-01            0
      728    466_553905 MorisitaHornDiss -1.761834e-02 1.702713e-01            0
      729    466_553905   BrayCurtisDiss -7.096022e-03 5.799313e-01            0
      730    466_555362      JaccardDiss  2.052134e-04 9.565173e-01            0
      731    466_555362 MorisitaHornDiss  4.522033e-04 9.358310e-01            0
      732    466_555362   BrayCurtisDiss  1.447145e-02 2.521532e-01            0
      733    466_559733      JaccardDiss -5.299836e-04 9.221469e-01            0
      734    466_559733 MorisitaHornDiss -6.946520e-03 1.338812e-01            0
      735    466_559733   BrayCurtisDiss -1.230094e-03 8.879199e-01            0
      736    466_557548      JaccardDiss  3.601576e-03 3.764833e-01            0
      737    466_557548 MorisitaHornDiss -1.744270e-03 4.340886e-01            0
      738    466_557548   BrayCurtisDiss -7.188579e-03 3.613678e-01            0
      739    466_550256      JaccardDiss -6.341000e-03 2.677452e-01            0
      740    466_550256 MorisitaHornDiss -1.778675e-03 6.288604e-01            0
      741    466_550256   BrayCurtisDiss  5.751822e-03 4.448962e-01            0
      742    466_554634      JaccardDiss -6.758422e-03 2.808760e-01            0
      743    466_554634 MorisitaHornDiss -2.091910e-03 4.027415e-01            0
      744    466_554634   BrayCurtisDiss -1.364530e-03 9.367080e-01            0
      745    466_554631      JaccardDiss -1.378457e-02 1.348197e-01            0
      746    466_554631 MorisitaHornDiss -5.764409e-03 5.511187e-01            0
      747    466_554631   BrayCurtisDiss  3.064574e-03 7.416407e-01            0
      748    466_553176      JaccardDiss  7.110727e-03 1.529530e-01            0
      749    466_553176 MorisitaHornDiss  5.338690e-03 1.594204e-01            0
      750    466_553176   BrayCurtisDiss  1.206797e-02 1.547874e-01            0
      751    466_556819      JaccardDiss  9.161660e-04 8.355915e-01            0
      752    466_556819 MorisitaHornDiss  1.214852e-03 9.126836e-01            0
      753    466_556819   BrayCurtisDiss -4.376833e-03 5.612830e-01            0
      754    466_550984      JaccardDiss  9.955261e-03 1.303314e-01            0
      755    466_550984 MorisitaHornDiss -4.847053e-03 7.149497e-01            0
      756    466_550984   BrayCurtisDiss  9.555720e-03 1.875082e-01            0
      757    466_561188      JaccardDiss  8.343963e-03 2.888320e-01            0
      758    466_561188 MorisitaHornDiss  4.260279e-03 6.092055e-01            0
      759    466_561188   BrayCurtisDiss  5.498779e-03 8.712603e-01            0
      760    466_558274      JaccardDiss  6.431943e-03 2.632918e-01            0
      761    466_558274 MorisitaHornDiss  2.085448e-02 2.852851e-01            0
      762    466_558274   BrayCurtisDiss  1.452774e-02 2.792567e-01            0
      763    466_555361      JaccardDiss  1.278317e-02 1.376697e-01            0
      764    466_555361 MorisitaHornDiss  3.006158e-03 6.339815e-01            0
      765    466_555361   BrayCurtisDiss  1.521419e-02 3.882312e-01            0
      766    466_553172      JaccardDiss -6.669585e-04 9.029285e-01            0
      767    466_553172 MorisitaHornDiss -1.858945e-03 6.200118e-01            0
      768    466_553172   BrayCurtisDiss  2.234746e-03 7.391180e-01            0
      769    466_556087      JaccardDiss  3.590039e-03 6.607557e-01            0
      770    466_556087 MorisitaHornDiss  1.384183e-02 5.155577e-01            0
      771    466_556087   BrayCurtisDiss  5.680998e-03 7.580512e-01            0
      772    466_548799      JaccardDiss  9.157509e-03 2.485210e-01            0
      773    466_548799 MorisitaHornDiss  5.178200e-02 9.150969e-04            1
      774    466_548799   BrayCurtisDiss  1.192940e-02 2.524631e-01            0
      775    466_550257      JaccardDiss -3.435724e-03 5.323376e-01            0
      776    466_550257 MorisitaHornDiss  1.777076e-03 8.919089e-01            0
      777    466_550257   BrayCurtisDiss  2.839962e-03 8.002203e-01            0
      778    466_559005      JaccardDiss  6.860373e-03 3.928072e-01            0
      779    466_559005 MorisitaHornDiss  2.235289e-04 9.923116e-01            0
      780    466_559005   BrayCurtisDiss -9.176009e-04 9.375278e-01            0
      781    466_559734      JaccardDiss -2.585281e-03 5.674846e-01            0
      782    466_559734 MorisitaHornDiss -1.345982e-03 9.147262e-01            0
      783    466_559734   BrayCurtisDiss -1.590025e-02 6.185370e-02            0
      784    466_551717      JaccardDiss  8.543549e-03 3.479880e-01            0
      785    466_551717 MorisitaHornDiss -1.239431e-02 2.897172e-01            0
      786    466_551717   BrayCurtisDiss  1.599403e-02 1.572039e-01            0
      787    466_553174      JaccardDiss -1.874038e-03 7.136631e-01            0
      788    466_553174 MorisitaHornDiss  1.627501e-02 1.691275e-01            0
      789    466_553174   BrayCurtisDiss  9.474144e-03 3.787336e-01            0
      790    466_559003      JaccardDiss  6.174105e-03 3.943069e-01            0
      791    466_559003 MorisitaHornDiss  4.633222e-04 9.702944e-01            0
      792    466_559003   BrayCurtisDiss -1.644795e-03 8.790710e-01            0
      793    466_550988      JaccardDiss -2.295512e-02 3.307869e-01            0
      794    466_550988 MorisitaHornDiss -1.599981e-02 7.760562e-01            0
      795    466_550988   BrayCurtisDiss -3.077323e-02 3.787004e-01            0
      796    466_556086      JaccardDiss  6.642498e-03 5.456132e-01            0
      797    466_556086 MorisitaHornDiss  1.127743e-02 3.885892e-01            0
      798    466_556086   BrayCurtisDiss  1.505001e-02 4.848261e-01            0
      799    466_560463      JaccardDiss -6.408862e-03 6.285240e-01            0
      800    466_560463 MorisitaHornDiss -2.322380e-02 1.971340e-01            0
      801    466_560463   BrayCurtisDiss -6.922964e-03 7.152297e-01            0
      802    466_549526      JaccardDiss -2.327339e-03 6.367582e-01            0
      803    466_549526 MorisitaHornDiss  1.247347e-03 9.419993e-01            0
      804    466_549526   BrayCurtisDiss -3.163443e-03 7.749842e-01            0
      805    466_550259      JaccardDiss -9.034893e-06 9.987381e-01            0
      806    466_550259 MorisitaHornDiss -2.546814e-02 2.117428e-01            0
      807    466_550259   BrayCurtisDiss -2.449557e-02 2.020600e-01            0
      808    466_542290      JaccardDiss -1.438899e-02 7.183679e-02            0
      809    466_542290 MorisitaHornDiss  7.273145e-03 6.107417e-01            0
      810    466_542290   BrayCurtisDiss  1.072674e-02 5.733037e-01            0
      811    466_565606      JaccardDiss  6.297398e-03 4.940771e-02            1
      812    466_565606 MorisitaHornDiss -1.903651e-02 2.398534e-01            0
      813    466_565606   BrayCurtisDiss -1.478078e-02 1.812381e-01            0
      814    466_553933      JaccardDiss -8.406543e-03 3.772315e-01            0
      815    466_553933 MorisitaHornDiss  2.676387e-02 1.824318e-01            0
      816    466_553933   BrayCurtisDiss  3.995098e-03 8.155181e-01            0
      817    466_562687      JaccardDiss  1.805674e-03 6.931770e-01            0
      818    466_562687 MorisitaHornDiss  1.248982e-02 4.418366e-01            0
      819    466_562687   BrayCurtisDiss  5.823797e-03 5.621714e-01            0
      820    466_556851      JaccardDiss -7.014685e-02 7.590495e-02            0
      821    466_556851 MorisitaHornDiss  5.164715e-02 7.284511e-01            0
      822    466_556851   BrayCurtisDiss  2.040163e-02 8.372337e-01            0
      823    466_571439      JaccardDiss  9.192268e-03 4.297613e-01            0
      824    466_571439 MorisitaHornDiss -1.742812e-02 6.308025e-01            0
      825    466_571439   BrayCurtisDiss -2.517314e-02 1.654024e-01            0
      826    466_565610      JaccardDiss -8.995264e-04 8.026274e-01            0
      827    466_565610 MorisitaHornDiss -1.928576e-02 1.909318e-01            0
      828    466_565610   BrayCurtisDiss -1.009066e-02 2.215931e-01            0
      829    466_565611      JaccardDiss  1.994505e-02 1.651153e-02            1
      830    466_565611 MorisitaHornDiss  3.404821e-02 2.589999e-02            1
      831    466_565611   BrayCurtisDiss -1.607731e-02 1.346875e-01            0
      832    466_541545      JaccardDiss  4.940383e-03 6.095969e-01            0
      833    466_541545 MorisitaHornDiss  6.138573e-03 8.722661e-01            0
      834    466_541545   BrayCurtisDiss  2.132715e-03 8.232217e-01            0
      835    466_546649      JaccardDiss -8.764503e-03 7.672251e-01            0
      836    466_546649 MorisitaHornDiss  4.149174e-02 8.129701e-01            0
      837    466_546649   BrayCurtisDiss  2.010270e-02 8.669855e-01            0
      838    466_566335      JaccardDiss  4.853078e-03 3.866018e-01            0
      839    466_566335 MorisitaHornDiss  5.332898e-03 8.329918e-01            0
      840    466_566335   BrayCurtisDiss  1.949147e-03 9.047307e-01            0
      841    466_543008      JaccardDiss -3.562373e-02 2.125943e-01            0
      842    466_543008 MorisitaHornDiss -1.128847e-02 8.943202e-01            0
      843    466_543008   BrayCurtisDiss  3.080334e-02 3.661904e-01            0
      844    466_542272      JaccardDiss  1.402729e-04 9.638818e-01            0
      845    466_542272 MorisitaHornDiss -2.844084e-02 2.667556e-01            0
      846    466_542272   BrayCurtisDiss -2.073940e-02 2.249905e-01            0
      847    466_564884      JaccardDiss  1.356043e-02 2.979658e-01            0
      848    466_564884 MorisitaHornDiss -1.580292e-02 8.040613e-01            0
      849    466_564884   BrayCurtisDiss -2.001872e-03 9.560715e-01            0
      850    466_558310      JaccardDiss -1.733987e-03 4.892088e-01            0
      851    466_558310 MorisitaHornDiss  4.117968e-03 7.229308e-01            0
      852    466_558310   BrayCurtisDiss -7.327064e-04 6.893437e-01            0
      853    466_541548      JaccardDiss  2.283507e-03 6.552727e-01            0
      854    466_541548 MorisitaHornDiss  1.147045e-02 4.301423e-01            0
      855    466_541548   BrayCurtisDiss  1.061172e-02 2.218690e-01            0
      856    466_568522      JaccardDiss  5.496471e-03 3.071732e-01            0
      857    466_568522 MorisitaHornDiss -1.110959e-03 9.230264e-01            0
      858    466_568522   BrayCurtisDiss -1.053673e-03 8.739521e-01            0
      859    466_561970      JaccardDiss  6.798114e-03 6.972189e-01            0
      860    466_561970 MorisitaHornDiss -2.967797e-02 6.328417e-01            0
      861    466_561970   BrayCurtisDiss -2.713978e-02 5.700118e-01            0
      862    466_568523      JaccardDiss -3.818182e-03 6.226307e-01            0
      863    466_568523 MorisitaHornDiss -3.585546e-02 3.335644e-01            0
      864    466_568523   BrayCurtisDiss -1.465479e-02 2.510755e-01            0
      865    466_553937      JaccardDiss  3.454697e-03 2.816975e-01            0
      866    466_553937 MorisitaHornDiss -9.658861e-04 8.671488e-01            0
      867    466_553937   BrayCurtisDiss -5.302371e-03 4.829751e-01            0
      868    466_564158      JaccardDiss  1.185431e-02 5.613214e-01            0
      869    466_564158 MorisitaHornDiss -3.491186e-03 9.460870e-01            0
      870    466_564158   BrayCurtisDiss  2.312048e-02 3.047459e-01            0
      871    466_564876      JaccardDiss -8.373206e-03 8.424904e-01            0
      872    466_564876 MorisitaHornDiss -3.023311e-02 7.296023e-01            0
      873    466_564876   BrayCurtisDiss -2.580806e-02 7.168354e-01            0
      874    466_545927      JaccardDiss  2.785173e-03 4.026630e-01            0
      875    466_545927 MorisitaHornDiss -1.209057e-03 9.341841e-01            0
      876    466_545927   BrayCurtisDiss -4.753304e-03 6.690959e-01            0
      877    466_551018      JaccardDiss  2.539930e-03 6.393671e-01            0
      878    466_551018 MorisitaHornDiss -7.720058e-04 9.277046e-01            0
      879    466_551018   BrayCurtisDiss -2.682994e-03 7.138200e-01            0
      880    466_569984      JaccardDiss  4.086957e-02 5.824243e-01            0
      881    466_569984 MorisitaHornDiss -2.588588e-02 9.595396e-01            0
      882    466_569984   BrayCurtisDiss -1.511925e-02 9.703158e-01            0
      883    466_556135      JaccardDiss -1.656315e-02 4.830491e-01            0
      884    466_556135 MorisitaHornDiss  3.667825e-02 5.686437e-01            0
      885    466_556135   BrayCurtisDiss  3.496328e-02 5.556066e-01            0
      886    466_558313      JaccardDiss  9.815704e-04 8.512678e-01            0
      887    466_558313 MorisitaHornDiss  1.127579e-03 7.641764e-01            0
      888    466_558313   BrayCurtisDiss  2.239759e-03 6.333524e-01            0
      889    466_557581      JaccardDiss  1.479661e-03 9.015562e-01            0
      890    466_557581 MorisitaHornDiss  2.874984e-02 1.830693e-02            1
      891    466_557581   BrayCurtisDiss  1.993242e-02 1.029958e-01            0
      892    466_547368      JaccardDiss  2.111757e-03 7.213481e-01            0
      893    466_547368 MorisitaHornDiss  3.868340e-02 1.542030e-01            0
      894    466_547368   BrayCurtisDiss  2.481293e-02 1.952753e-01            0
      895    466_548098      JaccardDiss -1.350997e-03 7.629589e-01            0
      896    466_548098 MorisitaHornDiss -4.398099e-03 8.327726e-01            0
      897    466_548098   BrayCurtisDiss  2.626921e-03 8.525547e-01            0
      898    466_544455      JaccardDiss -3.625215e-03 4.413750e-01            0
      899    466_544455 MorisitaHornDiss  2.225333e-02 3.426695e-02            1
      900    466_544455   BrayCurtisDiss -5.065063e-03 6.693325e-01            0
      901    466_554676      JaccardDiss  3.590344e-03 3.095039e-01            0
      902    466_554676 MorisitaHornDiss  4.861742e-03 4.828121e-01            0
      903    466_554676   BrayCurtisDiss -3.071948e-03 5.804448e-01            0
      904    466_565605      JaccardDiss -4.516758e-05 9.931947e-01            0
      905    466_565605 MorisitaHornDiss  5.971692e-03 7.761566e-01            0
      906    466_565605   BrayCurtisDiss  6.204392e-03 6.804624e-01            0
      907    466_561962      JaccardDiss -6.937455e-04 8.102445e-01            0
      908    466_561962 MorisitaHornDiss -1.855866e-02 2.554525e-02            1
      909    466_561962   BrayCurtisDiss -1.277967e-02 5.124390e-02            0
      910    466_548097      JaccardDiss -1.363857e-04 9.559685e-01            0
      911    466_548097 MorisitaHornDiss  2.037925e-02 8.645324e-02            0
      912    466_548097   BrayCurtisDiss  6.998128e-03 3.769426e-01            0
      913    466_564146      JaccardDiss  4.327937e-04 9.908319e-01            0
      914    466_564146 MorisitaHornDiss -5.425329e-02 3.059628e-01            0
      915    466_564146   BrayCurtisDiss -7.417269e-03 2.820607e-01            0
      916    466_544471      JaccardDiss  3.163689e-03 6.292679e-01            0
      917    466_544471 MorisitaHornDiss  2.137532e-02 2.097095e-01            0
      918    466_544471   BrayCurtisDiss  3.177439e-02 7.163420e-02            0
      919    466_557584      JaccardDiss  1.338843e-02 9.412175e-02            0
      920    466_557584 MorisitaHornDiss -2.265588e-02 1.332158e-01            0
      921    466_557584   BrayCurtisDiss -2.203472e-02 3.003311e-01            0
      922    466_543726      JaccardDiss  7.189794e-03 2.320166e-01            0
      923    466_543726 MorisitaHornDiss  7.005575e-03 3.727955e-01            0
      924    466_543726   BrayCurtisDiss  3.602279e-03 5.189215e-01            0
      925    466_553207      JaccardDiss  3.001146e-03 2.610320e-01            0
      926    466_553207 MorisitaHornDiss  1.713427e-02 5.756453e-01            0
      927    466_553207   BrayCurtisDiss  1.590489e-02 3.474079e-01            0
      928    466_551748      JaccardDiss  1.602412e-02 3.156523e-05            1
      929    466_551748 MorisitaHornDiss  1.318070e-02 4.499931e-01            0
      930    466_551748   BrayCurtisDiss  1.198336e-02 4.092870e-01            0
      931    466_551015      JaccardDiss  1.282720e-03 6.160515e-01            0
      932    466_551015 MorisitaHornDiss -1.327048e-02 5.579680e-01            0
      933    466_551015   BrayCurtisDiss -7.342125e-03 6.324925e-01            0
      934    466_559044      JaccardDiss  1.248074e-02 5.750262e-02            0
      935    466_559044 MorisitaHornDiss -1.874789e-02 3.377234e-01            0
      936    466_559044   BrayCurtisDiss -4.885482e-03 7.212651e-01            0
      937    466_557595      JaccardDiss -1.276812e-02 7.072029e-01            0
      938    466_557595 MorisitaHornDiss  1.477756e-01 2.007064e-01            0
      939    466_557595   BrayCurtisDiss  1.538916e-01 1.302335e-01            0
      940    466_559773      JaccardDiss  6.802721e-04 9.862262e-01            0
      941    466_559773 MorisitaHornDiss -2.712453e-03 9.807617e-01            0
      942    466_559773   BrayCurtisDiss  4.278733e-02 3.076173e-01            0
      943    466_554666      JaccardDiss -1.992771e-03 8.308196e-01            0
      944    466_554666 MorisitaHornDiss  1.817421e-02 4.237068e-01            0
      945    466_554666   BrayCurtisDiss  1.901468e-02 4.958065e-01            0
      946    466_547369      JaccardDiss  2.171760e-03 7.500817e-01            0
      947    466_547369 MorisitaHornDiss -1.293819e-02 6.333367e-01            0
      948    466_547369   BrayCurtisDiss -1.296756e-02 4.622423e-02            1
      949    466_550285      JaccardDiss  1.241826e-03 8.903332e-01            0
      950    466_550285 MorisitaHornDiss  3.537812e-02 1.245403e-01            0
      951    466_550285   BrayCurtisDiss  2.784786e-02 2.264633e-01            0
      952    466_561232      JaccardDiss -9.422331e-03 1.208141e-01            0
      953    466_561232 MorisitaHornDiss  1.099799e-02 7.029900e-01            0
      954    466_561232   BrayCurtisDiss  1.678751e-03 8.896184e-01            0
      955    466_557594      JaccardDiss  1.990185e-03 8.241017e-01            0
      956    466_557594 MorisitaHornDiss -1.892014e-02 2.388959e-01            0
      957    466_557594   BrayCurtisDiss -2.155088e-02 2.971355e-01            0
      958    466_559050      JaccardDiss  1.758891e-03 7.234421e-01            0
      959    466_559050 MorisitaHornDiss  1.844945e-02 4.564631e-01            0
      960    466_559050   BrayCurtisDiss  7.645888e-03 3.703686e-01            0
      961    466_546657      JaccardDiss  2.698413e-02 6.964465e-01            0
      962    466_546657 MorisitaHornDiss -7.740778e-02 5.077829e-01            0
      963    466_546657   BrayCurtisDiss -8.936618e-02 3.279150e-01            0
      964    466_565615      JaccardDiss  2.354488e-02 5.625644e-01            0
      965    466_565615 MorisitaHornDiss -5.955162e-02 5.889037e-01            0
      966    466_565615   BrayCurtisDiss -9.782322e-03 8.478624e-01            0
      967    466_555405      JaccardDiss -5.118091e-04 9.347144e-01            0
      968    466_555405 MorisitaHornDiss -1.723418e-03 9.458932e-01            0
      969    466_555405   BrayCurtisDiss -1.024397e-02 5.057302e-01            0
      970    466_559043      JaccardDiss  8.516484e-03 4.030802e-01            0
      971    466_559043 MorisitaHornDiss  5.661964e-03 8.160798e-01            0
      972    466_559043   BrayCurtisDiss -7.617230e-03 5.959008e-01            0
      973    466_543012      JaccardDiss  3.854910e-04 9.874169e-01            0
      974    466_543012 MorisitaHornDiss  9.138167e-03 6.774666e-01            0
      975    466_543012   BrayCurtisDiss -9.225698e-03 7.596357e-01            0
      976    466_549575      JaccardDiss  1.194239e-03 8.051206e-01            0
      977    466_549575 MorisitaHornDiss -8.027714e-03 3.135824e-01            0
      978    466_549575   BrayCurtisDiss  7.547311e-04 8.978624e-01            0
      979    466_547385      JaccardDiss -4.677615e-04 9.441309e-01            0
      980    466_547385 MorisitaHornDiss  1.436329e-02 6.470372e-01            0
      981    466_547385   BrayCurtisDiss  1.542822e-02 4.466456e-01            0
      982    466_551017      JaccardDiss -2.019163e-03 9.438586e-01            0
      983    466_551017 MorisitaHornDiss -2.733600e-02 6.902560e-01            0
      984    466_551017   BrayCurtisDiss -4.188695e-02 1.680745e-01            0
      985    466_543725      JaccardDiss -8.428047e-17 1.000000e+00            0
      986    466_543725 MorisitaHornDiss  8.470660e-02 5.156098e-01            0
      987    466_543725   BrayCurtisDiss  3.013440e-02 6.608294e-01            0
      988    466_558321      JaccardDiss  1.502166e-03 6.133103e-01            0
      989    466_558321 MorisitaHornDiss  1.509121e-02 2.144563e-01            0
      990    466_558321   BrayCurtisDiss -5.537518e-03 3.911635e-01            0
      991    466_559780      JaccardDiss -3.024845e-02 2.643564e-01            0
      992    466_559780 MorisitaHornDiss  1.058186e-01 5.173134e-02            0
      993    466_559780   BrayCurtisDiss  5.665359e-02 3.177334e-01            0
      994    466_541551      JaccardDiss -7.894737e-03 1.615715e-01            0
      995    466_541551 MorisitaHornDiss  8.900149e-03 1.411362e-01            0
      996    466_541551   BrayCurtisDiss -7.372180e-02 3.480908e-01            0
      997    466_548114      JaccardDiss  4.895659e-03 6.259579e-01            0
      998    466_548114 MorisitaHornDiss  7.366200e-03 6.036761e-01            0
      999    466_548114   BrayCurtisDiss -1.152791e-02 1.880276e-01            0
      1000   466_546656      JaccardDiss  5.632411e-02 4.234638e-01            0
      1001   466_546656 MorisitaHornDiss -2.508449e-01 4.451349e-01            0
      1002   466_546656   BrayCurtisDiss -1.378850e-02 8.212049e-01            0
      1003   466_554678      JaccardDiss  1.890206e-02 2.320065e-01            0
      1004   466_554678 MorisitaHornDiss -2.688611e-03 9.470913e-01            0
      1005   466_554678   BrayCurtisDiss -1.612770e-03 9.576068e-01            0
      1006   466_555360      JaccardDiss -2.818646e-03 7.127145e-01            0
      1007   466_555360 MorisitaHornDiss  7.969224e-03 3.562713e-01            0
      1008   466_555360   BrayCurtisDiss  5.812112e-03 5.989568e-01            0
      1009   466_554629      JaccardDiss  1.041667e-02 8.695385e-01            0
      1010   466_554629 MorisitaHornDiss -4.522714e-02 2.071968e-01            0
      1011   466_554629   BrayCurtisDiss -1.649966e-02 6.565059e-01            0
      1012   466_551718      JaccardDiss -3.947202e-03 7.563146e-01            0
      1013   466_551718 MorisitaHornDiss  5.159309e-04 6.277619e-01            0
      1014   466_551718   BrayCurtisDiss -3.315786e-02 3.703338e-01            0
      1015   466_551716      JaccardDiss -1.129450e-02 8.455953e-02            0
      1016   466_551716 MorisitaHornDiss  1.758418e-03 1.240672e-01            0
      1017   466_551716   BrayCurtisDiss  2.010090e-02 6.334920e-02            0
      1018   466_558275      JaccardDiss -2.166650e-03 8.822352e-01            0
      1019   466_558275 MorisitaHornDiss -1.092335e-04 8.168084e-01            0
      1020   466_558275   BrayCurtisDiss -1.431536e-03 9.007981e-01            0
      1021   466_552443      JaccardDiss  1.104283e-02 2.225076e-01            0
      1022   466_552443 MorisitaHornDiss -9.007643e-03 5.897916e-01            0
      1023   466_552443   BrayCurtisDiss  8.338384e-03 5.859919e-01            0
      1024   466_557546      JaccardDiss  1.057999e-03 8.250307e-01            0
      1025   466_557546 MorisitaHornDiss -5.567672e-03 7.407776e-01            0
      1026   466_557546   BrayCurtisDiss -7.174921e-03 4.751933e-01            0
      1027   466_553173      JaccardDiss  3.732822e-03 4.714964e-01            0
      1028   466_553173 MorisitaHornDiss  2.301636e-02 1.243303e-01            0
      1029   466_553173   BrayCurtisDiss  1.158134e-02 2.775486e-01            0
      1030   466_564882      JaccardDiss  2.419896e-02 9.681676e-03            1
      1031   466_564882 MorisitaHornDiss  5.045750e-03 8.483759e-01            0
      1032   466_564882   BrayCurtisDiss  2.107561e-02 2.243032e-01            0
      1033   466_556816      JaccardDiss  1.324078e-03 8.198886e-01            0
      1034   466_556816 MorisitaHornDiss  2.283108e-02 2.219512e-01            0
      1035   466_556816   BrayCurtisDiss  1.701608e-04 9.895470e-01            0
      1036   466_557544      JaccardDiss  5.063966e-03 6.234915e-01            0
      1037   466_557544 MorisitaHornDiss -1.924580e-02 6.946504e-01            0
      1038   466_557544   BrayCurtisDiss  3.156164e-03 9.253679e-01            0
      1039   466_550987      JaccardDiss -1.418911e-03 9.244364e-01            0
      1040   466_550987 MorisitaHornDiss -3.289577e-03 8.278546e-01            0
      1041   466_550987   BrayCurtisDiss -1.608775e-03 9.466808e-01            0
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
      16     -6.31303358
      17     -3.63306434
      18      1.92215315
      19    -24.64707285
      20    -69.81499454
      21    -25.08981447
      22    -11.12475101
      23    -72.16057707
      24    -45.06335134
      25    -31.69129318
      26    -53.93392451
      27    -69.03369479
      28    -27.36675325
      29    148.06539397
      30     97.44644042
      31     66.51973039
      32     31.81958262
      33     37.59319873
      34      7.43903602
      35      5.36987138
      36      1.61280223
      37     77.42290486
      38      6.79059327
      39      3.78471472
      40     30.50765208
      41    385.70598229
      42    106.12612348
      43    142.03366794
      44    112.48117445
      45    149.00950615
      46     83.33606950
      47    -84.07310243
      48    -95.09708660
      49    -30.70156214
      50     -0.56414683
      51    -11.16056734
      52     83.67439614
      53     11.64458097
      54     22.62552192
      55    120.46627451
      56     26.87905725
      57    113.49457864
      58    107.69892970
      59    -10.04241696
      60     73.09968965
      61     78.97651888
      62    -49.72188978
      63   -113.09401026
      64     82.98358238
      65     64.37929566
      66     38.40665662
      67     -6.26957507
      68     81.91461216
      69     61.23444953
      70   -188.60025641
      71     47.81543261
      72    -67.09119641
      73     43.59200325
      74     57.76171449
      75     31.13312145
      76    -27.23178515
      77    -16.19752915
      78    -42.34663001
      79     -9.79670088
      80    -16.24545456
      81    -10.63246451
      82     47.55748665
      83     22.96667694
      84     31.50434654
      85      7.94377279
      86     38.85105560
      87     48.97416055
      88     -6.89204419
      89      2.12208926
      90    -23.05369249
      91     11.10900108
      92   -119.24387792
      93   -131.54982363
      94     53.50603630
      95     54.23436969
      96     57.63269703
      97   -569.83988958
      98   -881.74980457
      99   -648.93065406
      100    59.26844137
      101   -81.31404207
      102   -56.69000895
      103   -43.44930405
      104    25.61540359
      105   -16.11924192
      106    22.34675362
      107   -38.95159772
      108    -5.71376165
      109  -133.51811925
      110   -13.60666280
      111   -71.18934541
      112    78.10690058
      113   -43.71655542
      114    15.90751871
      115   201.21461538
      116   314.88426157
      117   167.62888209
      118   582.33214286
      119   598.94892733
      120   531.69756431
      121   -57.82734294
      122   246.41891756
      123    -6.64049008
      124    45.15201803
      125    45.06459632
      126    53.22083309
      127    25.68453997
      128    43.37107117
      129     5.16256986
      130    12.16274155
      131  -150.14507676
      132   -72.29540462
      133    28.80416667
      134    37.23102075
      135   -19.21633680
      136  -115.42841880
      137   176.16813402
      138    37.10841482
      139    57.44933373
      140   -86.35506811
      141   -74.51131547
      142   -16.25574758
      143     4.91212097
      144    -4.55623471
      145   -25.71387520
      146   -22.14484496
      147    26.94811853
      148   -65.85332224
      149  -159.31847309
      150  -106.55501877
      151   -18.76685824
      152   -13.10958698
      153     0.33940379
      154    54.98715977
      155    70.48511706
      156   -20.17083134
      157    44.98298451
      158   114.72062639
      159    53.81116801
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
      172   -88.36984732
      173    94.25430170
      174    30.68538114
      175    15.42584602
      176   -94.73010616
      177     3.59925713
      178    75.73932264
      179    88.22309565
      180   322.65679360
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
      193    36.03669529
      194     5.12947206
      195    13.98497864
      196   -46.64264663
      197   -57.71748866
      198   -75.67193811
      199    50.32618498
      200   318.38247288
      201    11.19554169
      202   -16.09632616
      203     4.18749199
      204     7.69467124
      205     0.34838710
      206   -17.52504960
      207    87.28192187
      208  -125.21984574
      209  -123.19925301
      210  -199.52735319
      211   127.43016129
      212   -73.97366258
      213   -41.93800782
      214   -21.08440459
      215  -101.39767930
      216   -54.49748832
      217  -164.97527473
      218   -30.10933978
      219   -96.39618863
      220   -62.01978237
      221   -30.72408259
      222    15.71968544
      223    77.56666667
      224    71.89914081
      225    50.25928016
      226   -69.63599265
      227   -82.06690237
      228   -81.45990684
      229    35.89187267
      230   -87.64393358
      231   -20.25929809
      232  -115.19199078
      233   -54.34902170
      234   -80.61263670
      235    62.35325108
      236   -82.77106414
      237   -66.61428807
      238  -183.64033613
      239  -215.32188020
      240  -120.88284050
      241   -29.18320802
      242    90.65577799
      243    35.19859809
      244    35.94642857
      245    64.76833977
      246    -6.49265490
      247   144.28571429
      248   144.28571429
      249    96.52380952
      250  -502.16666667
      251    34.53276353
      252     0.38888889
      253  -200.80000000
      254   -50.33864248
      255  -189.17371610
      256   502.83333333
      257     0.75443861
      258    42.84636763
      259   -19.67293792
      260    -6.51030224
      261   -55.51707253
      262   -74.71705168
      263   -11.39845444
      264   -63.35515484
      265   -59.52747432
      266    58.58767239
      267    16.29425089
      268    12.83781421
      269   -61.96124301
      270   -23.45688744
      271    14.97556609
      272    38.97529720
      273    10.94614174
      274   178.73214286
      275   178.73214286
      276   148.77728732
      277  -373.29166667
      278  -898.28744850
      279  -671.45836051
      280   -78.13231552
      281   -72.82237847
      282   -85.78167939
      283   -11.15662651
      284   -23.21236814
      285   -10.76447726
      286     1.00000000
      287     1.00000000
      288     1.00000000
      289     8.43726369
      290   -32.40108334
      291   -31.94835264
      292    17.83533835
      293    11.96061050
      294    24.09831462
      295     0.66666667
      296   -17.37382737
      297   -24.35465502
      298   -57.74191280
      299   -38.49837978
      300   -10.99114725
      301   -16.39525140
      302  -109.58922913
      303    -6.45888343
      304    30.59109312
      305    10.10495173
      306    15.79554656
      307    64.91896024
      308    64.91896024
      309    64.91896024
      310     8.41604785
      311    39.05505971
      312     7.45535467
      313   -20.92753623
      314   -20.92753623
      315   -20.92753623
      316     1.00000000
      317     1.00000000
      318     1.00000000
      319   -67.99473180
      320  -156.07577472
      321   -32.27781460
      322   -54.12135922
      323   -75.97982926
      324   -65.14563107
      325   -62.91196237
      326   -37.00727395
      327   -47.34621722
      328    15.94216758
      329    96.29184261
      330     0.16656099
      331   -44.82954545
      332  -150.53323807
      333   -36.68733358
      334   -40.55450237
      335    -6.75908373
      336    40.65395150
      337    -1.87164297
      338    62.02830371
      339    34.90326680
      340   -12.75507137
      341   -26.33491891
      342     3.09889660
      343    13.57571912
      344    11.88265580
      345    15.62783418
      346   -32.46111111
      347   -91.45833333
      348   -49.19166667
      349     8.63784349
      350     4.40845161
      351     3.00919217
      352    39.96916522
      353    57.29623299
      354    35.32011884
      355    42.42903226
      356     2.73735692
      357    -8.72880752
      358   -13.09722222
      359    26.06007068
      360   -23.61002758
      361   -20.20408163
      362   -20.20408163
      363   -20.20408163
      364  -113.63362989
      365  -167.95673389
      366   -28.66048018
      367    47.41279070
      368    66.97171161
      369    66.52393981
      370  -142.28571429
      371  -142.28571429
      372  -142.28571429
      373    44.48229167
      374     2.38927682
      375     1.36189236
      376     1.00000000
      377     1.00000000
      378     1.00000000
      379    20.09591002
      380   -59.21034082
      381   -30.56301652
      382   -21.91538953
      383   -13.76518917
      384   -18.07639682
      385   -15.07856598
      386    -3.82356979
      387   -11.05892449
      388    21.18594104
      389    48.73525651
      390    27.04469271
      391  -286.33333333
      392  -286.33333333
      393  -286.33333333
      394    34.20833333
      395    18.74250458
      396    17.32190126
      397     4.39373089
      398   -24.33605269
      399    -4.02945059
      400   -58.84188034
      401   -27.49613350
      402   -38.89458689
      403   -18.98055556
      404   -53.50299979
      405   -22.53838115
      406    35.31034483
      407    92.82758621
      408    66.74565754
      409   -23.54674221
      410   -19.25698098
      411   -25.93012276
      412  -356.75000000
      413  -237.83333333
      414  -428.10000000
      415   -43.72777778
      416   -58.63703704
      417   -54.88888889
      418   -42.93504795
      419   -46.87233778
      420   -15.58686013
      421    36.81292517
      422    50.74675347
      423    42.73337972
      424    84.37500000
      425  -232.89573129
      426  -274.26966827
      427   168.50000000
      428   168.50000000
      429    45.07894737
      430    75.83666667
      431    28.74090867
      432    15.16451914
      433   -30.08089034
      434   -28.26180836
      435   -15.47867930
      436    61.47700000
      437    66.84797700
      438    66.61440000
      439    25.98154373
      440    92.87829627
      441    45.46448160
      442     1.00000000
      443     1.00000000
      444     1.00000000
      445   -27.34722222
      446    18.29611116
      447    51.42727273
      448    28.90262172
      449    58.04430094
      450    24.09182487
      451    77.13675214
      452    27.22473605
      453    -5.29226656
      454    28.89076346
      455     4.04470688
      456    -4.77349616
      457    45.75862069
      458    48.11433757
      459    45.75862069
      460    38.36167341
      461     2.02176387
      462    44.59928966
      463  -177.53571429
      464   -18.94348216
      465   -67.01360544
      466     1.00000000
      467     1.00000000
      468     1.00000000
      469    41.29054054
      470    81.55185327
      471    17.38937242
      472   -79.02463768
      473   -40.95222311
      474   -10.72696338
      475   121.81927711
      476   239.32843704
      477    56.51686747
      478     0.00000000
      479    34.19610503
      480   -57.97790363
      481   999.16666667
      482   999.16666667
      483   666.44444444
      484     8.50654472
      485   -19.49644197
      486   -12.07257840
      487   266.45918367
      488   266.45918367
      489   222.21598639
      490   -56.01238739
      491    -4.25077051
      492    12.06578919
      493   -44.65852130
      494   -34.95645286
      495   -39.79132191
      496    26.25000000
      497    54.37191011
      498    52.22522523
      499     1.00000000
      500     1.00000000
      501     1.00000000
      502    45.95102041
      503    96.46816565
      504    13.84314869
      505     3.24302642
      506   -22.49847626
      507   -10.15310731
      508   235.35754190
      509   235.35754190
      510   118.17877095
      511   -35.53994490
      512    22.24718323
      513    12.65611489
      514    52.72089476
      515    52.69482441
      516    25.70743380
      517   402.40000000
      518    35.44423047
      519    93.81138020
      520   -72.42753623
      521   -70.48357219
      522   -29.63598475
      523    38.30326198
      524   -34.03215591
      525   -35.27784666
      526   -30.95126354
      527   -47.42626231
      528   -12.27168113
      529    26.32092331
      530    26.32092331
      531    11.12836932
      532   -34.88669951
      533   -61.20479030
      534   -41.37103258
      535     0.33333333
      536     0.25721785
      537    51.39894180
      538   -61.23684211
      539   -61.23684211
      540   -48.42993291
      541   -14.21487603
      542   -15.42061766
      543   -31.32782369
      544  -718.50000000
      545  -718.50000000
      546  -101.78571429
      547   -21.67825101
      548   -63.91617357
      549   -43.59531320
      550    86.93453243
      551   164.77500644
      552   102.70725648
      553    85.66505523
      554    48.78850649
      555    81.25325094
      556    19.16222618
      557   114.63184112
      558    84.26627306
      559   -29.68621918
      560   -78.48218615
      561   -54.10235990
      562    74.70235097
      563   135.69532463
      564   110.81053359
      565   -27.35877030
      566   -31.81630324
      567   -33.55086209
      568   -61.06660809
      569     3.39923555
      570   -72.01137734
      571    -3.88335218
      572    58.89472885
      573    34.96686732
      574   -13.97107210
      575     1.78201564
      576    18.00444564
      577    -6.62348922
      578   -10.87816992
      579   -12.32410456
      580    -1.33271720
      581   -49.70123940
      582   -42.59789905
      583    -0.75943628
      584    -9.10892579
      585   -27.20835525
      586   -16.42944027
      587     0.23421425
      588     3.18671623
      589    -8.75788210
      590   -17.95909113
      591   -15.76349270
      592    -6.07808618
      593   -12.52952279
      594   -13.71384710
      595     4.60661644
      596   -34.26630156
      597   -18.49702552
      598   -10.06613713
      599   -35.43745006
      600    -6.31214461
      601    19.24921226
      602     9.92619559
      603   -15.11200876
      604    18.54119449
      605   -30.46726539
      606   -41.83497218
      607   -13.70514918
      608   -52.26616074
      609   -47.67079099
      610    -0.28178959
      611    -4.04751097
      612     4.20545469
      613     7.73318335
      614   -14.53062187
      615   -18.63814480
      616     9.00186726
      617    10.15226923
      618    13.04058245
      619    73.22435897
      620    60.16813386
      621    35.83126259
      622     1.94267314
      623   -43.00582016
      624   -26.55673866
      625    -1.23037341
      626   -49.76259928
      627    -0.98994560
      628    36.64411765
      629   196.86277958
      630   162.10985474
      631    31.58807035
      632     5.27505009
      633   -31.69771226
      634    -3.75810337
      635   -10.68139257
      636    11.61840674
      637     6.37185873
      638    -4.37455901
      639   -20.77283216
      640     3.20473328
      641   -31.60049251
      642   -25.91573436
      643    -8.69139846
      644     0.28772118
      645    -2.11959352
      646    -2.84610597
      647   -17.62345739
      648   -12.51269549
      649    43.11744666
      650    36.88100841
      651    65.80255074
      652   -10.24182486
      653     0.94283769
      654     8.34154322
      655    -9.88524310
      656    19.77129904
      657     3.30333489
      658    10.24059375
      659    39.75668828
      660     1.06227195
      661    -3.26110006
      662    -3.71870746
      663   -16.54801618
      664     3.08247351
      665    -8.41047744
      666     5.68040724
      667    -9.64800700
      668    -0.43591125
      669    30.49800071
      670    -0.16539870
      671   -21.76758291
      672   -32.66455738
      673    -3.16972122
      674    -0.10341411
      675    -2.07292786
      676    -0.02072608
      677    20.53076218
      678    12.64665938
      679   -13.11060444
      680    38.39148680
      681     7.57701593
      682     1.17020538
      683    -1.64924382
      684   -47.35214261
      685     2.25039747
      686    -7.71119950
      687   -10.90430212
      688    -8.44873303
      689     4.15979132
      690    15.09147178
      691    -6.68732617
      692   -13.31496287
      693     1.53313194
      694    -6.70072627
      695   -23.16662302
      696   -27.37638255
      697    16.36932809
      698    20.37249539
      699    25.54339448
      700    -7.98522088
      701    19.86895810
      702    17.33653201
      703   -15.03910464
      704   -12.94491939
      705   -36.31475512
      706   -10.53885904
      707     1.76426820
      708    36.78228014
      709   -14.81772031
      710     6.76484913
      711     7.76667659
      712   -16.61987107
      713   -16.31999170
      714    -9.89937686
      715    -6.61760256
      716    15.38016209
      717    -3.90874575
      718   -63.43656344
      719    -4.49154869
      720   -87.30193343
      721    -1.51119213
      722   -43.90238135
      723   -18.92700911
      724   -14.83162664
      725    -1.62454485
      726     6.22879455
      727    -6.15188023
      728    35.37773774
      729    14.74913849
      730    -0.01732132
      731    -0.84118788
      732   -28.43835052
      733     1.43013108
      734    13.96205001
      735     3.08131638
      736    -6.79327030
      737     3.51933846
      738    14.75644448
      739    12.94794439
      740     3.66911314
      741   -11.01546146
      742    13.86083233
      743     4.20448668
      744     3.25890383
      745    27.94035645
      746    11.69924195
      747    -5.61574716
      748   -13.81294444
      749   -10.57248780
      750   -23.50384454
      751    -1.42924535
      752    -2.25032454
      753     9.33504759
      754   -19.56740345
      755     9.92391192
      756   -18.55878178
      757   -16.05551658
      758    -8.43436273
      759   -10.33393491
      760   -12.51935764
      761   -41.40151029
      762   -28.51415529
      763   -25.23321791
      764    -5.90427886
      765   -29.83585158
      766     1.81102699
      767     3.97498518
      768    -3.85677013
      769    -6.79027686
      770   -27.41503762
      771   -10.70279859
      772   -17.90842491
      773  -103.00883348
      774   -23.20843640
      775     7.28783665
      776    -2.97351164
      777    -5.01508006
      778   -13.33654614
      779     0.22118838
      780     2.46928244
      781     5.55280738
      782     2.81663726
      783    32.29633397
      784   -16.70574761
      785    24.90872932
      786   -31.56461847
      787     4.17975988
      788   -32.33707000
      789   -18.48993562
      790   -11.96108392
      791    -0.68226070
      792     3.76244825
      793    46.39485076
      794    32.41894566
      795    62.12187845
      796   -12.75632340
      797   -22.41116772
      798   -29.63719988
      799    13.22440638
      800    46.52999514
      801    14.51463261
      802     5.07492066
      803    -2.11421835
      804     6.78399747
      805     0.49555483
      806    51.26637476
      807    49.46191894
      808    29.05487022
      809   -14.35416950
      810   -20.78134733
      811   -12.04504276
      812    38.82231232
      813    30.35074614
      814    17.31978688
      815   -53.23981991
      816    -7.47871111
      817    -3.13393111
      818   -24.61095644
      819   -11.10878613
      820   140.92259674
      821  -103.07829531
      822   -40.33591595
      823   -17.97657749
      824    35.37682833
      825    51.02913577
      826     2.22456524
      827    39.20436381
      828    20.93796963
      829   -39.43415751
      830   -67.75185922
      831    32.73536056
      832    -9.43774487
      833   -11.73347808
      834    -3.41195111
      835    17.98208339
      836   -82.41422581
      837   -39.70651857
      838    -9.29281437
      839    -9.99595888
      840    -3.11593457
      841    71.90583164
      842    23.33963496
      843   -60.90003167
      844     0.29223905
      845    57.32475295
      846    42.12398154
      847   -26.57525558
      848    32.14221671
      849     4.71256065
      850     4.14635543
      851    -7.30901816
      852     2.41032118
      853    -4.13991932
      854   -22.59514507
      855   -20.62733523
      856   -10.52034557
      857     2.70813356
      858     2.67638896
      859   -13.18220967
      860    59.89448806
      861    54.95602258
      862     8.19418182
      863    72.37260646
      864    30.08919532
      865    -6.48762509
      866     2.25157190
      867    11.17756931
      868   -23.23278216
      869     7.57453138
      870   -45.70779926
      871    17.23444976
      872    61.05418346
      873    52.23276302
      874    -5.10999622
      875     2.68895723
      876     9.93654067
      877    -4.62040450
      878     1.89171655
      879     6.05003381
      880   -80.75761675
      881    51.93280666
      882    30.63414868
      883    33.32049689
      884   -72.82934528
      885   -68.82369332
      886    -1.55571625
      887    -1.81699202
      888    -3.87054002
      889    -2.40985637
      890   -57.01751766
      891   -39.15804049
      892    -3.74274452
      893   -76.60771017
      894   -48.83942855
      895     3.21249004
      896     9.22156756
      897    -4.62911221
      898     7.75563591
      899   -44.02186159
      900    10.75859463
      901    -6.78943563
      902    -9.29181379
      903     6.84995202
      904     0.56187278
      905   -11.21640317
      906   -11.64196209
      907     1.81262032
      908    37.63775236
      909    26.23591484
      910     0.78870596
      911   -40.27237344
      912   -13.43080894
      913    -0.42996305
      914   108.56150972
      915    15.41188692
      916    -5.96410165
      917   -42.44432747
      918   -62.90359724
      919   -26.38618819
      920    45.67580399
      921    44.68832724
      922   -13.92177788
      923   -13.60907035
      924    -6.60711116
      925    -5.60090699
      926   -33.71526588
      927   -31.08970172
      928   -31.67648163
      929   -26.00634459
      930   -23.41838790
      931    -2.08910274
      932    26.93859749
      933    15.28323046
      934   -24.54301667
      935    37.77107608
      936    10.63692360
      937    25.82626087
      938  -294.50528279
      939  -306.55384817
      940    -0.93741497
      941     6.00880354
      942   -84.67471518
      943     4.39908004
      944   -35.95540687
      945   -37.37245619
      946    -3.93924260
      947    26.20092304
      948    26.54202001
      949    -1.98184564
      950   -70.45049750
      951   -55.09636647
      952    19.34275187
      953   -21.34318042
      954    -2.50705395
      955    -3.50209553
      956    38.16694832
      957    43.67014173
      958    -3.03089426
      959   -36.48398222
      960   -14.67124071
      961   -53.58412698
      962   154.92373633
      963   179.01730780
      964   -46.65110449
      965   119.98557765
      966    20.39693807
      967     1.49305215
      968     3.75778370
      969    21.10111228
      970   -16.59440018
      971   -10.85777655
      972    15.99942179
      973    -0.38509631
      974   -18.20265364
      975    19.01025849
      976    -1.93409788
      977    16.51361336
      978    -0.85180541
      979     1.31732737
      980   -28.34751311
      981   -30.29388339
      982     4.42457551
      983    55.23785547
      984    84.59112543
      985     0.39444444
      986  -169.25562961
      987   -59.84886897
      988    -2.51738104
      989   -29.68926124
      990    11.79663894
      991    61.01091097
      992  -211.81482784
      993  -113.02717134
      994    16.21552250
      995   -17.79520044
      996   148.25360209
      997    -9.32147207
      998   -14.52165089
      999    23.68458670
      1000 -112.60258381
      1001  503.85472011
      1002   28.33655526
      1003  -37.42817361
      1004    6.01293426
      1005    3.90194429
      1006    6.03339852
      1007  -15.51572797
      1008  -11.01222942
      1009  -20.52199074
      1010   90.87345220
      1011   33.54172862
      1012    8.32130226
      1013   -1.01811276
      1014   66.60923352
      1015   22.86986373
      1016   -3.48665938
      1017  -39.72651554
      1018    4.77421997
      1019    0.22681810
      1020    3.18383711
      1021  -21.77398696
      1022   18.09894569
      1023  -16.23394345
      1024   -1.62758130
      1025   11.38373031
      1026   14.86916662
      1027   -7.15325920
      1028  -45.81584157
      1029  -22.69417869
      1030  -47.71699102
      1031   -9.53596970
      1032  -41.21010492
      1033   -2.27706499
      1034  -45.23000793
      1035    0.35113878
      1036   -9.78082800
      1037   38.82583855
      1038   -5.73945685
      1039    3.29853731
      1040    7.21945099
      1041    4.00940855
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
      set.seed(42)
      getLinearRegressions(getBetaMetrics(resampling(gridding(meta, btf), measure = "BIOMASS",
      resamps = 1L), measure = "BIOMASS"), divType = "beta")
    Message
      OK: all SL studies have 1 grid cell
    Condition
      Warning:
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

