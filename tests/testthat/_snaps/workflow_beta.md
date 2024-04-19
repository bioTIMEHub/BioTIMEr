# Whole workflow works consistently

    Code
      set.seed(42)
      gridding(meta, btf) %>% resampling(measure = "ABUNDANCE", resamps = 1L) %>%
        getBetaMetrics(measure = "ABUNDANCE") %>% getLinearRegressions(divType = "beta")
    Message
      OK: all SL studies have 1 grid cell
    Output
           assemblageID           metric         slope       pvalue significance
      1       10_358678      JaccardDiss  9.199134e-03 4.724426e-01            0
      2       10_358678 MorisitaHornDiss  1.008993e-03 1.691434e-01            0
      3       10_358678   BrayCurtisDiss -4.899627e-03 6.554540e-01            0
      4       18_335239      JaccardDiss  1.274780e-03 5.081774e-01            0
      5       18_335239 MorisitaHornDiss  1.606513e-03 4.834322e-01            0
      6       18_335239   BrayCurtisDiss  4.699316e-04 8.537627e-01            0
      7       41_452736      JaccardDiss  7.420661e-03 1.915310e-02            1
      8       41_452736 MorisitaHornDiss  1.166606e-02 2.516155e-02            1
      9       41_452736   BrayCurtisDiss  8.008083e-03 6.489529e-02            0
      10      53_393795      JaccardDiss -2.715858e-02 6.325870e-02            0
      11      53_393795 MorisitaHornDiss -1.748095e-02 9.829269e-02            0
      12      53_393795   BrayCurtisDiss -5.578685e-03 5.523670e-01            0
      13      59_470015      JaccardDiss -1.727384e-03 6.760536e-01            0
      14      59_470015 MorisitaHornDiss -2.332364e-03 2.886852e-01            0
      15      59_470015   BrayCurtisDiss -4.292601e-03 2.652656e-01            0
      16     333_426399      JaccardDiss -2.700895e-03 2.488221e-01            0
      17     333_426399 MorisitaHornDiss -2.278324e-03 6.512596e-01            0
      18     333_426399   BrayCurtisDiss -2.556426e-03 4.197160e-01            0
      19    372_2374177      JaccardDiss -1.583744e-02 3.142760e-01            0
      20    372_2374177 MorisitaHornDiss  1.303879e-01 4.964033e-02            1
      21    372_2374177   BrayCurtisDiss  5.347758e-02 3.188759e-01            0
      22    372_2378534      JaccardDiss -1.248538e-02 8.245280e-01            0
      23    372_2378534 MorisitaHornDiss -8.914750e-03 6.238235e-01            0
      24    372_2378534   BrayCurtisDiss -1.422627e-02 7.297483e-01            0
      25    372_2425908      JaccardDiss  2.665565e-02 6.236134e-01            0
      26    372_2425908 MorisitaHornDiss  2.013998e-02 6.251955e-01            0
      27    372_2425908   BrayCurtisDiss  1.689895e-02 7.336015e-01            0
      28    372_2427363      JaccardDiss -3.212136e-02 3.276767e-01            0
      29    372_2427363 MorisitaHornDiss  7.146120e-02 7.999080e-03            1
      30    372_2427363   BrayCurtisDiss  3.749751e-02 5.171438e-02            0
      31    372_2428091      JaccardDiss  8.008638e-03 7.347544e-01            0
      32    372_2428091 MorisitaHornDiss -3.899041e-03 8.938796e-01            0
      33    372_2428091   BrayCurtisDiss -4.844248e-02 3.226826e-01            0
      34    372_2425904      JaccardDiss  3.866689e-02 4.894483e-01            0
      35    372_2425904 MorisitaHornDiss  1.176345e-02 8.666694e-01            0
      36    372_2425904   BrayCurtisDiss  2.688767e-02 5.649390e-01            0
      37    372_2407700      JaccardDiss  2.096276e-03 9.740336e-01            0
      38    372_2407700 MorisitaHornDiss  1.317271e-01 3.106276e-01            0
      39    372_2407700   BrayCurtisDiss  9.917075e-03 7.927485e-01            0
      40    372_2398943      JaccardDiss  6.842656e-02 2.184631e-01            0
      41    372_2398943 MorisitaHornDiss  3.356505e-02 3.221338e-01            0
      42    372_2398943   BrayCurtisDiss  8.502761e-02 4.905164e-01            0
      43    372_2347198      JaccardDiss -4.015385e-02 2.370084e-01            0
      44    372_2347198 MorisitaHornDiss -2.693494e-02 3.380696e-01            0
      45    372_2347198   BrayCurtisDiss -2.502021e-02 4.540856e-01            0
      46    372_2430280      JaccardDiss  3.327680e-03 8.120209e-01            0
      47    372_2430280 MorisitaHornDiss  3.219271e-02 3.231692e-01            0
      48    372_2430280   BrayCurtisDiss -2.953876e-03 8.625105e-01            0
      49    372_2428088      JaccardDiss  3.445378e-02 7.081688e-02            0
      50    372_2428088 MorisitaHornDiss  3.544781e-02 5.687994e-01            0
      51    372_2428088   BrayCurtisDiss  2.296671e-02 3.672420e-01            0
      52    372_2407691      JaccardDiss  2.441558e-02 4.983410e-01            0
      53    372_2407691 MorisitaHornDiss  2.137934e-02 5.732931e-01            0
      54    372_2407691   BrayCurtisDiss  2.708408e-02 1.078828e-01            0
      55    372_2397485      JaccardDiss  7.159400e-03 7.835542e-01            0
      56    372_2397485 MorisitaHornDiss -2.285114e-02 1.886621e-01            0
      57    372_2397485   BrayCurtisDiss  1.580528e-02 7.937924e-01            0
      58    372_2400408      JaccardDiss -5.772587e-02 3.758629e-02            1
      59    372_2400408 MorisitaHornDiss -6.682944e-02 2.515187e-02            1
      60    372_2400408   BrayCurtisDiss -4.287809e-02 1.419802e-01            0
      61    372_2436844      JaccardDiss -2.174020e-02 4.891772e-01            0
      62    372_2436844 MorisitaHornDiss -1.653234e-02 6.255996e-01            0
      63    372_2436844   BrayCurtisDiss  1.008571e-02 6.895849e-01            0
      64    372_2424448      JaccardDiss -2.219780e-02 4.213752e-01            0
      65    372_2424448 MorisitaHornDiss -1.483230e-02 4.554872e-01            0
      66    372_2424448   BrayCurtisDiss -5.718125e-04 9.920045e-01            0
      67    372_2410600      JaccardDiss  1.169591e-02 7.969859e-01            0
      68    372_2410600 MorisitaHornDiss -7.966068e-03 8.751851e-01            0
      69    372_2410600   BrayCurtisDiss  2.428283e-04 9.958485e-01            0
      70    372_2374899      JaccardDiss  3.813131e-02 3.592915e-01            0
      71    372_2374899 MorisitaHornDiss  2.580127e-02 6.046794e-01            0
      72    372_2374899   BrayCurtisDiss  4.497995e-02 3.322929e-01            0
      73    372_2406225      JaccardDiss -4.193559e-02 2.017734e-01            0
      74    372_2406225 MorisitaHornDiss  1.421454e-02 5.290584e-01            0
      75    372_2406225   BrayCurtisDiss  2.566988e-02 5.748199e-01            0
      76    372_2459505      JaccardDiss -2.490693e-02 4.987366e-01            0
      77    372_2459505 MorisitaHornDiss  3.177554e-02 4.006933e-01            0
      78    372_2459505   BrayCurtisDiss  2.438215e-02 7.265263e-01            0
      79    372_2442010      JaccardDiss  2.838828e-01 3.373396e-01            0
      80    372_2442010 MorisitaHornDiss  4.390241e-01 3.372876e-01            0
      81    372_2442010   BrayCurtisDiss  3.232323e-01 3.384415e-01            0
      82    372_2433992      JaccardDiss -5.542316e-02 2.906680e-02            1
      83    372_2433992 MorisitaHornDiss -3.370744e-02 3.850633e-01            0
      84    372_2433992   BrayCurtisDiss -5.128119e-02 5.276189e-02            0
      85    372_2366870      JaccardDiss  1.972698e-02 5.329762e-01            0
      86    372_2366870 MorisitaHornDiss  9.358890e-03 8.118336e-01            0
      87    372_2366870   BrayCurtisDiss -4.949736e-03 8.614280e-01            0
      88    372_2440508      JaccardDiss  3.221532e-02 5.072509e-01            0
      89    372_2440508 MorisitaHornDiss  7.237424e-02 3.657085e-01            0
      90    372_2440508   BrayCurtisDiss  3.589309e-02 5.166285e-01            0
      91    372_2442692      JaccardDiss  6.502629e-02 2.372321e-01            0
      92    372_2442692 MorisitaHornDiss  9.156447e-02 3.600999e-01            0
      93    372_2442692   BrayCurtisDiss  7.865379e-02 2.310237e-01            0
      94    372_2432467      JaccardDiss -7.133005e-02 5.490335e-01            0
      95    372_2432467 MorisitaHornDiss -1.131262e-01 3.652473e-01            0
      96    372_2432467   BrayCurtisDiss -8.912919e-02 3.021670e-01            0
      97    372_2428094      JaccardDiss  6.723602e-02 3.279625e-01            0
      98    372_2428094 MorisitaHornDiss  5.639579e-02 6.493258e-01            0
      99    372_2428094   BrayCurtisDiss  9.037901e-02 2.438393e-01            0
      100   372_2432464      JaccardDiss -3.000000e-01 2.254033e-01            0
      101   372_2432464 MorisitaHornDiss -3.000000e-01 2.254033e-01            0
      102   372_2432464   BrayCurtisDiss -1.714286e-01 2.254033e-01            0
      103   372_2421551      JaccardDiss  1.011905e-01 2.973036e-01            0
      104   372_2421551 MorisitaHornDiss -5.496420e-03 9.765481e-01            0
      105   372_2421551   BrayCurtisDiss  8.050142e-02 4.663742e-01            0
      106   372_2406229      JaccardDiss -5.955125e-04 7.982051e-01            0
      107   372_2406229 MorisitaHornDiss  6.530551e-02 1.878822e-01            0
      108   372_2406229   BrayCurtisDiss  5.919049e-02 6.916873e-02            0
      109   372_2402583      JaccardDiss -2.680808e-02 5.111473e-01            0
      110   372_2402583 MorisitaHornDiss -4.871120e-02 3.396964e-01            0
      111   372_2402583   BrayCurtisDiss -2.415584e-02 4.271996e-01            0
      112   372_2425903      JaccardDiss -2.140921e-02 5.217146e-01            0
      113   372_2425903 MorisitaHornDiss  5.669685e-02 7.526040e-01            0
      114   372_2425903   BrayCurtisDiss  2.951231e-02 6.223725e-01            0
      115   372_2426633      JaccardDiss  4.726319e-02 3.753297e-01            0
      116   372_2426633 MorisitaHornDiss -5.363214e-02 5.346975e-01            0
      117   372_2426633   BrayCurtisDiss -7.842308e-03 8.957821e-01            0
      118   372_2403302      JaccardDiss -7.516858e-02 1.085237e-01            0
      119   372_2403302 MorisitaHornDiss  1.502112e-02 8.136895e-01            0
      120   372_2403302   BrayCurtisDiss -8.919838e-02 4.528605e-01            0
      121   372_2369058      JaccardDiss  2.024033e-02 6.931469e-01            0
      122   372_2369058 MorisitaHornDiss -2.464217e-02 7.965246e-01            0
      123   372_2369058   BrayCurtisDiss  2.645858e-02 7.115744e-01            0
      124   372_2399671      JaccardDiss -1.060791e-02 6.304316e-01            0
      125   372_2399671 MorisitaHornDiss  3.955357e-02 2.802045e-01            0
      126   372_2399671   BrayCurtisDiss  9.839510e-03 6.756241e-01            0
      127   372_2431035      JaccardDiss -2.562720e-03 8.943325e-01            0
      128   372_2431035 MorisitaHornDiss  7.783757e-03 8.434507e-01            0
      129   372_2431035   BrayCurtisDiss  1.231788e-02 7.983904e-01            0
      130   372_2443467      JaccardDiss  1.324384e-02 8.383167e-01            0
      131   372_2443467 MorisitaHornDiss  5.234463e-02 5.643532e-01            0
      132   372_2443467   BrayCurtisDiss  2.725155e-02 6.965385e-01            0
      133   372_2393839      JaccardDiss  5.224660e-03 8.209582e-01            0
      134   372_2393839 MorisitaHornDiss -3.410366e-02 7.999154e-02            0
      135   372_2393839   BrayCurtisDiss -5.376214e-03 7.161053e-01            0
      136   372_2362487      JaccardDiss  2.471284e-02 6.560140e-01            0
      137   372_2362487 MorisitaHornDiss -4.745260e-02 4.372191e-01            0
      138   372_2362487   BrayCurtisDiss -3.125001e-02 6.144256e-01            0
      139   372_2409874      JaccardDiss  4.565048e-03 9.299985e-01            0
      140   372_2409874 MorisitaHornDiss  6.694686e-02 7.347011e-04            1
      141   372_2409874   BrayCurtisDiss  4.857136e-02 4.649265e-02            1
      142   372_2452208      JaccardDiss  1.423758e-02 1.828928e-01            0
      143   372_2452208 MorisitaHornDiss  2.447692e-02 5.313678e-01            0
      144   372_2452208   BrayCurtisDiss  2.515234e-02 3.111137e-02            1
      145   372_2379269      JaccardDiss -1.111040e-01 4.631785e-02            1
      146   372_2379269 MorisitaHornDiss -1.159919e-01 9.728178e-02            0
      147   372_2379269   BrayCurtisDiss -1.292971e-01 5.985326e-03            1
      148   372_2441280      JaccardDiss  3.856105e-02 2.184093e-01            0
      149   372_2441280 MorisitaHornDiss  1.341167e-02 6.990942e-01            0
      150   372_2441280   BrayCurtisDiss -3.614867e-03 9.051236e-01            0
      151   372_2442005      JaccardDiss  9.998646e-03 7.282295e-01            0
      152   372_2442005 MorisitaHornDiss  1.717299e-01 5.082200e-01            0
      153   372_2442005   BrayCurtisDiss  5.828469e-02 5.997032e-01            0
      154   372_2439790      JaccardDiss  3.825959e-02 2.883398e-01            0
      155   372_2439790 MorisitaHornDiss -8.020716e-05 9.978861e-01            0
      156   372_2439790   BrayCurtisDiss  1.304443e-02 6.061358e-01            0
      157   372_2437599      JaccardDiss -4.522559e-02 4.070038e-01            0
      158   372_2437599 MorisitaHornDiss -7.394189e-02 2.311720e-01            0
      159   372_2437599   BrayCurtisDiss -5.554443e-02 2.015178e-01            0
      160   372_2433956      JaccardDiss -7.701149e-02 1.305816e-01            0
      161   372_2433956 MorisitaHornDiss -1.389937e-02 2.222157e-01            0
      162   372_2433956   BrayCurtisDiss -1.420971e-01 1.054395e-01            0
      163   372_2435398      JaccardDiss -2.767992e-02 4.870820e-01            0
      164   372_2435398 MorisitaHornDiss  2.546496e-02 4.029351e-01            0
      165   372_2435398   BrayCurtisDiss  5.507351e-02 2.984688e-01            0
      166   372_2425178      JaccardDiss  3.247097e-03 9.621115e-01            0
      167   372_2425178 MorisitaHornDiss  1.488814e-02 8.889956e-01            0
      168   372_2425178   BrayCurtisDiss  1.039753e-02 7.726203e-01            0
      169   372_2426634      JaccardDiss  2.684408e-02 3.816162e-01            0
      170   372_2426634 MorisitaHornDiss  1.950203e-02 5.489180e-01            0
      171   372_2426634   BrayCurtisDiss  2.899412e-02 5.939334e-01            0
      172   372_2427362      JaccardDiss -9.769799e-02 8.159946e-02            0
      173   372_2427362 MorisitaHornDiss  2.089290e-02 3.568929e-01            0
      174   372_2427362   BrayCurtisDiss -1.163024e-02 7.123754e-01            0
      175   372_2428818      JaccardDiss -4.819865e-02 2.537570e-01            0
      176   372_2428818 MorisitaHornDiss -2.424811e-02 5.915184e-01            0
      177   372_2428818   BrayCurtisDiss -3.153648e-02 4.737276e-01            0
      178   372_2428817      JaccardDiss  3.439622e-02 1.102513e-01            0
      179   372_2428817 MorisitaHornDiss  2.787216e-02 6.958127e-01            0
      180   372_2428817   BrayCurtisDiss  1.800878e-02 8.783540e-01            0
      181   372_2425199      JaccardDiss  4.771739e-02 6.433857e-01            0
      182   372_2425199 MorisitaHornDiss  2.172545e-01 9.268249e-02            0
      183   372_2425199   BrayCurtisDiss  1.320179e-01 3.579394e-01            0
      184   372_2423009      JaccardDiss -7.331378e-03 9.655755e-01            0
      185   372_2423009 MorisitaHornDiss -4.214438e-03 9.941821e-01            0
      186   372_2423009   BrayCurtisDiss  1.091188e-02 9.755970e-01            0
      187   372_2404057      JaccardDiss -4.814815e-02 1.413432e-02            1
      188   372_2404057 MorisitaHornDiss  1.619126e-02 5.466281e-01            0
      189   372_2404057   BrayCurtisDiss  1.114364e-01 1.427972e-01            0
      190   372_2412081      JaccardDiss  3.055556e-01 3.333333e-01            0
      191   372_2412081 MorisitaHornDiss  1.154008e-01 3.096330e-01            0
      192   372_2412081   BrayCurtisDiss  2.130793e-01 3.592647e-01            0
      193   372_2419351      JaccardDiss -1.124424e-02 8.610529e-01            0
      194   372_2419351 MorisitaHornDiss  1.086711e-01 1.360424e-01            0
      195   372_2419351   BrayCurtisDiss  6.591582e-02 3.052490e-01            0
      196   372_2418626      JaccardDiss  2.675214e-02 6.044321e-01            0
      197   372_2418626 MorisitaHornDiss  4.657165e-02 7.632285e-01            0
      198   372_2418626   BrayCurtisDiss  5.217656e-02 5.371238e-01            0
      199   372_2409154      JaccardDiss  8.241758e-02 1.091826e-01            0
      200   372_2409154 MorisitaHornDiss  1.538714e-02 9.203492e-01            0
      201   372_2409154   BrayCurtisDiss  4.833333e-02 5.517498e-01            0
      202   372_2403315      JaccardDiss  1.501231e-02 8.064582e-01            0
      203   372_2403315 MorisitaHornDiss  1.465136e-02 6.937355e-01            0
      204   372_2403315   BrayCurtisDiss  1.707517e-02 5.991990e-01            0
      205   372_2400400      JaccardDiss -1.197160e-02 7.137114e-01            0
      206   372_2400400 MorisitaHornDiss -3.070471e-02 1.769500e-01            0
      207   372_2400400   BrayCurtisDiss -1.644182e-02 6.392324e-01            0
      208   372_2393850      JaccardDiss -1.885947e-02 5.300142e-01            0
      209   372_2393850 MorisitaHornDiss -3.452875e-02 2.894249e-01            0
      210   372_2393850   BrayCurtisDiss  4.323548e-03 7.827711e-01            0
      211   372_2398940      JaccardDiss -1.118064e-02 7.410206e-01            0
      212   372_2398940 MorisitaHornDiss  7.639250e-03 9.171032e-01            0
      213   372_2398940   BrayCurtisDiss  1.142780e-02 8.740322e-01            0
      214   372_2375616      JaccardDiss  1.680985e-01 1.001358e-01            0
      215   372_2375616 MorisitaHornDiss  1.358939e-01 9.565083e-03            1
      216   372_2375616   BrayCurtisDiss  1.406088e-01 6.746103e-03            1
      217   372_2363236      JaccardDiss -4.190119e-02 4.054395e-01            0
      218   372_2363236 MorisitaHornDiss  7.660150e-02 5.810774e-01            0
      219   372_2363236   BrayCurtisDiss  3.945431e-02 3.870199e-01            0
      220   372_2365397      JaccardDiss  7.987777e-02 1.051203e-01            0
      221   372_2365397 MorisitaHornDiss  9.318934e-02 1.845700e-01            0
      222   372_2365397   BrayCurtisDiss  4.531129e-02 7.716041e-02            0
      223   372_2434649      JaccardDiss  1.463890e-02 8.478391e-01            0
      224   372_2434649 MorisitaHornDiss  5.507792e-02 2.131136e-01            0
      225   372_2434649   BrayCurtisDiss  2.377130e-02 5.520392e-01            0
      226   372_2432468      JaccardDiss  1.785714e-02 7.349202e-01            0
      227   372_2432468 MorisitaHornDiss -2.668053e-02 7.137862e-01            0
      228   372_2432468   BrayCurtisDiss  2.126770e-02 7.433869e-01            0
      229   372_2433200      JaccardDiss -7.142857e-02 8.789623e-01            0
      230   372_2433200 MorisitaHornDiss -7.142857e-02 8.789623e-01            0
      231   372_2433200   BrayCurtisDiss -4.761905e-02 8.789623e-01            0
      232   372_2425914      JaccardDiss  2.500000e-01 3.333333e-01            0
      233   372_2425914 MorisitaHornDiss -1.709402e-02 9.216369e-01            0
      234   372_2425914   BrayCurtisDiss -2.466750e-14 1.000000e+00            0
      235   372_2428090      JaccardDiss  6.666667e-02 7.418011e-01            0
      236   372_2428090 MorisitaHornDiss  4.454125e-02 7.475942e-01            0
      237   372_2428090   BrayCurtisDiss  4.828942e-02 8.250931e-01            0
      238   372_2414240      JaccardDiss -2.500000e-01 3.333333e-01            0
      239   372_2414240 MorisitaHornDiss -6.605020e-04 3.333333e-01            0
      240   372_2414240   BrayCurtisDiss  5.777778e-02 7.604948e-01            0
      241   402_3191114      JaccardDiss  2.186312e-02 6.448239e-01            0
      242   402_3191114 MorisitaHornDiss  3.233182e-02 5.841660e-01            0
      243   402_3191114   BrayCurtisDiss  1.709095e-02 7.083312e-01            0
      244   402_3191113      JaccardDiss  3.448525e-03 9.543624e-01            0
      245   402_3191113 MorisitaHornDiss  6.673655e-02 5.632078e-01            0
      246   402_3191113   BrayCurtisDiss  3.459048e-02 7.452944e-01            0
      247   402_3190383      JaccardDiss  4.005833e-03 9.470521e-01            0
      248   402_3190383 MorisitaHornDiss -4.031774e-02 5.436513e-01            0
      249   402_3190383   BrayCurtisDiss  4.349580e-04 9.935388e-01            0
      250   431_5117859      JaccardDiss  5.180328e-02 1.166049e-01            0
      251   431_5117859 MorisitaHornDiss  6.592913e-02 3.452383e-01            0
      252   431_5117859   BrayCurtisDiss  7.456779e-02 4.186105e-02            1
      253   431_5122228      JaccardDiss -3.291206e-03 8.371166e-01            0
      254   431_5122228 MorisitaHornDiss -2.487144e-02 4.462684e-01            0
      255   431_5122228   BrayCurtisDiss -9.481166e-04 7.577490e-01            0
      256   431_4765005      JaccardDiss -8.928571e-02 2.122956e-01            0
      257   431_4765005 MorisitaHornDiss -8.928571e-02 2.122956e-01            0
      258   431_4765005   BrayCurtisDiss -7.423756e-02 2.122956e-01            0
      259   431_5102575      JaccardDiss -5.209739e-14 1.000000e+00            0
      260   431_5102575 MorisitaHornDiss -1.616762e-15 1.000000e+00            0
      261   431_5102575   BrayCurtisDiss -1.078309e-14 1.000000e+00            0
      262   431_4748960      JaccardDiss  1.590331e-02 7.967394e-01            0
      263   431_4748960 MorisitaHornDiss  1.618948e-02 7.772329e-01            0
      264   431_4748960   BrayCurtisDiss  3.173926e-02 4.620608e-01            0
      265   431_4749689      JaccardDiss  6.024096e-03 9.366276e-01            0
      266   431_4749689 MorisitaHornDiss  1.199820e-02 9.366276e-01            0
      267   431_4749689   BrayCurtisDiss  3.804692e-03 9.366276e-01            0
      268   431_4751148      JaccardDiss  2.222222e-02 7.418011e-01            0
      269   431_4751148 MorisitaHornDiss  2.295146e-02 7.418011e-01            0
      270   431_4751148   BrayCurtisDiss  1.731602e-02 7.418011e-01            0
      271   431_5120046      JaccardDiss  1.808804e-02 8.990424e-02            0
      272   431_5120046 MorisitaHornDiss  1.296495e-02 3.788816e-01            0
      273   431_5120046   BrayCurtisDiss  1.687106e-02 9.434636e-02            0
      274   431_5132431      JaccardDiss -3.007519e-02 7.145180e-01            0
      275   431_5132431 MorisitaHornDiss -1.846813e-02 7.285517e-01            0
      276   431_5132431   BrayCurtisDiss -1.617138e-02 6.676811e-01            0
      277   431_5133160      JaccardDiss -3.237179e-17 4.785132e-02            1
      278   431_5133160 MorisitaHornDiss  8.851463e-03 6.188153e-01            0
      279   431_5133160   BrayCurtisDiss  1.251574e-02 3.686561e-01            0
      280   431_5132432      JaccardDiss -5.907173e-03 8.550753e-01            0
      281   431_5132432 MorisitaHornDiss  1.146888e-02 8.193264e-01            0
      282   431_5132432   BrayCurtisDiss  1.217561e-03 9.031482e-01            0
      283   431_4744569      JaccardDiss -2.482930e-02 4.227290e-02            1
      284   431_4744569 MorisitaHornDiss -3.773556e-02 2.464556e-01            0
      285   431_4744569   BrayCurtisDiss -1.971152e-02 9.168518e-02            0
      286   431_5104025      JaccardDiss -1.484480e-02 7.723926e-01            0
      287   431_5104025 MorisitaHornDiss -4.567632e-03 7.723926e-01            0
      288   431_5104025   BrayCurtisDiss -7.422402e-03 7.723926e-01            0
      289   431_4764276      JaccardDiss -3.211009e-02 6.055959e-01            0
      290   431_4764276 MorisitaHornDiss -3.211009e-02 6.055959e-01            0
      291   431_4764276   BrayCurtisDiss -3.211009e-02 6.055959e-01            0
      292   431_5122229      JaccardDiss  4.537954e-03 8.536211e-01            0
      293   431_5122229 MorisitaHornDiss -1.513857e-02 6.399606e-01            0
      294   431_5122229   BrayCurtisDiss -1.263375e-03 9.289796e-01            0
      295   431_5100388      JaccardDiss  1.086957e-02 7.598349e-01            0
      296   431_5100388 MorisitaHornDiss  1.086957e-02 7.598349e-01            0
      297   431_5100388   BrayCurtisDiss  1.086957e-02 7.598349e-01            0
      298   431_5100387      JaccardDiss -1.065574e-01 3.901235e-02            1
      299   431_5100387 MorisitaHornDiss -1.065574e-01 3.901235e-02            1
      300   431_5100387   BrayCurtisDiss -1.989071e-02 3.901235e-02            1
      301   431_5101114      JaccardDiss  0.000000e+00          NaN           NA
      302   431_5101114 MorisitaHornDiss  0.000000e+00          NaN           NA
      303   431_5101114   BrayCurtisDiss  0.000000e+00          NaN           NA
      304   431_5101115      JaccardDiss  1.340996e-02 6.172786e-01            0
      305   431_5101115 MorisitaHornDiss  4.954471e-02 3.163929e-01            0
      306   431_5101115   BrayCurtisDiss -2.232268e-04 9.917517e-01            0
      307   431_4763547      JaccardDiss  2.750809e-02 2.927072e-01            0
      308   431_4763547 MorisitaHornDiss  3.841647e-02 2.927072e-01            0
      309   431_4763547   BrayCurtisDiss  3.300971e-02 2.927072e-01            0
      310   431_4743109      JaccardDiss -1.599462e-02 4.962773e-01            0
      311   431_4743109 MorisitaHornDiss -9.767695e-03 7.550466e-01            0
      312   431_4743109   BrayCurtisDiss -5.385945e-03 7.258333e-01            0
      313   431_5122232      JaccardDiss  1.639344e-02 7.074500e-01            0
      314   431_5122232 MorisitaHornDiss  3.249151e-02 7.074500e-01            0
      315   431_5122232   BrayCurtisDiss  2.761001e-02 7.074500e-01            0
      316   431_5110583      JaccardDiss  8.741259e-03 5.694377e-01            0
      317   431_5110583 MorisitaHornDiss  3.414554e-02 5.694377e-01            0
      318   431_5110583   BrayCurtisDiss  2.622378e-02 4.420977e-01            0
      319   431_5122961      JaccardDiss  3.080569e-02 7.046442e-01            0
      320   431_5122961 MorisitaHornDiss  3.080569e-02 7.046442e-01            0
      321   431_5122961   BrayCurtisDiss  2.738283e-02 7.046442e-01            0
      322   431_5122960      JaccardDiss  1.184834e-03 9.620224e-01            0
      323   431_5122960 MorisitaHornDiss -1.784007e-03 8.346166e-02            0
      324   431_5122960   BrayCurtisDiss  5.220287e-03 7.856076e-01            0
      325   431_5120044      JaccardDiss  6.761833e-03 7.533089e-01            0
      326   431_5120044 MorisitaHornDiss  1.343753e-02 7.533089e-01            0
      327   431_5120044   BrayCurtisDiss  9.492101e-03 6.648141e-01            0
      328   431_4756232      JaccardDiss  1.459391e-02 6.090871e-01            0
      329   431_4756232 MorisitaHornDiss  7.637371e-02 1.831525e-02            1
      330   431_4756232   BrayCurtisDiss  5.498469e-02 3.017383e-03            1
      331   431_5124412      JaccardDiss  1.967131e-31 1.000000e+00            0
      332   431_5124412 MorisitaHornDiss  1.967131e-31 1.000000e+00            0
      333   431_5124412   BrayCurtisDiss  1.967131e-31 1.000000e+00            0
      334   431_5119317      JaccardDiss -7.392473e-03 3.569220e-01            0
      335   431_5119317 MorisitaHornDiss -1.454063e-02 3.569220e-01            0
      336   431_5119317   BrayCurtisDiss -6.133015e-03 3.569220e-01            0
      337   431_4748231      JaccardDiss  5.343732e-03 6.326729e-01            0
      338   431_4748231 MorisitaHornDiss  1.722827e-02 2.818609e-01            0
      339   431_4748231   BrayCurtisDiss  1.409240e-02 1.499912e-01            0
      340   431_4755525      JaccardDiss -2.096774e-02 3.504545e-01            0
      341   431_4755525 MorisitaHornDiss -1.352758e-03 3.504545e-01            0
      342   431_4755525   BrayCurtisDiss  2.866395e-02 3.876781e-01            0
      343   431_5101846      JaccardDiss -1.329787e-03 9.566770e-01            0
      344   431_5101846 MorisitaHornDiss -1.496792e-02 7.547071e-01            0
      345   431_5101846   BrayCurtisDiss -1.614309e-02 4.145060e-01            0
      346   431_5101844      JaccardDiss  5.102041e-02 5.876070e-01            0
      347   431_5101844 MorisitaHornDiss  5.102041e-02 5.876070e-01            0
      348   431_5101844   BrayCurtisDiss  5.102041e-02 5.876070e-01            0
      349   431_5113493      JaccardDiss  3.421454e-02 3.987236e-01            0
      350   431_5113493 MorisitaHornDiss -2.306356e-02 5.487857e-01            0
      351   431_5113493   BrayCurtisDiss -1.369075e-02 2.982617e-01            0
      352   431_4770091      JaccardDiss -2.325581e-02 5.823435e-01            0
      353   431_4770091 MorisitaHornDiss -3.305610e-02 5.823435e-01            0
      354   431_4770091   BrayCurtisDiss -3.283174e-02 5.823435e-01            0
      355   431_5101116      JaccardDiss  3.571429e-02 8.789623e-01            0
      356   431_5101116 MorisitaHornDiss  3.240349e-03 8.789623e-01            0
      357   431_5101116   BrayCurtisDiss  5.952381e-03 8.789623e-01            0
      358   431_5101118      JaccardDiss  1.413694e-17 5.011694e-01            0
      359   431_5101118 MorisitaHornDiss  1.413694e-17 5.011694e-01            0
      360   431_5101118   BrayCurtisDiss  1.413694e-17 5.011694e-01            0
      361   431_5123684      JaccardDiss -2.226721e-02 7.723926e-01            0
      362   431_5123684 MorisitaHornDiss -2.226721e-02 7.723926e-01            0
      363   431_5123684   BrayCurtisDiss -1.484480e-02 7.723926e-01            0
      364   431_5100389      JaccardDiss -9.713701e-03 8.351057e-01            0
      365   431_5100389 MorisitaHornDiss  3.001290e-02 1.112136e-01            0
      366   431_5100389   BrayCurtisDiss  1.571547e-02 6.560935e-02            0
      367   431_5120772      JaccardDiss  1.133461e-02 3.298009e-01            0
      368   431_5120772 MorisitaHornDiss  7.173865e-03 8.470315e-01            0
      369   431_5120772   BrayCurtisDiss  9.481333e-03 1.711937e-01            0
      370   431_4748961      JaccardDiss  9.450914e-18 5.574822e-01            0
      371   431_4748961 MorisitaHornDiss  9.450914e-18 5.574822e-01            0
      372   431_4748961   BrayCurtisDiss  9.450914e-18 5.574822e-01            0
      373   431_4749690      JaccardDiss -2.721088e-02 9.125790e-02            0
      374   431_4749690 MorisitaHornDiss -5.014577e-02 9.125790e-02            0
      375   431_4749690   BrayCurtisDiss -3.710575e-03 9.125790e-02            0
      376   431_4781017      JaccardDiss  1.428571e-01 5.456289e-01            0
      377   431_4781017 MorisitaHornDiss  1.428571e-01 5.456289e-01            0
      378   431_4781017   BrayCurtisDiss  1.428571e-01 5.456289e-01            0
      379   431_4748944      JaccardDiss -1.289683e-02 2.276996e-01            0
      380   431_4748944 MorisitaHornDiss  2.221815e-03 9.315235e-01            0
      381   431_4748944   BrayCurtisDiss  3.456043e-03 7.256475e-01            0
      382   431_5122956      JaccardDiss  6.422018e-03 6.055959e-01            0
      383   431_5122956 MorisitaHornDiss  2.514320e-02 1.338971e-01            0
      384   431_5122956   BrayCurtisDiss  1.863932e-02 1.555691e-01            0
      385   431_4739485      JaccardDiss  1.546602e-02 3.360863e-01            0
      386   431_4739485 MorisitaHornDiss  5.426672e-03 8.858772e-01            0
      387   431_4739485   BrayCurtisDiss  1.546602e-02 3.360863e-01            0
      388   431_5120045      JaccardDiss -1.590909e-02 2.936115e-01            0
      389   431_5120045 MorisitaHornDiss -4.171421e-02 9.546698e-02            0
      390   431_5120045   BrayCurtisDiss -1.675299e-02 9.686616e-02            0
      391   431_5115676      JaccardDiss -1.724138e-02 6.783662e-01            0
      392   431_5115676 MorisitaHornDiss -4.597701e-02 6.286093e-01            0
      393   431_5115676   BrayCurtisDiss -3.287682e-02 5.602455e-01            0
      394   431_4742381      JaccardDiss -1.558074e-02 4.883606e-01            0
      395   431_4742381 MorisitaHornDiss -1.780656e-02 4.883606e-01            0
      396   431_4742381   BrayCurtisDiss  1.931067e-02 8.821401e-03            1
      397   431_4763546      JaccardDiss -1.428571e-01 4.543711e-01            0
      398   431_4763546 MorisitaHornDiss -1.904762e-01 4.543711e-01            0
      399   431_4763546   BrayCurtisDiss -1.142857e-01 4.543711e-01            0
      400   431_4750418      JaccardDiss  5.555556e-03 9.139337e-01            0
      401   431_4750418 MorisitaHornDiss  7.407407e-03 9.139337e-01            0
      402   431_4750418   BrayCurtisDiss  5.555556e-03 9.139337e-01            0
      403   431_4743129      JaccardDiss  1.700087e-02 4.963203e-01            0
      404   431_4743129 MorisitaHornDiss  1.700087e-02 4.963203e-01            0
      405   431_4743129   BrayCurtisDiss  9.714784e-03 4.963203e-01            0
      406   431_5125142      JaccardDiss -1.797862e-02 2.977982e-02            1
      407   431_5125142 MorisitaHornDiss -2.498702e-02 6.913652e-01            0
      408   431_5125142   BrayCurtisDiss -2.096175e-02 6.849153e-01            0
      409   431_4757692      JaccardDiss -4.166667e-02 6.666667e-01            0
      410   431_4757692 MorisitaHornDiss  1.158437e-01 2.512152e-01            0
      411   431_4757692   BrayCurtisDiss  1.365067e-01 3.116773e-01            0
      412   431_4755504      JaccardDiss -8.333333e-02 1.339746e-01            0
      413   431_4755504 MorisitaHornDiss -8.333333e-02 1.339746e-01            0
      414   431_4755504   BrayCurtisDiss -2.192982e-02 1.339746e-01            0
      415   431_5112765      JaccardDiss  4.452381e-02 4.697304e-01            0
      416   431_5112765 MorisitaHornDiss  3.414783e-02 6.130112e-01            0
      417   431_5112765   BrayCurtisDiss  3.542237e-02 5.353615e-01            0
      418   431_4735113      JaccardDiss  1.036916e-02 1.309041e-01            0
      419   431_4735113 MorisitaHornDiss  4.503762e-03 1.514210e-01            0
      420   431_4735113   BrayCurtisDiss  5.863192e-03 3.224118e-03            1
      421   431_5101117      JaccardDiss -8.333333e-05 9.966578e-01            0
      422   431_5101117 MorisitaHornDiss -7.000943e-03 3.770795e-01            0
      423   431_5101117   BrayCurtisDiss -4.840580e-03 3.947298e-01            0
      424   431_4751862      JaccardDiss -8.568980e-04 9.428999e-01            0
      425   431_4751862 MorisitaHornDiss -1.130686e-02 6.767495e-01            0
      426   431_4751862   BrayCurtisDiss -4.116877e-03 7.302800e-01            0
      427   431_4754796      JaccardDiss -1.494446e-17 5.672414e-01            0
      428   431_4754796 MorisitaHornDiss -1.494446e-17 5.672414e-01            0
      429   431_4754796   BrayCurtisDiss -1.494446e-17 5.672414e-01            0
      430   431_4753316      JaccardDiss  1.388889e-02 9.005747e-01            0
      431   431_4753316 MorisitaHornDiss -8.793290e-03 8.851274e-01            0
      432   431_4753316   BrayCurtisDiss  1.111111e-02 7.877044e-01            0
      433   431_4748945      JaccardDiss -2.093973e-02 2.434600e-01            0
      434   431_4748945 MorisitaHornDiss -2.791965e-02 2.434600e-01            0
      435   431_4748945   BrayCurtisDiss -1.080760e-02 2.434600e-01            0
      436   431_4780294      JaccardDiss -3.846154e-02 4.877543e-01            0
      437   431_4780294 MorisitaHornDiss -1.357466e-02 4.877543e-01            0
      438   431_4780294   BrayCurtisDiss  2.838338e-03 9.072507e-01            0
      439   431_4743840      JaccardDiss -1.060838e-02 2.090852e-01            0
      440   431_4743840 MorisitaHornDiss -7.072256e-03 2.090852e-01            0
      441   431_4743840   BrayCurtisDiss -6.539992e-03 5.102856e-01            0
      442   431_4780288      JaccardDiss -2.241379e-02 3.766977e-01            0
      443   431_4780288 MorisitaHornDiss -1.066733e-03 3.766977e-01            0
      444   431_4780288   BrayCurtisDiss -1.949025e-03 3.766977e-01            0
      445   431_4780295      JaccardDiss -1.889339e-02 6.057312e-01            0
      446   431_4780295 MorisitaHornDiss -9.957326e-04 6.057312e-01            0
      447   431_4780295   BrayCurtisDiss -6.455116e-03 8.165650e-01            0
      448   431_4737299      JaccardDiss  8.928571e-02 2.122956e-01            0
      449   431_4737299 MorisitaHornDiss  9.973736e-03 2.122956e-01            0
      450   431_4737299   BrayCurtisDiss  3.401361e-02 2.122956e-01            0
      451   431_4763548      JaccardDiss -9.677419e-02 2.255381e-01            0
      452   431_4763548 MorisitaHornDiss -9.677419e-02 2.255381e-01            0
      453   431_4763548   BrayCurtisDiss -2.764977e-02 2.255381e-01            0
      454   431_4780289      JaccardDiss -2.027027e-02 6.512571e-01            0
      455   431_4780289 MorisitaHornDiss -4.052584e-02 6.512571e-01            0
      456   431_4780289   BrayCurtisDiss  3.134821e-02 5.784500e-01            0
      457   431_5113490      JaccardDiss -4.891304e-02 1.996209e-02            1
      458   431_5113490 MorisitaHornDiss -7.178244e-02 6.559911e-02            0
      459   431_5113490   BrayCurtisDiss -4.745710e-02 6.309812e-02            0
      460   431_5111311      JaccardDiss -6.024096e-02 4.511787e-01            0
      461   431_5111311 MorisitaHornDiss -1.188315e-01 4.511787e-01            0
      462   431_5111311   BrayCurtisDiss -4.184009e-02 3.743889e-01            0
      463   431_5114950      JaccardDiss  8.333333e-02 3.333333e-01            0
      464   431_5114950 MorisitaHornDiss  1.719318e-02 9.558260e-01            0
      465   431_5114950   BrayCurtisDiss  1.716479e-02 9.250695e-01            0
      466   431_4750417      JaccardDiss -5.000000e-01 3.333333e-01            0
      467   431_4750417 MorisitaHornDiss -5.000000e-01 3.333333e-01            0
      468   431_4750417   BrayCurtisDiss -3.333333e-01 3.333333e-01            0
      469   431_4735842      JaccardDiss  1.829268e-02 2.432902e-01            0
      470   431_4735842 MorisitaHornDiss  3.377111e-02 2.432902e-01            0
      471   431_4735842   BrayCurtisDiss  2.439024e-02 2.432902e-01            0
      472   431_5139691      JaccardDiss -1.326531e-01 2.420754e-01            0
      473   431_5139691 MorisitaHornDiss -1.326531e-01 2.420754e-01            0
      474   431_5139691   BrayCurtisDiss -1.105442e-01 2.420754e-01            0
      475   431_4775942      JaccardDiss  2.815315e-02 4.827163e-01            0
      476   431_4775942 MorisitaHornDiss  2.290603e-03 8.694407e-01            0
      477   431_4775942   BrayCurtisDiss -3.504187e-03 8.869376e-01            0
      478   431_4751863      JaccardDiss -3.759398e-03 8.017715e-01            0
      479   431_4751863 MorisitaHornDiss -3.455693e-02 1.832194e-01            0
      480   431_4751863   BrayCurtisDiss -2.388407e-02 1.559714e-01            0
      481   431_5109126      JaccardDiss -1.282051e-02 7.245413e-01            0
      482   431_5109126 MorisitaHornDiss -2.680414e-02 6.000201e-01            0
      483   431_5109126   BrayCurtisDiss -2.574003e-02 5.376391e-01            0
      484   431_4744587      JaccardDiss  4.331683e-03 8.885099e-01            0
      485   431_4744587 MorisitaHornDiss  1.650165e-02 6.021278e-01            0
      486   431_4744587   BrayCurtisDiss  6.188119e-03 8.522831e-01            0
      487   431_4739476      JaccardDiss -4.489796e-02 4.245912e-01            0
      488   431_4739476 MorisitaHornDiss -5.374378e-02 4.245912e-01            0
      489   431_4739476   BrayCurtisDiss -5.044715e-03 4.245912e-01            0
      490   431_4753322      JaccardDiss -1.416795e-03 8.633014e-01            0
      491   431_4753322 MorisitaHornDiss  1.130055e-02 1.804487e-01            0
      492   431_4753322   BrayCurtisDiss  5.358431e-03 7.647385e-01            0
      493   431_4754067      JaccardDiss -1.173184e-01 9.378311e-02            0
      494   431_4754067 MorisitaHornDiss -1.173184e-01 9.378311e-02            0
      495   431_4754067   BrayCurtisDiss -5.865922e-02 9.378311e-02            0
      496   431_4749675      JaccardDiss  1.790634e-02 2.599978e-01            0
      497   431_4749675 MorisitaHornDiss  2.876920e-04 9.695202e-01            0
      498   431_4749675   BrayCurtisDiss  1.275975e-02 4.850845e-01            0
      499   431_4744570      JaccardDiss -2.592781e-02 2.818823e-01            0
      500   431_4744570 MorisitaHornDiss -2.591678e-02 2.818823e-01            0
      501   431_4744570   BrayCurtisDiss -1.607096e-02 2.818823e-01            0
      502   431_5094559      JaccardDiss -2.000000e-01 2.254033e-01            0
      503   431_5094559 MorisitaHornDiss -5.776398e-02 2.254033e-01            0
      504   431_5094559   BrayCurtisDiss -9.184727e-03 8.781274e-01            0
      505   431_4751864      JaccardDiss -4.830918e-03 8.997586e-01            0
      506   431_4751864 MorisitaHornDiss  7.614260e-03 7.834504e-01            0
      507   431_4751864   BrayCurtisDiss -2.488044e-02 3.880657e-01            0
      508   431_4752592      JaccardDiss -1.885831e-02 3.722702e-01            0
      509   431_4752592 MorisitaHornDiss  1.707199e-02 5.428723e-02            0
      510   431_4752592   BrayCurtisDiss  1.785911e-02 2.124104e-01            0
      511   431_4751135      JaccardDiss  1.564380e-02 5.927123e-01            0
      512   431_4751135 MorisitaHornDiss  2.371961e-02 1.665767e-01            0
      513   431_4751135   BrayCurtisDiss  6.391916e-03 7.149820e-01            0
      514   431_4743110      JaccardDiss -6.329114e-04 9.187304e-01            0
      515   431_4743110 MorisitaHornDiss -8.179163e-03 3.366993e-01            0
      516   431_4743110   BrayCurtisDiss -9.584087e-03 2.047706e-01            0
      517   431_4755503      JaccardDiss  1.759324e-02 1.848276e-04            1
      518   431_4755503 MorisitaHornDiss  3.241454e-02 3.063158e-04            1
      519   431_4755503   BrayCurtisDiss  2.269273e-02 5.065157e-04            1
      520   431_4753319      JaccardDiss  1.960704e-14 1.000000e+00            0
      521   431_4753319 MorisitaHornDiss  1.513751e-14 1.000000e+00            0
      522   431_4753319   BrayCurtisDiss  2.777778e-02 1.699483e-01            0
      523   431_4752591      JaccardDiss  2.521930e-02 3.490742e-01            0
      524   431_4752591 MorisitaHornDiss  7.522657e-02 5.642870e-02            0
      525   431_4752591   BrayCurtisDiss  5.516779e-02 1.672412e-02            1
      526   431_4752590      JaccardDiss  7.231405e-03 8.988265e-01            0
      527   431_4752590 MorisitaHornDiss  7.829491e-03 8.897914e-01            0
      528   431_4752590   BrayCurtisDiss  1.584022e-02 7.407878e-01            0
      529   431_4753317      JaccardDiss -7.142857e-02 8.789623e-01            0
      530   431_4753317 MorisitaHornDiss -7.142857e-02 8.789623e-01            0
      531   431_4753317   BrayCurtisDiss -6.122449e-02 8.789623e-01            0
      532    466_544452      JaccardDiss  2.181455e-03 4.705203e-01            0
      533    466_544452 MorisitaHornDiss -2.924266e-02 1.028374e-01            0
      534    466_544452   BrayCurtisDiss -1.718643e-02 2.044255e-01            0
      535    466_541548      JaccardDiss -4.942806e-05 9.925071e-01            0
      536    466_541548 MorisitaHornDiss  4.724493e-03 5.515323e-01            0
      537    466_541548   BrayCurtisDiss  6.320733e-03 2.834745e-01            0
      538    466_544451      JaccardDiss  4.808308e-03 3.642200e-01            0
      539    466_544451 MorisitaHornDiss  4.602297e-03 4.944781e-01            0
      540    466_544451   BrayCurtisDiss  5.531085e-03 3.484513e-01            0
      541    466_541547      JaccardDiss -1.918908e-03 5.723987e-01            0
      542    466_541547 MorisitaHornDiss  1.018797e-02 3.097263e-01            0
      543    466_541547   BrayCurtisDiss  1.163314e-02 9.688858e-02            0
      544    466_544453      JaccardDiss  2.217612e-03 5.556206e-01            0
      545    466_544453 MorisitaHornDiss -4.184819e-03 6.795351e-01            0
      546    466_544453   BrayCurtisDiss  1.365771e-02 1.922831e-01            0
      547    466_540093      JaccardDiss  3.492897e-03 4.404870e-01            0
      548    466_540093 MorisitaHornDiss  2.110121e-02 3.813188e-02            1
      549    466_540093   BrayCurtisDiss  1.537645e-02 8.110245e-02            0
      550    466_548093      JaccardDiss  5.566496e-03 5.403057e-02            0
      551    466_548093 MorisitaHornDiss  9.367824e-03 2.074968e-01            0
      552    466_548093   BrayCurtisDiss  1.361468e-02 3.190696e-02            1
      553    466_560475      JaccardDiss  3.262346e-03 5.992842e-01            0
      554    466_560475 MorisitaHornDiss  6.332215e-03 2.322302e-01            0
      555    466_560475   BrayCurtisDiss  7.109016e-03 4.898054e-01            0
      556    466_542986      JaccardDiss -1.666144e-03 6.186920e-01            0
      557    466_542986 MorisitaHornDiss  1.777544e-02 3.062838e-01            0
      558    466_542986   BrayCurtisDiss  9.802613e-03 4.179580e-01            0
      559    466_569206      JaccardDiss  6.338206e-03 1.935383e-01            0
      560    466_569206 MorisitaHornDiss  2.377133e-02 9.210496e-02            0
      561    466_569206   BrayCurtisDiss  7.353310e-03 4.548669e-01            0
      562    466_540822      JaccardDiss -7.147194e-03 3.052206e-01            0
      563    466_540822 MorisitaHornDiss -2.365925e-03 8.540286e-01            0
      564    466_540822   BrayCurtisDiss  1.059367e-02 5.701843e-01            0
      565    466_540821      JaccardDiss -9.086712e-03 3.132445e-01            0
      566    466_540821 MorisitaHornDiss  1.533477e-02 7.404464e-01            0
      567    466_540821   BrayCurtisDiss  2.116950e-02 5.628495e-02            0
      568    466_542996      JaccardDiss  7.308527e-03 1.225223e-01            0
      569    466_542996 MorisitaHornDiss  1.248350e-02 1.463851e-01            0
      570    466_542996   BrayCurtisDiss  1.618624e-02 2.698815e-01            0
      571    466_541536      JaccardDiss  2.491035e-03 6.754793e-01            0
      572    466_541536 MorisitaHornDiss  8.046738e-03 3.812456e-01            0
      573    466_541536   BrayCurtisDiss  2.930729e-03 8.310899e-01            0
      574    466_545180      JaccardDiss  5.616501e-03 1.542209e-01            0
      575    466_545180 MorisitaHornDiss  3.466361e-03 5.071734e-01            0
      576    466_545180   BrayCurtisDiss -4.570755e-03 5.965139e-01            0
      577    466_559014      JaccardDiss -6.114440e-03 1.622075e-01            0
      578    466_559014 MorisitaHornDiss  1.128614e-02 2.841852e-01            0
      579    466_559014   BrayCurtisDiss -2.539869e-03 7.732163e-01            0
      580    466_543722      JaccardDiss -3.632479e-02 6.821940e-01            0
      581    466_543722 MorisitaHornDiss -2.997645e-02 1.838469e-01            0
      582    466_543722   BrayCurtisDiss -1.767765e-02 3.196719e-01            0
      583    466_547367      JaccardDiss  3.338002e-03 3.126913e-01            0
      584    466_547367 MorisitaHornDiss  2.150318e-02 3.176488e-02            1
      585    466_547367   BrayCurtisDiss  2.209557e-02 4.620933e-02            1
      586    466_565568      JaccardDiss -3.815971e-04 9.181787e-01            0
      587    466_565568 MorisitaHornDiss  1.620381e-02 3.770812e-01            0
      588    466_565568   BrayCurtisDiss -1.136943e-03 9.163519e-01            0
      589    466_562656      JaccardDiss -2.525585e-02 5.645567e-01            0
      590    466_562656 MorisitaHornDiss  8.872603e-03 9.449901e-01            0
      591    466_562656   BrayCurtisDiss -2.470670e-02 8.597512e-01            0
      592    466_559741      JaccardDiss -1.562245e-02 3.080402e-02            1
      593    466_559741 MorisitaHornDiss -2.534734e-03 9.335168e-01            0
      594    466_559741   BrayCurtisDiss  1.617009e-02 6.272578e-01            0
      595    466_560470      JaccardDiss  8.761798e-04 8.005628e-01            0
      596    466_560470 MorisitaHornDiss  1.074408e-02 4.757465e-01            0
      597    466_560470   BrayCurtisDiss -5.535577e-03 6.548299e-01            0
      598    466_545900      JaccardDiss  5.774811e-03 2.521753e-01            0
      599    466_545900 MorisitaHornDiss -2.754593e-02 2.302971e-02            1
      600    466_545900   BrayCurtisDiss  4.444171e-03 5.028762e-01            0
      601    466_545893      JaccardDiss -1.286032e-03 6.535691e-01            0
      602    466_545893 MorisitaHornDiss  1.769830e-02 8.959884e-02            0
      603    466_545893   BrayCurtisDiss  1.463310e-02 1.190096e-01            0
      604    466_548775      JaccardDiss -3.146853e-04 9.199751e-01            0
      605    466_548775 MorisitaHornDiss  5.837714e-04 9.510051e-01            0
      606    466_548775   BrayCurtisDiss  5.248246e-03 3.886438e-01            0
      607    466_552414      JaccardDiss  5.196382e-03 2.910465e-02            1
      608    466_552414 MorisitaHornDiss -2.841765e-03 3.911341e-01            0
      609    466_552414   BrayCurtisDiss -3.692346e-03 5.406756e-01            0
      610    466_553870      JaccardDiss -2.151694e-02 2.111730e-02            1
      611    466_553870 MorisitaHornDiss -1.850300e-02 5.823165e-01            0
      612    466_553870   BrayCurtisDiss -3.295757e-02 2.578277e-01            0
      613    466_555327      JaccardDiss  4.991688e-03 2.831944e-01            0
      614    466_555327 MorisitaHornDiss  6.716408e-03 6.751319e-01            0
      615    466_555327   BrayCurtisDiss -9.115196e-03 3.560843e-01            0
      616    466_558967      JaccardDiss  5.158377e-03 2.906998e-01            0
      617    466_558967 MorisitaHornDiss -9.856499e-03 1.985427e-01            0
      618    466_558967   BrayCurtisDiss -1.448712e-03 8.787918e-01            0
      619    466_553871      JaccardDiss -4.839089e-03 1.477336e-01            0
      620    466_553871 MorisitaHornDiss -1.981906e-02 4.038335e-03            1
      621    466_553871   BrayCurtisDiss -3.013013e-04 9.683001e-01            0
      622    466_552418      JaccardDiss  5.772440e-03 2.089083e-01            0
      623    466_552418 MorisitaHornDiss  1.773788e-03 4.157236e-01            0
      624    466_552418   BrayCurtisDiss -2.280796e-03 8.042028e-01            0
      625    466_553142      JaccardDiss -2.050786e-03 7.434486e-01            0
      626    466_553142 MorisitaHornDiss  4.355277e-03 3.826754e-01            0
      627    466_553142   BrayCurtisDiss -3.968367e-03 6.101373e-01            0
      628    466_553146      JaccardDiss  7.842190e-03 1.958134e-02            1
      629    466_553146 MorisitaHornDiss  3.225244e-04 9.504126e-01            0
      630    466_553146   BrayCurtisDiss -7.902522e-03 4.211084e-01            0
      631    466_556057      JaccardDiss  2.817695e-04 9.755086e-01            0
      632    466_556057 MorisitaHornDiss  1.099562e-02 5.975639e-01            0
      633    466_556057   BrayCurtisDiss  1.659003e-02 4.629161e-01            0
      634    466_557512      JaccardDiss  2.501878e-03 3.112565e-01            0
      635    466_557512 MorisitaHornDiss -1.018956e-03 7.633363e-01            0
      636    466_557512   BrayCurtisDiss -1.361824e-03 8.734259e-01            0
      637    466_554599      JaccardDiss  2.045639e-04 9.578134e-01            0
      638    466_554599 MorisitaHornDiss -1.024306e-02 1.242256e-01            0
      639    466_554599   BrayCurtisDiss -6.092638e-03 5.385697e-01            0
      640    466_553872      JaccardDiss  6.733826e-03 4.300880e-01            0
      641    466_553872 MorisitaHornDiss -1.920963e-02 1.196131e-01            0
      642    466_553872   BrayCurtisDiss -3.632217e-03 7.111304e-01            0
      643    466_549505      JaccardDiss -4.589679e-04 9.089372e-01            0
      644    466_549505 MorisitaHornDiss  9.191012e-04 9.624126e-01            0
      645    466_549505   BrayCurtisDiss  2.397324e-02 1.857697e-01            0
      646    466_551687      JaccardDiss -9.879219e-04 8.931545e-01            0
      647    466_551687 MorisitaHornDiss  4.089065e-03 8.334659e-01            0
      648    466_551687   BrayCurtisDiss  5.908842e-03 2.795396e-01            0
      649    466_550229      JaccardDiss  4.740399e-03 4.170922e-01            0
      650    466_550229 MorisitaHornDiss -1.046224e-02 4.693441e-01            0
      651    466_550229   BrayCurtisDiss -1.007217e-02 3.205562e-01            0
      652    466_549503      JaccardDiss  7.794353e-04 8.564830e-01            0
      653    466_549503 MorisitaHornDiss  3.286505e-03 7.996197e-01            0
      654    466_549503   BrayCurtisDiss  4.011155e-03 6.427317e-01            0
      655    466_553873      JaccardDiss  3.543041e-03 5.309292e-01            0
      656    466_553873 MorisitaHornDiss  1.166123e-02 4.058408e-01            0
      657    466_553873   BrayCurtisDiss  1.392752e-02 1.301050e-01            0
      658    466_550233      JaccardDiss -8.051593e-03 5.555100e-01            0
      659    466_550233 MorisitaHornDiss -1.017695e-02 2.745656e-01            0
      660    466_550233   BrayCurtisDiss -1.263522e-02 3.541003e-01            0
      661    466_556056      JaccardDiss  4.191409e-03 1.973014e-01            0
      662    466_556056 MorisitaHornDiss -9.839310e-03 3.291882e-01            0
      663    466_556056   BrayCurtisDiss -8.450760e-03 3.014168e-01            0
      664    466_556058      JaccardDiss  6.989608e-03 1.895114e-01            0
      665    466_556058 MorisitaHornDiss  6.501669e-03 1.501460e-01            0
      666    466_556058   BrayCurtisDiss  1.903990e-02 1.029933e-02            1
      667    466_556059      JaccardDiss  5.505845e-03 1.296566e-01            0
      668    466_556059 MorisitaHornDiss -8.091482e-04 9.201678e-01            0
      669    466_556059   BrayCurtisDiss -1.812052e-02 2.683278e-02            1
      670    466_553874      JaccardDiss  8.143085e-03 3.765075e-02            1
      671    466_553874 MorisitaHornDiss  1.128132e-02 1.248329e-01            0
      672    466_553874   BrayCurtisDiss  2.332390e-04 9.798353e-01            0
      673    466_552417      JaccardDiss  7.538214e-03 6.876317e-02            0
      674    466_552417 MorisitaHornDiss -4.184841e-04 9.732250e-01            0
      675    466_552417   BrayCurtisDiss  1.809373e-03 8.363933e-01            0
      676    466_554601      JaccardDiss  3.517876e-03 3.751866e-01            0
      677    466_554601 MorisitaHornDiss -7.503771e-03 2.649787e-01            0
      678    466_554601   BrayCurtisDiss  4.465410e-04 9.698647e-01            0
      679    466_556784      JaccardDiss  3.196803e-02 5.089144e-01            0
      680    466_556784 MorisitaHornDiss  2.271581e-03 9.059482e-01            0
      681    466_556784   BrayCurtisDiss  4.400392e-02 2.281207e-01            0
      682    466_556055      JaccardDiss  9.444121e-04 8.854939e-01            0
      683    466_556055 MorisitaHornDiss  2.208803e-02 5.964024e-02            0
      684    466_556055   BrayCurtisDiss  9.670032e-03 3.113577e-01            0
      685    466_550230      JaccardDiss  7.608125e-03 1.296157e-01            0
      686    466_550230 MorisitaHornDiss  5.821357e-03 7.550114e-01            0
      687    466_550230   BrayCurtisDiss -1.357561e-03 9.061950e-01            0
      688    466_553875      JaccardDiss  3.318250e-03 3.932346e-01            0
      689    466_553875 MorisitaHornDiss -1.761834e-02 1.702713e-01            0
      690    466_553875   BrayCurtisDiss -7.096022e-03 5.799313e-01            0
      691    466_555330      JaccardDiss  2.052134e-04 9.565173e-01            0
      692    466_555330 MorisitaHornDiss  4.522033e-04 9.358310e-01            0
      693    466_555330   BrayCurtisDiss  1.447145e-02 2.521532e-01            0
      694    466_559695      JaccardDiss -5.299836e-04 9.221469e-01            0
      695    466_559695 MorisitaHornDiss -6.946520e-03 1.338812e-01            0
      696    466_559695   BrayCurtisDiss -1.230094e-03 8.879199e-01            0
      697    466_557513      JaccardDiss  8.767036e-04 8.267763e-01            0
      698    466_557513 MorisitaHornDiss -1.815568e-03 4.162608e-01            0
      699    466_557513   BrayCurtisDiss  1.190416e-03 8.798414e-01            0
      700    466_550231      JaccardDiss  1.394254e-03 7.888001e-01            0
      701    466_550231 MorisitaHornDiss -3.693305e-03 4.124231e-01            0
      702    466_550231   BrayCurtisDiss  1.216864e-02 1.659898e-01            0
      703    466_554603      JaccardDiss -6.758422e-03 2.808760e-01            0
      704    466_554603 MorisitaHornDiss -2.091910e-03 4.027415e-01            0
      705    466_554603   BrayCurtisDiss -1.364530e-03 9.367080e-01            0
      706    466_554600      JaccardDiss -1.378457e-02 1.348197e-01            0
      707    466_554600 MorisitaHornDiss -5.764409e-03 5.511187e-01            0
      708    466_554600   BrayCurtisDiss  3.064574e-03 7.416407e-01            0
      709    466_553147      JaccardDiss  7.110727e-03 1.529530e-01            0
      710    466_553147 MorisitaHornDiss  5.338690e-03 1.594204e-01            0
      711    466_553147   BrayCurtisDiss  1.206797e-02 1.547874e-01            0
      712    466_556785      JaccardDiss  9.161660e-04 8.355915e-01            0
      713    466_556785 MorisitaHornDiss  1.214852e-03 9.126836e-01            0
      714    466_556785   BrayCurtisDiss -4.376833e-03 5.612830e-01            0
      715    466_550958      JaccardDiss  8.712207e-03 1.176820e-01            0
      716    466_550958 MorisitaHornDiss -7.859960e-03 5.235485e-01            0
      717    466_550958   BrayCurtisDiss  8.478502e-03 1.642094e-01            0
      718    466_561148      JaccardDiss  8.343963e-03 2.888320e-01            0
      719    466_561148 MorisitaHornDiss  4.260279e-03 6.092055e-01            0
      720    466_561148   BrayCurtisDiss  5.498779e-03 8.712603e-01            0
      721    466_558238      JaccardDiss  6.431943e-03 2.632918e-01            0
      722    466_558238 MorisitaHornDiss  2.085448e-02 2.852851e-01            0
      723    466_558238   BrayCurtisDiss  1.452774e-02 2.792567e-01            0
      724    466_555329      JaccardDiss  1.278317e-02 1.376697e-01            0
      725    466_555329 MorisitaHornDiss  3.006158e-03 6.339815e-01            0
      726    466_555329   BrayCurtisDiss  1.521419e-02 3.882312e-01            0
      727    466_553143      JaccardDiss -6.669585e-04 9.029285e-01            0
      728    466_553143 MorisitaHornDiss -1.858945e-03 6.200118e-01            0
      729    466_553143   BrayCurtisDiss  2.234746e-03 7.391180e-01            0
      730    466_556054      JaccardDiss  3.590039e-03 6.607557e-01            0
      731    466_556054 MorisitaHornDiss  1.384183e-02 5.155577e-01            0
      732    466_556054   BrayCurtisDiss  5.680998e-03 7.580512e-01            0
      733    466_548776      JaccardDiss  9.157509e-03 2.485210e-01            0
      734    466_548776 MorisitaHornDiss  5.178200e-02 9.150969e-04            1
      735    466_548776   BrayCurtisDiss  1.192940e-02 2.524631e-01            0
      736    466_550232      JaccardDiss -3.435724e-03 5.323376e-01            0
      737    466_550232 MorisitaHornDiss  1.777076e-03 8.919089e-01            0
      738    466_550232   BrayCurtisDiss  2.839962e-03 8.002203e-01            0
      739    466_558968      JaccardDiss  6.860373e-03 3.928072e-01            0
      740    466_558968 MorisitaHornDiss  2.235289e-04 9.923116e-01            0
      741    466_558968   BrayCurtisDiss -9.176009e-04 9.375278e-01            0
      742    466_559696      JaccardDiss -2.585281e-03 5.674846e-01            0
      743    466_559696 MorisitaHornDiss -1.345982e-03 9.147262e-01            0
      744    466_559696   BrayCurtisDiss -1.590025e-02 6.185370e-02            0
      745    466_551690      JaccardDiss  5.415690e-03 3.764074e-01            0
      746    466_551690 MorisitaHornDiss  9.375239e-04 9.342006e-01            0
      747    466_551690   BrayCurtisDiss  9.760425e-03 3.337548e-01            0
      748    466_553145      JaccardDiss -1.951443e-03 6.941973e-01            0
      749    466_553145 MorisitaHornDiss  1.625672e-02 1.683287e-01            0
      750    466_553145   BrayCurtisDiss  9.276566e-03 3.804000e-01            0
      751    466_558966      JaccardDiss  6.174105e-03 3.943069e-01            0
      752    466_558966 MorisitaHornDiss  4.633222e-04 9.702944e-01            0
      753    466_558966   BrayCurtisDiss -1.644795e-03 8.790710e-01            0
      754    466_550962      JaccardDiss -2.295512e-02 3.307869e-01            0
      755    466_550962 MorisitaHornDiss -1.599981e-02 7.760562e-01            0
      756    466_550962   BrayCurtisDiss -3.077323e-02 3.787004e-01            0
      757    466_556053      JaccardDiss  6.642498e-03 5.456132e-01            0
      758    466_556053 MorisitaHornDiss  1.127743e-02 3.885892e-01            0
      759    466_556053   BrayCurtisDiss  1.505001e-02 4.848261e-01            0
      760    466_560424      JaccardDiss -2.204136e-03 8.478002e-01            0
      761    466_560424 MorisitaHornDiss -2.312653e-02 1.963939e-01            0
      762    466_560424   BrayCurtisDiss -5.924146e-03 7.470369e-01            0
      763    466_549502      JaccardDiss -2.327339e-03 6.367582e-01            0
      764    466_549502 MorisitaHornDiss  1.247347e-03 9.419993e-01            0
      765    466_549502   BrayCurtisDiss -3.163443e-03 7.749842e-01            0
      766    466_550234      JaccardDiss -9.034893e-06 9.987791e-01            0
      767    466_550234 MorisitaHornDiss -2.546814e-02 2.236600e-01            0
      768    466_550234   BrayCurtisDiss -2.449557e-02 2.185082e-01            0
      769    466_542276      JaccardDiss -1.438899e-02 7.183679e-02            0
      770    466_542276 MorisitaHornDiss  7.273145e-03 6.107417e-01            0
      771    466_542276   BrayCurtisDiss  1.072674e-02 5.733037e-01            0
      772    466_565560      JaccardDiss  6.297398e-03 4.940771e-02            1
      773    466_565560 MorisitaHornDiss -1.903651e-02 2.398534e-01            0
      774    466_565560   BrayCurtisDiss -1.478078e-02 1.812381e-01            0
      775    466_553903      JaccardDiss -8.406543e-03 3.772315e-01            0
      776    466_553903 MorisitaHornDiss  2.676387e-02 1.824318e-01            0
      777    466_553903   BrayCurtisDiss  3.995098e-03 8.155181e-01            0
      778    466_562645      JaccardDiss  1.295038e-06 9.997252e-01            0
      779    466_562645 MorisitaHornDiss  1.548090e-03 8.999444e-01            0
      780    466_562645   BrayCurtisDiss  1.949124e-03 7.972765e-01            0
      781    466_556817      JaccardDiss -7.014685e-02 7.590495e-02            0
      782    466_556817 MorisitaHornDiss  5.164715e-02 7.284511e-01            0
      783    466_556817   BrayCurtisDiss  2.040163e-02 8.372337e-01            0
      784    466_571385      JaccardDiss  7.049411e-03 5.139653e-01            0
      785    466_571385 MorisitaHornDiss -2.644278e-02 4.355418e-01            0
      786    466_571385   BrayCurtisDiss -2.457077e-02 1.793533e-01            0
      787    466_565564      JaccardDiss -4.987458e-03 2.731958e-01            0
      788    466_565564 MorisitaHornDiss -2.921194e-02 6.640853e-02            0
      789    466_565564   BrayCurtisDiss -1.147446e-02 3.598380e-01            0
      790    466_565565      JaccardDiss  2.423301e-02 2.577534e-02            1
      791    466_565565 MorisitaHornDiss  3.991889e-02 3.696797e-01            0
      792    466_565565   BrayCurtisDiss -2.879694e-03 8.699091e-01            0
      793    466_541532      JaccardDiss -1.257115e-02 3.000164e-01            0
      794    466_541532 MorisitaHornDiss  4.978552e-02 1.418300e-01            0
      795    466_541532   BrayCurtisDiss  2.486101e-03 8.865356e-01            0
      796    466_546629      JaccardDiss -8.764503e-03 7.672251e-01            0
      797    466_546629 MorisitaHornDiss  4.149174e-02 8.129701e-01            0
      798    466_546629   BrayCurtisDiss  2.010270e-02 8.669855e-01            0
      799    466_566288      JaccardDiss  4.853078e-03 3.866018e-01            0
      800    466_566288 MorisitaHornDiss  5.332898e-03 8.329918e-01            0
      801    466_566288   BrayCurtisDiss  1.949147e-03 9.047307e-01            0
      802    466_542993      JaccardDiss -3.562373e-02 2.125943e-01            0
      803    466_542993 MorisitaHornDiss -1.128847e-02 8.943202e-01            0
      804    466_542993   BrayCurtisDiss  3.080334e-02 3.661904e-01            0
      805    466_542258      JaccardDiss  2.908177e-05 9.942122e-01            0
      806    466_542258 MorisitaHornDiss -4.714018e-03 8.499292e-01            0
      807    466_542258   BrayCurtisDiss  8.237754e-03 5.591158e-01            0
      808    466_564839      JaccardDiss  1.356043e-02 2.979658e-01            0
      809    466_564839 MorisitaHornDiss -1.580292e-02 8.040613e-01            0
      810    466_564839   BrayCurtisDiss -2.001872e-03 9.560715e-01            0
      811    466_558274      JaccardDiss -3.488915e-04 8.972844e-01            0
      812    466_558274 MorisitaHornDiss  4.022079e-03 7.294125e-01            0
      813    466_558274   BrayCurtisDiss -1.213371e-03 4.772500e-01            0
      814    466_541535      JaccardDiss  2.283507e-03 6.552727e-01            0
      815    466_541535 MorisitaHornDiss  1.147045e-02 4.301423e-01            0
      816    466_541535   BrayCurtisDiss  1.061172e-02 2.218690e-01            0
      817    466_568472      JaccardDiss  5.741980e-03 2.547029e-01            0
      818    466_568472 MorisitaHornDiss -7.163903e-03 4.529894e-01            0
      819    466_568472   BrayCurtisDiss -1.531253e-03 7.872583e-01            0
      820    466_561929      JaccardDiss  6.798114e-03 6.972189e-01            0
      821    466_561929 MorisitaHornDiss -2.967797e-02 6.328417e-01            0
      822    466_561929   BrayCurtisDiss -2.713978e-02 5.700118e-01            0
      823    466_568473      JaccardDiss -3.818182e-03 6.226307e-01            0
      824    466_568473 MorisitaHornDiss -3.585546e-02 3.335644e-01            0
      825    466_568473   BrayCurtisDiss -1.465479e-02 2.510755e-01            0
      826    466_553907      JaccardDiss  2.715259e-03 3.787182e-01            0
      827    466_553907 MorisitaHornDiss -6.624911e-05 9.916604e-01            0
      828    466_553907   BrayCurtisDiss -3.452460e-03 6.420875e-01            0
      829    466_564114      JaccardDiss -5.049218e-03 7.181579e-01            0
      830    466_564114 MorisitaHornDiss -1.331742e-02 7.675531e-01            0
      831    466_564114   BrayCurtisDiss  1.324963e-02 5.396166e-01            0
      832    466_564831      JaccardDiss -8.373206e-03 8.424904e-01            0
      833    466_564831 MorisitaHornDiss -3.023311e-02 7.296023e-01            0
      834    466_564831   BrayCurtisDiss -2.580806e-02 7.168354e-01            0
      835    466_545908      JaccardDiss  2.498283e-03 4.773855e-01            0
      836    466_545908 MorisitaHornDiss -1.721705e-03 8.979641e-01            0
      837    466_545908   BrayCurtisDiss -4.832561e-03 6.492930e-01            0
      838    466_550992      JaccardDiss  2.539930e-03 6.393671e-01            0
      839    466_550992 MorisitaHornDiss -7.720058e-04 9.277046e-01            0
      840    466_550992   BrayCurtisDiss -2.682994e-03 7.138200e-01            0
      841    466_569932      JaccardDiss  4.086957e-02 5.824243e-01            0
      842    466_569932 MorisitaHornDiss -2.588588e-02 9.595396e-01            0
      843    466_569932   BrayCurtisDiss -1.511925e-02 9.703158e-01            0
      844    466_556102      JaccardDiss -1.656315e-02 4.830491e-01            0
      845    466_556102 MorisitaHornDiss  3.667825e-02 5.686437e-01            0
      846    466_556102   BrayCurtisDiss  3.496328e-02 5.556066e-01            0
      847    466_558277      JaccardDiss  9.815704e-04 8.512678e-01            0
      848    466_558277 MorisitaHornDiss  1.127579e-03 7.641764e-01            0
      849    466_558277   BrayCurtisDiss  2.239759e-03 6.333524e-01            0
      850    466_557546      JaccardDiss  1.479661e-03 9.015562e-01            0
      851    466_557546 MorisitaHornDiss  2.874984e-02 1.830693e-02            1
      852    466_557546   BrayCurtisDiss  1.993242e-02 1.029958e-01            0
      853    466_547347      JaccardDiss  2.111757e-03 7.213481e-01            0
      854    466_547347 MorisitaHornDiss  3.868340e-02 1.542030e-01            0
      855    466_547347   BrayCurtisDiss  2.481293e-02 1.952753e-01            0
      856    466_548076      JaccardDiss -1.350997e-03 7.629589e-01            0
      857    466_548076 MorisitaHornDiss -4.398099e-03 8.327726e-01            0
      858    466_548076   BrayCurtisDiss  2.626921e-03 8.525547e-01            0
      859    466_544438      JaccardDiss -3.625215e-03 4.413750e-01            0
      860    466_544438 MorisitaHornDiss  2.225333e-02 3.426695e-02            1
      861    466_544438   BrayCurtisDiss -5.065063e-03 6.693325e-01            0
      862    466_554645      JaccardDiss  3.590344e-03 3.095039e-01            0
      863    466_554645 MorisitaHornDiss  4.861742e-03 4.828121e-01            0
      864    466_554645   BrayCurtisDiss -3.071948e-03 5.804448e-01            0
      865    466_565559      JaccardDiss -4.516758e-05 9.931947e-01            0
      866    466_565559 MorisitaHornDiss  5.971692e-03 7.761566e-01            0
      867    466_565559   BrayCurtisDiss  6.204392e-03 6.804624e-01            0
      868    466_561921      JaccardDiss -8.137000e-04 7.746145e-01            0
      869    466_561921 MorisitaHornDiss -1.993046e-02 1.411298e-02            1
      870    466_561921   BrayCurtisDiss -1.314992e-02 4.306310e-02            1
      871    466_548075      JaccardDiss -8.532812e-04 7.278281e-01            0
      872    466_548075 MorisitaHornDiss  1.589980e-02 1.992488e-01            0
      873    466_548075   BrayCurtisDiss  4.628494e-03 5.725072e-01            0
      874    466_564102      JaccardDiss  4.327937e-04 9.908319e-01            0
      875    466_564102 MorisitaHornDiss -5.425329e-02 3.059628e-01            0
      876    466_564102   BrayCurtisDiss -7.417269e-03 2.820607e-01            0
      877    466_544454      JaccardDiss  3.163689e-03 6.292679e-01            0
      878    466_544454 MorisitaHornDiss  2.137532e-02 2.097095e-01            0
      879    466_544454   BrayCurtisDiss  3.177439e-02 7.163420e-02            0
      880    466_557549      JaccardDiss  9.330232e-03 1.587793e-01            0
      881    466_557549 MorisitaHornDiss -1.436087e-02 4.020065e-01            0
      882    466_557549   BrayCurtisDiss -1.597297e-02 4.789426e-01            0
      883    466_543710      JaccardDiss  7.189794e-03 2.320166e-01            0
      884    466_543710 MorisitaHornDiss  7.005575e-03 3.727955e-01            0
      885    466_543710   BrayCurtisDiss  3.602279e-03 5.189215e-01            0
      886    466_553178      JaccardDiss  3.001146e-03 2.610320e-01            0
      887    466_553178 MorisitaHornDiss  1.713427e-02 5.756453e-01            0
      888    466_553178   BrayCurtisDiss  1.590489e-02 3.474079e-01            0
      889    466_551721      JaccardDiss  1.602412e-02 3.156523e-05            1
      890    466_551721 MorisitaHornDiss  1.318070e-02 4.499931e-01            0
      891    466_551721   BrayCurtisDiss  1.198336e-02 4.092870e-01            0
      892    466_550989      JaccardDiss  1.057744e-03 6.762909e-01            0
      893    466_550989 MorisitaHornDiss -1.183905e-02 5.935471e-01            0
      894    466_550989   BrayCurtisDiss -6.618058e-03 6.364019e-01            0
      895    466_559007      JaccardDiss  1.318869e-02 4.998320e-02            1
      896    466_559007 MorisitaHornDiss -8.673699e-03 6.639254e-01            0
      897    466_559007   BrayCurtisDiss  7.895299e-04 9.313066e-01            0
      898    466_557560      JaccardDiss -1.276812e-02 7.072029e-01            0
      899    466_557560 MorisitaHornDiss  1.477756e-01 2.007064e-01            0
      900    466_557560   BrayCurtisDiss  1.538916e-01 1.302335e-01            0
      901    466_559735      JaccardDiss  6.802721e-04 9.862262e-01            0
      902    466_559735 MorisitaHornDiss -2.712453e-03 9.807617e-01            0
      903    466_559735   BrayCurtisDiss  4.278733e-02 3.076173e-01            0
      904    466_554635      JaccardDiss -1.992771e-03 8.308196e-01            0
      905    466_554635 MorisitaHornDiss  1.817421e-02 4.237068e-01            0
      906    466_554635   BrayCurtisDiss  1.901468e-02 4.958065e-01            0
      907    466_547348      JaccardDiss  2.171760e-03 7.500817e-01            0
      908    466_547348 MorisitaHornDiss -1.293819e-02 6.333367e-01            0
      909    466_547348   BrayCurtisDiss -1.296756e-02 4.622423e-02            1
      910    466_550260      JaccardDiss  8.686718e-04 8.963276e-01            0
      911    466_550260 MorisitaHornDiss  3.876020e-02 8.796589e-02            0
      912    466_550260   BrayCurtisDiss  3.339690e-02 5.121277e-02            0
      913    466_561192      JaccardDiss  2.931352e-04 9.683067e-01            0
      914    466_561192 MorisitaHornDiss -9.150244e-03 4.544918e-01            0
      915    466_561192   BrayCurtisDiss -1.088462e-02 2.172922e-01            0
      916    466_557559      JaccardDiss -9.784353e-03 3.554730e-01            0
      917    466_557559 MorisitaHornDiss -4.944007e-03 8.169086e-01            0
      918    466_557559   BrayCurtisDiss  2.488356e-03 8.499514e-01            0
      919    466_559013      JaccardDiss  5.968463e-03 4.803697e-01            0
      920    466_559013 MorisitaHornDiss  3.452341e-03 8.306270e-01            0
      921    466_559013   BrayCurtisDiss  1.878804e-02 1.236810e-01            0
      922    466_546637      JaccardDiss  2.698413e-02 6.964465e-01            0
      923    466_546637 MorisitaHornDiss -7.740778e-02 5.077829e-01            0
      924    466_546637   BrayCurtisDiss -8.936618e-02 3.279150e-01            0
      925    466_565569      JaccardDiss  6.432412e-03 5.026022e-01            0
      926    466_565569 MorisitaHornDiss -5.614719e-02 5.350272e-01            0
      927    466_565569   BrayCurtisDiss -2.924079e-02 5.617156e-01            0
      928    466_555373      JaccardDiss -1.683420e-03 8.052496e-01            0
      929    466_555373 MorisitaHornDiss -3.868789e-03 8.762857e-01            0
      930    466_555373   BrayCurtisDiss -1.658038e-02 2.076365e-01            0
      931    466_559006      JaccardDiss  5.556527e-03 5.193743e-01            0
      932    466_559006 MorisitaHornDiss -4.618376e-02 7.878610e-02            0
      933    466_559006   BrayCurtisDiss -3.097889e-02 1.113758e-02            1
      934    466_542997      JaccardDiss  3.854910e-04 9.874169e-01            0
      935    466_542997 MorisitaHornDiss  9.138167e-03 6.774666e-01            0
      936    466_542997   BrayCurtisDiss -9.225698e-03 7.596357e-01            0
      937    466_549551      JaccardDiss  4.040248e-03 3.425069e-01            0
      938    466_549551 MorisitaHornDiss  9.728633e-03 2.882077e-01            0
      939    466_549551   BrayCurtisDiss -3.214772e-03 6.767344e-01            0
      940    466_547364      JaccardDiss -4.677615e-04 9.441309e-01            0
      941    466_547364 MorisitaHornDiss  1.436329e-02 6.470372e-01            0
      942    466_547364   BrayCurtisDiss  1.542822e-02 4.466456e-01            0
      943    466_550991      JaccardDiss -2.019163e-03 9.438586e-01            0
      944    466_550991 MorisitaHornDiss -2.733600e-02 6.902560e-01            0
      945    466_550991   BrayCurtisDiss -4.188695e-02 1.680745e-01            0
      946    466_543709      JaccardDiss -8.428047e-17 1.000000e+00            0
      947    466_543709 MorisitaHornDiss  8.470660e-02 5.156098e-01            0
      948    466_543709   BrayCurtisDiss  3.013440e-02 6.608294e-01            0
      949    466_558285      JaccardDiss  1.502166e-03 6.133103e-01            0
      950    466_558285 MorisitaHornDiss  1.509121e-02 2.144563e-01            0
      951    466_558285   BrayCurtisDiss -5.537518e-03 3.911635e-01            0
      952    466_559742      JaccardDiss -3.024845e-02 2.643564e-01            0
      953    466_559742 MorisitaHornDiss  1.058186e-01 5.173134e-02            0
      954    466_559742   BrayCurtisDiss  5.665359e-02 3.177334e-01            0
      955    466_541538      JaccardDiss -7.894737e-03 1.615715e-01            0
      956    466_541538 MorisitaHornDiss  8.900149e-03 1.411362e-01            0
      957    466_541538   BrayCurtisDiss -7.372180e-02 3.480908e-01            0
      958    466_548092      JaccardDiss  4.895659e-03 6.259579e-01            0
      959    466_548092 MorisitaHornDiss  7.366200e-03 6.036761e-01            0
      960    466_548092   BrayCurtisDiss -1.152791e-02 1.880276e-01            0
      961    466_546636      JaccardDiss  9.126984e-02 2.648419e-01            0
      962    466_546636 MorisitaHornDiss -2.025256e-01 1.464786e-01            0
      963    466_546636   BrayCurtisDiss  8.509944e-02 4.602529e-01            0
      964    466_554647      JaccardDiss  1.890206e-02 2.320065e-01            0
      965    466_554647 MorisitaHornDiss -2.688611e-03 9.470913e-01            0
      966    466_554647   BrayCurtisDiss -1.612770e-03 9.576068e-01            0
      967    466_555328      JaccardDiss -2.818646e-03 7.127145e-01            0
      968    466_555328 MorisitaHornDiss  7.969224e-03 3.562713e-01            0
      969    466_555328   BrayCurtisDiss  5.812112e-03 5.989568e-01            0
      970    466_554598      JaccardDiss  1.041667e-02 8.695385e-01            0
      971    466_554598 MorisitaHornDiss -4.522714e-02 2.071968e-01            0
      972    466_554598   BrayCurtisDiss -1.649966e-02 6.565059e-01            0
      973    466_551691      JaccardDiss -3.947202e-03 7.563146e-01            0
      974    466_551691 MorisitaHornDiss  5.159309e-04 6.277619e-01            0
      975    466_551691   BrayCurtisDiss -3.315786e-02 3.703338e-01            0
      976    466_551689      JaccardDiss -1.129450e-02 8.455953e-02            0
      977    466_551689 MorisitaHornDiss  1.758418e-03 1.240672e-01            0
      978    466_551689   BrayCurtisDiss  2.010090e-02 6.334920e-02            0
      979    466_558239      JaccardDiss -2.166650e-03 8.822352e-01            0
      980    466_558239 MorisitaHornDiss -1.092335e-04 8.168084e-01            0
      981    466_558239   BrayCurtisDiss -1.431536e-03 9.007981e-01            0
      982    466_552415      JaccardDiss  1.104283e-02 2.225076e-01            0
      983    466_552415 MorisitaHornDiss -9.007643e-03 5.897916e-01            0
      984    466_552415   BrayCurtisDiss  8.338384e-03 5.859919e-01            0
      985    466_557511      JaccardDiss  1.057999e-03 8.250307e-01            0
      986    466_557511 MorisitaHornDiss -5.567672e-03 7.407776e-01            0
      987    466_557511   BrayCurtisDiss -7.174921e-03 4.751933e-01            0
      988    466_553144      JaccardDiss  3.732822e-03 4.714964e-01            0
      989    466_553144 MorisitaHornDiss  2.301636e-02 1.243303e-01            0
      990    466_553144   BrayCurtisDiss  1.158134e-02 2.775486e-01            0
      991    466_564837      JaccardDiss  2.419896e-02 9.681676e-03            1
      992    466_564837 MorisitaHornDiss  5.045750e-03 8.483759e-01            0
      993    466_564837   BrayCurtisDiss  2.107561e-02 2.243032e-01            0
      994    466_556782      JaccardDiss  1.324078e-03 8.198886e-01            0
      995    466_556782 MorisitaHornDiss  2.283108e-02 2.219512e-01            0
      996    466_556782   BrayCurtisDiss  1.701608e-04 9.895470e-01            0
      997    466_557509      JaccardDiss  5.063966e-03 6.234915e-01            0
      998    466_557509 MorisitaHornDiss -1.924580e-02 6.946504e-01            0
      999    466_557509   BrayCurtisDiss  3.156164e-03 9.253679e-01            0
      1000   466_550961      JaccardDiss -1.418911e-03 9.244364e-01            0
      1001   466_550961 MorisitaHornDiss -3.289577e-03 8.278546e-01            0
      1002   466_550961   BrayCurtisDiss -1.608775e-03 9.466808e-01            0
      1003   466_558241      JaccardDiss -1.552366e-02 3.698052e-01            0
      1004   466_558241 MorisitaHornDiss -4.393220e-03 9.143572e-01            0
      1005   466_558241   BrayCurtisDiss  2.696486e-02 3.875211e-01            0
      1006   466_559694      JaccardDiss  1.111111e-01 3.333333e-01            0
      1007   466_559694 MorisitaHornDiss  1.795053e-01 3.402753e-01            0
      1008   466_559694   BrayCurtisDiss  8.115448e-02 6.725096e-01            0
      1009   466_562606      JaccardDiss  2.000000e-02 6.847438e-01            0
      1010   466_562606 MorisitaHornDiss  2.470599e-04 1.615843e-01            0
      1011   466_562606   BrayCurtisDiss -7.089079e-02 3.841353e-01            0
      1012   211_528514      JaccardDiss  6.120307e-03 7.348788e-01            0
      1013   211_528514 MorisitaHornDiss  1.537886e-02 7.172269e-01            0
      1014   211_528514   BrayCurtisDiss  8.847987e-03 7.695251e-01            0
      1015   211_524878      JaccardDiss -1.936575e-02 2.775716e-01            0
      1016   211_524878 MorisitaHornDiss -3.508865e-02 5.380643e-01            0
      1017   211_524878   BrayCurtisDiss -7.389946e-03 8.200212e-01            0
      1018   211_521245      JaccardDiss  1.673756e-02 2.264126e-01            0
      1019   211_521245 MorisitaHornDiss  6.797044e-02 1.154227e-01            0
      1020   211_521245   BrayCurtisDiss  5.588878e-02 5.628986e-02            0
      1021   211_522693      JaccardDiss  2.678272e-03 8.658503e-01            0
      1022   211_522693 MorisitaHornDiss -4.485264e-02 4.364984e-02            1
      1023   211_522693   BrayCurtisDiss -9.790472e-03 5.085933e-01            0
      1024   211_516876      JaccardDiss  8.888889e-03 8.815062e-01            0
      1025   211_516876 MorisitaHornDiss -2.453397e-02 8.625666e-01            0
      1026   211_516876   BrayCurtisDiss -1.977515e-02 8.297734e-01            0
      1027   211_516147      JaccardDiss -4.124650e-02 1.857185e-02            1
      1028   211_516147 MorisitaHornDiss -3.759856e-02 6.177226e-01            0
      1029   211_516147   BrayCurtisDiss -1.665243e-02 8.845325e-01            0
      1030  437_2074469      JaccardDiss  1.109139e-02 7.481094e-01            0
      1031  437_2074469 MorisitaHornDiss  3.186167e-02 4.781420e-01            0
      1032  437_2074469   BrayCurtisDiss  2.186074e-02 4.764461e-01            0
      1033  437_2076657      JaccardDiss -5.698996e-02 1.641498e-02            1
      1034  437_2076657 MorisitaHornDiss -1.063864e-01 7.449769e-02            0
      1035  437_2076657   BrayCurtisDiss -6.005424e-02 5.218560e-02            0
      1036  437_2075929      JaccardDiss -4.041396e-02 2.638507e-02            1
      1037  437_2075929 MorisitaHornDiss -2.038973e-02 3.215823e-01            0
      1038  437_2075929   BrayCurtisDiss -4.175002e-02 1.542990e-01            0
      1039  437_2078113      JaccardDiss -3.790106e-02 2.638270e-01            0
      1040  437_2078113 MorisitaHornDiss -3.659966e-02 4.422238e-01            0
      1041  437_2078113   BrayCurtisDiss -4.192997e-02 4.138335e-02            1
      1042  437_2075928      JaccardDiss  1.506136e-02 1.793857e-01            0
      1043  437_2075928 MorisitaHornDiss  3.914285e-02 3.214003e-01            0
      1044  437_2075928   BrayCurtisDiss  2.712042e-02 1.016688e-01            0
      1045  437_2075200      JaccardDiss  1.185796e-02 6.501379e-01            0
      1046  437_2075200 MorisitaHornDiss  3.628347e-02 7.405010e-01            0
      1047  437_2075200   BrayCurtisDiss  5.387503e-03 9.294199e-01            0
      1048  437_2073742      JaccardDiss  1.391352e-02 5.952543e-01            0
      1049  437_2073742 MorisitaHornDiss  1.591072e-02 6.069530e-01            0
      1050  437_2073742   BrayCurtisDiss  1.689664e-02 5.029739e-01            0
      1051  437_2073741      JaccardDiss  3.065634e-02 7.902396e-02            0
      1052  437_2073741 MorisitaHornDiss -1.487758e-03 9.702324e-01            0
      1053  437_2073741   BrayCurtisDiss  3.607616e-02 4.608442e-01            0
               intercept
      1    -1.804978e+01
      2    -1.999238e+00
      3     9.959397e+00
      4    -1.970673e+00
      5    -2.884900e+00
      6    -3.822126e-01
      7    -1.407459e+01
      8    -2.231911e+01
      9    -1.514317e+01
      10    5.387659e+01
      11    3.471294e+01
      12    1.144514e+01
      13    3.920699e+00
      14    4.752706e+00
      15    8.952811e+00
      16    5.883433e+00
      17    4.784630e+00
      18    5.522305e+00
      19    3.240007e+01
      20   -2.616075e+02
      21   -1.068517e+02
      22    2.560398e+01
      23    1.801954e+01
      24    2.891926e+01
      25   -5.305179e+01
      26   -4.024566e+01
      27   -3.355048e+01
      28    6.486994e+01
      29   -1.434996e+02
      30   -7.510583e+01
      31   -1.570243e+01
      32    7.966587e+00
      33    9.772839e+01
      34   -7.719677e+01
      35   -2.334456e+01
      36   -5.355937e+01
      37   -3.480695e+00
      38   -2.641117e+02
      39   -1.919947e+01
      40   -1.371173e+02
      41   -6.738831e+01
      42   -1.705284e+02
      43    8.110969e+01
      44    5.439880e+01
      45    5.070219e+01
      46   -6.272548e+00
      47   -6.442602e+01
      48    6.313164e+00
      49   -6.876055e+01
      50   -7.096649e+01
      51   -4.576977e+01
      52   -4.848805e+01
      53   -4.269022e+01
      54   -5.392028e+01
      55   -1.399176e+01
      56    4.608524e+01
      57   -3.135621e+01
      58    1.165526e+02
      59    1.346312e+02
      60    8.668817e+01
      61    4.421498e+01
      62    3.356476e+01
      63   -1.983712e+01
      64    4.529700e+01
      65    2.998135e+01
      66    1.614217e+00
      67   -2.294222e+01
      68    1.624956e+01
      69   -6.313400e-02
      70   -7.613724e+01
      71   -5.139488e+01
      72   -8.989975e+01
      73    8.494312e+01
      74   -2.842951e+01
      75   -5.114430e+01
      76    5.075741e+01
      77   -6.368919e+01
      78   -4.856094e+01
      79   -5.698399e+02
      80   -8.817498e+02
      81   -6.489307e+02
      82    1.117995e+02
      83    6.794993e+01
      84    1.034956e+02
      85   -3.908339e+01
      86   -1.835294e+01
      87    1.056776e+01
      88   -6.416076e+01
      89   -1.449302e+02
      90   -7.154395e+01
      91   -1.300868e+02
      92   -1.835367e+02
      93   -1.574742e+02
      94    1.438244e+02
      95    2.277803e+02
      96    1.796184e+02
      97   -1.347300e+02
      98   -1.131658e+02
      99   -1.812827e+02
      100   6.039000e+02
      101   6.039000e+02
      102   3.455143e+02
      103  -2.027979e+02
      104   1.162771e+01
      105  -1.611396e+02
      106   1.550500e+00
      107  -1.308928e+02
      108  -1.185636e+02
      109   5.426184e+01
      110   9.808603e+01
      111   4.886042e+01
      112   4.330899e+01
      113  -1.136934e+02
      114  -5.898360e+01
      115  -9.466263e+01
      116   1.082645e+02
      117   1.625762e+01
      118   1.516688e+02
      119  -2.994020e+01
      120   1.798374e+02
      121  -4.003162e+01
      122   4.987970e+01
      123  -5.259762e+01
      124   2.171078e+01
      125  -7.905544e+01
      126  -1.925572e+01
      127   5.832179e+00
      128  -1.497791e+01
      129  -2.410039e+01
      130  -2.603017e+01
      131  -1.047205e+02
      132  -5.419237e+01
      133  -1.008746e+01
      134   6.873059e+01
      135   1.116138e+01
      136  -4.908679e+01
      137   9.589316e+01
      138   6.338047e+01
      139  -8.776748e+00
      140  -1.341886e+02
      141  -9.715742e+01
      142  -2.817996e+01
      143  -4.900061e+01
      144  -5.019477e+01
      145   2.239432e+02
      146   2.335358e+02
      147   2.604647e+02
      148  -7.713390e+01
      149  -2.671465e+01
      150   7.664907e+00
      151  -1.962585e+01
      152  -3.447123e+02
      153  -1.166229e+02
      154  -7.629003e+01
      155   3.886073e-01
      156  -2.581231e+01
      157   9.140127e+01
      158   1.488317e+02
      159   1.120814e+02
      160   1.552402e+02
      161   2.811986e+01
      162   2.860671e+02
      163   5.602377e+01
      164  -5.107228e+01
      165  -1.103936e+02
      166  -5.995870e+00
      167  -2.948021e+01
      168  -2.040743e+01
      169  -5.376614e+01
      170  -3.915005e+01
      171  -5.806915e+01
      172   1.967196e+02
      173  -4.190912e+01
      174   2.367490e+01
      175   9.733365e+01
      176   4.894269e+01
      177   6.374685e+01
      178  -6.866112e+01
      179  -5.584071e+01
      180  -3.577139e+01
      181  -9.548228e+01
      182  -4.362942e+02
      183  -2.649031e+02
      184   1.538514e+01
      185   9.165185e+00
      186  -2.119527e+01
      187   9.707469e+01
      188  -3.245404e+01
      189  -2.237147e+02
      190  -6.134537e+02
      191  -2.316868e+02
      192  -4.277092e+02
      193   2.304295e+01
      194  -2.181336e+02
      195  -1.320682e+02
      196  -5.313935e+01
      197  -9.318202e+01
      198  -1.043233e+02
      199  -1.649753e+02
      200  -3.010934e+01
      201  -9.639619e+01
      202  -2.977042e+01
      203  -2.926238e+01
      204  -3.393120e+01
      205   2.448636e+01
      206   6.214841e+01
      207   3.356165e+01
      208   3.833944e+01
      209   6.954580e+01
      210  -8.354470e+00
      211   2.289120e+01
      212  -1.494363e+01
      213  -2.243308e+01
      214  -3.374582e+02
      215  -2.729895e+02
      216  -2.822873e+02
      217   8.452745e+01
      218  -1.536766e+02
      219  -7.889943e+01
      220  -1.599015e+02
      221  -1.867579e+02
      222  -9.042955e+01
      223  -2.884891e+01
      224  -1.101507e+02
      225  -4.713751e+01
      226  -3.573214e+01
      227   5.374087e+01
      228  -4.233648e+01
      229   1.442857e+02
      230   1.442857e+02
      231   9.652381e+01
      232  -5.021667e+02
      233   3.453276e+01
      234   3.888889e-01
      235  -1.338667e+02
      236  -8.943332e+01
      237  -9.681032e+01
      238   5.028333e+02
      239   1.328490e+00
      240  -1.157467e+02
      241  -4.337640e+01
      242  -6.455723e+01
      243  -3.376666e+01
      244  -6.194163e+00
      245  -1.338575e+02
      246  -6.890433e+01
      247  -7.505786e+00
      248   8.181985e+01
      249  -2.120729e-01
      250  -1.032272e+02
      251  -1.318757e+02
      252  -1.489088e+02
      253   7.430226e+00
      254   5.054768e+01
      255   2.872574e+00
      256   1.787321e+02
      257   1.787321e+02
      258   1.487773e+02
      259   9.444444e-01
      260   9.982762e-01
      261   9.885057e-01
      262  -3.131679e+01
      263  -3.186836e+01
      264  -6.279978e+01
      265  -1.115663e+01
      266  -2.321237e+01
      267  -6.677869e+00
      268  -4.362222e+01
      269  -4.508653e+01
      270  -3.377056e+01
      271  -3.561625e+01
      272  -2.564153e+01
      273  -3.311866e+01
      274   6.085414e+01
      275   3.781677e+01
      276   3.318308e+01
      277   6.666667e-01
      278  -1.737383e+01
      279  -2.435466e+01
      280   1.261603e+01
      281  -2.221106e+01
      282  -1.500849e+00
      283   5.054376e+01
      284   7.630545e+01
      285   4.031908e+01
      286   3.059109e+01
      287   1.010495e+01
      288   1.579555e+01
      289   6.491896e+01
      290   6.491896e+01
      291   6.491896e+01
      292  -8.490512e+00
      293   3.106752e+01
      294   3.407378e+00
      295  -2.092754e+01
      296  -2.092754e+01
      297  -2.092754e+01
      298   2.142377e+02
      299   2.142377e+02
      300   4.080437e+01
      301   1.000000e+00
      302   1.000000e+00
      303   1.000000e+00
      304  -2.636973e+01
      305  -9.878790e+01
      306   1.278107e+00
      307  -5.412136e+01
      308  -7.597983e+01
      309  -6.514563e+01
      310   3.301358e+01
      311   2.044821e+01
      312   1.173620e+01
      313  -3.188798e+01
      314  -6.418338e+01
      315  -5.439028e+01
      316  -1.671329e+01
      317  -6.819253e+01
      318  -5.179712e+01
      319  -6.083175e+01
      320  -6.083175e+01
      321  -5.396156e+01
      322  -1.871643e+00
      323   3.592713e+00
      324  -1.003242e+01
      325  -1.275507e+01
      326  -2.633492e+01
      327  -1.821464e+01
      328  -2.862415e+01
      329  -1.527558e+02
      330  -1.096937e+02
      331   1.000000e+00
      332   1.000000e+00
      333   1.000000e+00
      334   1.571214e+01
      335   2.993805e+01
      336   1.320563e+01
      337  -9.807481e+00
      338  -3.363264e+01
      339  -2.730635e+01
      340   4.242903e+01
      341   2.737357e+00
      342  -5.685481e+01
      343   3.341312e+00
      344   3.039856e+01
      345   3.298860e+01
      346  -1.015204e+02
      347  -1.015204e+02
      348  -1.015204e+02
      349  -6.782464e+01
      350   4.690016e+01
      351   2.830535e+01
      352   4.741279e+01
      353   6.697171e+01
      354   6.652394e+01
      355  -7.064286e+01
      356  -5.500141e+00
      357  -1.094048e+01
      358   1.000000e+00
      359   1.000000e+00
      360   1.000000e+00
      361   4.525304e+01
      362   4.525304e+01
      363   3.050202e+01
      364   2.009591e+01
      365  -5.921034e+01
      366  -3.056302e+01
      367  -2.191539e+01
      368  -1.376519e+01
      369  -1.807640e+01
      370   1.000000e+00
      371   1.000000e+00
      372   1.000000e+00
      373   5.531066e+01
      374   1.010868e+02
      375   8.405999e+00
      376  -2.863333e+02
      377  -2.863333e+02
      378  -2.863333e+02
      379   2.630506e+01
      380  -4.005186e+00
      381  -6.119842e+00
      382  -1.220306e+01
      383  -4.965358e+01
      384  -3.656208e+01
      385  -3.004070e+01
      386  -1.011077e+01
      387  -3.004070e+01
      388   3.268333e+01
      389   8.435634e+01
      390   3.447343e+01
      391   3.531034e+01
      392   9.282759e+01
      393   6.674566e+01
      394   3.164873e+01
      395   3.616997e+01
      396  -3.806615e+01
      397   2.865000e+02
      398   3.816667e+02
      399   2.294000e+02
      400  -1.024444e+01
      401  -1.399259e+01
      402  -1.024444e+01
      403  -3.307934e+01
      404  -3.307934e+01
      405  -1.847391e+01
      406   3.681293e+01
      407   5.074675e+01
      408   4.273338e+01
      409   8.437500e+01
      410  -2.328957e+02
      411  -2.742697e+02
      412   1.685000e+02
      413   1.685000e+02
      414   4.507895e+01
      415  -8.837167e+01
      416  -6.760131e+01
      417  -7.011855e+01
      418  -1.976031e+01
      419  -8.017161e+00
      420  -1.073813e+01
      421   1.012333e+00
      422   1.499963e+01
      423   1.066810e+01
      424   2.458440e+00
      425   2.318910e+01
      426   9.090540e+00
      427   1.000000e+00
      428   1.000000e+00
      429   1.000000e+00
      430  -2.734722e+01
      431   1.829611e+01
      432  -2.161111e+01
      433   4.285393e+01
      434   5.680524e+01
      435   2.260203e+01
      436   7.713675e+01
      437   2.722474e+01
      438  -5.292267e+00
      439   2.166807e+01
      440   1.444538e+01
      441   1.379085e+01
      442   4.575862e+01
      443   3.130183e+00
      444   4.892054e+00
      445   3.836167e+01
      446   2.021764e+00
      447   1.362414e+01
      448  -1.775357e+02
      449  -1.894348e+01
      450  -6.701361e+01
      451   1.948710e+02
      452   1.948710e+02
      453   5.639171e+01
      454   4.129054e+01
      455   8.155185e+01
      456  -6.191506e+01
      457   9.880978e+01
      458   1.446099e+02
      459   9.594303e+01
      460   1.218193e+02
      461   2.393284e+02
      462   8.494721e+01
      463  -1.668889e+02
      464  -3.394822e+01
      465  -3.368935e+01
      466   9.991667e+02
      467   9.991667e+02
      468   6.664444e+02
      469  -3.555732e+01
      470  -6.649043e+01
      471  -4.774309e+01
      472   2.664592e+02
      473   2.664592e+02
      474   2.222160e+02
      475  -5.601239e+01
      476  -4.250771e+00
      477   7.655823e+00
      478   8.220865e+00
      479   7.016575e+01
      480   4.879120e+01
      481   2.625000e+01
      482   5.437191e+01
      483   5.222523e+01
      484  -8.186262e+00
      485  -3.270957e+01
      486  -1.193276e+01
      487   9.090204e+01
      488   1.086146e+02
      489   1.110135e+01
      490   3.243026e+00
      491  -2.249848e+01
      492  -1.015311e+01
      493   2.353575e+02
      494   2.353575e+02
      495   1.181788e+02
      496  -3.553994e+01
      497  -3.782529e-01
      498  -2.491557e+01
      499   5.272089e+01
      500   5.269890e+01
      501   3.305841e+01
      502   4.024000e+02
      503   1.162211e+02
      504   1.885428e+01
      505   1.010145e+01
      506  -1.495649e+01
      507   5.060295e+01
      508   3.830326e+01
      509  -3.403216e+01
      510  -3.527785e+01
      511  -3.095126e+01
      512  -4.742626e+01
      513  -1.227168e+01
      514   2.210164e+00
      515   1.732682e+01
      516   2.015914e+01
      517  -3.488670e+01
      518  -6.426713e+01
      519  -4.472974e+01
      520   3.333333e-01
      521   2.572178e-01
      522  -5.520322e+01
      523  -5.023026e+01
      524  -1.508362e+02
      525  -1.102198e+02
      526  -1.421488e+01
      527  -1.542062e+01
      528  -3.132782e+01
      529   1.445000e+02
      530   1.445000e+02
      531   1.240000e+02
      532  -3.883352e+00
      533   5.889473e+01
      534   3.496687e+01
      535   5.412632e-01
      536  -9.272118e+00
      537  -1.218174e+01
      538  -9.218738e+00
      539  -8.928324e+00
      540  -1.050572e+01
      541   4.237972e+00
      542  -1.994903e+01
      543  -2.259801e+01
      544  -3.995485e+00
      545   8.519053e+00
      546  -2.665589e+01
      547  -6.501232e+00
      548  -4.194200e+01
      549  -3.019516e+01
      550  -1.068686e+01
      551  -1.849353e+01
      552  -2.672892e+01
      553  -6.078086e+00
      554  -1.252952e+01
      555  -1.371385e+01
      556   3.773147e+00
      557  -3.497396e+01
      558  -1.891599e+01
      559  -1.219337e+01
      560  -4.708837e+01
      561  -1.407768e+01
      562   1.470538e+01
      563   4.916684e+00
      564  -2.067577e+01
      565   1.854119e+01
      566  -3.046727e+01
      567  -4.183497e+01
      568  -1.422120e+01
      569  -2.483293e+01
      570  -3.185247e+01
      571  -4.635167e+00
      572  -1.597633e+01
      573  -5.382877e+00
      574  -1.085329e+01
      575  -6.825819e+00
      576   9.667028e+00
      577   1.263844e+01
      578  -2.226902e+01
      579   5.658006e+00
      580   7.322436e+01
      581   6.016813e+01
      582   3.583126e+01
      583  -6.236921e+00
      584  -4.280901e+01
      585  -4.368178e+01
      586   1.237731e+00
      587  -3.174069e+01
      588   3.013894e+00
      589   5.114503e+01
      590  -1.746654e+01
      591   5.008241e+01
      592   3.158807e+01
      593   5.275050e+00
      594  -3.169771e+01
      595  -1.272677e+00
      596  -2.118296e+01
      597   1.171239e+01
      598  -1.099185e+01
      599   5.552811e+01
      600  -8.082705e+00
      601   3.047067e+00
      602  -3.507655e+01
      603  -2.866856e+01
      604   1.049781e+00
      605  -9.306619e-01
      606  -9.891039e+00
      607  -1.003651e+01
      608   5.862374e+00
      609   7.897987e+00
      610   4.311745e+01
      611   3.688101e+01
      612   6.580255e+01
      613  -9.453460e+00
      614  -1.309305e+01
      615   1.890491e+01
      616  -9.885243e+00
      617   1.977130e+01
      618   3.303335e+00
      619   1.024059e+01
      620   3.975669e+01
      621   1.062272e+00
      622  -1.113160e+01
      623  -3.493207e+00
      624   4.992377e+00
      625   4.498445e+00
      626  -8.605838e+00
      627   8.301057e+00
      628  -1.531415e+01
      629  -5.829293e-01
      630   1.620190e+01
      631  -1.653987e-01
      632  -2.176758e+01
      633  -3.266456e+01
      634  -4.606667e+00
      635   2.112092e+00
      636   3.166951e+00
      637  -2.072608e-02
      638   2.053076e+01
      639   1.264666e+01
      640  -1.311060e+01
      641   3.839149e+01
      642   7.577016e+00
      643   1.170205e+00
      644  -1.649244e+00
      645  -4.735214e+01
      646   2.250397e+00
      647  -7.711200e+00
      648  -1.090430e+01
      649  -9.177050e+00
      650   2.129443e+01
      651   2.064890e+01
      652  -1.208374e+00
      653  -6.324855e+00
      654  -7.496653e+00
      655  -6.700726e+00
      656  -2.316662e+01
      657  -2.737638e+01
      658   1.636933e+01
      659   2.037250e+01
      660   2.554339e+01
      661  -7.985221e+00
      662   1.986896e+01
      663   1.733653e+01
      664  -1.358348e+01
      665  -1.288820e+01
      666  -3.758654e+01
      667  -1.053886e+01
      668   1.764268e+00
      669   3.678228e+01
      670  -1.582265e+01
      671  -2.244749e+01
      672  -9.558001e-03
      673  -1.468865e+01
      674   9.519861e-01
      675  -3.180671e+00
      676  -6.583811e+00
      677   1.505234e+01
      678  -3.445318e-01
      679  -6.343656e+01
      680  -4.491549e+00
      681  -8.730193e+01
      682  -1.511192e+00
      683  -4.390238e+01
      684  -1.892701e+01
      685  -1.483163e+01
      686  -1.107125e+01
      687   3.381195e+00
      688  -6.151880e+00
      689   3.537774e+01
      690   1.474914e+01
      691  -1.732132e-02
      692  -8.411879e-01
      693  -2.843835e+01
      694   1.430131e+00
      695   1.396205e+01
      696   3.081316e+00
      697  -1.362607e+00
      698   3.661395e+00
      699  -1.966104e+00
      700  -2.463692e+00
      701   7.468559e+00
      702  -2.372142e+01
      703   1.386083e+01
      704   4.204487e+00
      705   3.258904e+00
      706   2.794036e+01
      707   1.169924e+01
      708  -5.615747e+00
      709  -1.381294e+01
      710  -1.057249e+01
      711  -2.350384e+01
      712  -1.429245e+00
      713  -2.250325e+00
      714   9.335048e+00
      715  -1.706443e+01
      716   1.596632e+01
      717  -1.639105e+01
      718  -1.605552e+01
      719  -8.434363e+00
      720  -1.033393e+01
      721  -1.251936e+01
      722  -4.140151e+01
      723  -2.851416e+01
      724  -2.523322e+01
      725  -5.904279e+00
      726  -2.983585e+01
      727   1.811027e+00
      728   3.974985e+00
      729  -3.856770e+00
      730  -6.790277e+00
      731  -2.741504e+01
      732  -1.070280e+01
      733  -1.790842e+01
      734  -1.030088e+02
      735  -2.320844e+01
      736   7.287837e+00
      737  -2.973512e+00
      738  -5.015080e+00
      739  -1.333655e+01
      740   2.211884e-01
      741   2.469282e+00
      742   5.552807e+00
      743   2.816637e+00
      744   3.229633e+01
      745  -1.040168e+01
      746  -1.462595e+00
      747  -1.890834e+01
      748   4.337292e+00
      749  -3.229875e+01
      750  -1.808965e+01
      751  -1.196108e+01
      752  -6.822607e-01
      753   3.762448e+00
      754   4.639485e+01
      755   3.241895e+01
      756   6.212188e+01
      757  -1.275632e+01
      758  -2.241117e+01
      759  -2.963720e+01
      760   4.799185e+00
      761   4.633508e+01
      762   1.251325e+01
      763   5.074921e+00
      764  -2.114218e+00
      765   6.783997e+00
      766   4.816659e-01
      767   5.125921e+01
      768   4.945305e+01
      769   2.905487e+01
      770  -1.435417e+01
      771  -2.078135e+01
      772  -1.204504e+01
      773   3.882231e+01
      774   3.035075e+01
      775   1.731979e+01
      776  -5.323982e+01
      777  -7.478711e+00
      778   4.201530e-01
      779  -2.576687e+00
      780  -3.264679e+00
      781   1.409226e+02
      782  -1.030783e+02
      783  -4.033592e+01
      784  -1.369023e+01
      785   5.341327e+01
      786   4.980249e+01
      787   1.039990e+01
      788   5.886723e+01
      789   2.356546e+01
      790  -4.809783e+01
      791  -7.944110e+01
      792   6.364194e+00
      793   2.562670e+01
      794  -9.924862e+01
      795  -4.219832e+00
      796   1.798208e+01
      797  -8.241423e+01
      798  -3.970652e+01
      799  -9.292814e+00
      800  -9.995959e+00
      801  -3.115935e+00
      802   7.190583e+01
      803   2.333963e+01
      804  -6.090003e+01
      805   5.048426e-01
      806   9.764860e+00
      807  -1.582683e+01
      808  -2.657526e+01
      809   3.214222e+01
      810   4.712561e+00
      811   1.370150e+00
      812  -7.116180e+00
      813   3.374173e+00
      814  -4.139919e+00
      815  -2.259515e+01
      816  -2.062734e+01
      817  -1.100623e+01
      818   1.482554e+01
      819   3.661442e+00
      820  -1.318221e+01
      821   5.989449e+01
      822   5.495602e+01
      823   8.194182e+00
      824   7.237261e+01
      825   3.008920e+01
      826  -5.006393e+00
      827   4.932241e-01
      828   7.514289e+00
      829   1.059460e+01
      830   2.735901e+01
      831  -2.586108e+01
      832   1.723445e+01
      833   6.105418e+01
      834   5.223276e+01
      835  -4.543777e+00
      836   3.686869e+00
      837   1.008091e+01
      838  -4.620404e+00
      839   1.891717e+00
      840   6.050034e+00
      841  -8.075762e+01
      842   5.193281e+01
      843   3.063415e+01
      844   3.332050e+01
      845  -7.282935e+01
      846  -6.882369e+01
      847  -1.555716e+00
      848  -1.816992e+00
      849  -3.870540e+00
      850  -2.409856e+00
      851  -5.701752e+01
      852  -3.915804e+01
      853  -3.742745e+00
      854  -7.660771e+01
      855  -4.883943e+01
      856   3.212490e+00
      857   9.221568e+00
      858  -4.629112e+00
      859   7.755636e+00
      860  -4.402186e+01
      861   1.075859e+01
      862  -6.789436e+00
      863  -9.291814e+00
      864   6.849952e+00
      865   5.618728e-01
      866  -1.121640e+01
      867  -1.164196e+01
      868   2.044458e+00
      869   4.038366e+01
      870   2.697628e+01
      871   2.211124e+00
      872  -3.133643e+01
      873  -8.708905e+00
      874  -4.299631e-01
      875   1.085615e+02
      876   1.541189e+01
      877  -5.964102e+00
      878  -4.244433e+01
      879  -6.290360e+01
      880  -1.825978e+01
      881   2.910046e+01
      882   3.255854e+01
      883  -1.392178e+01
      884  -1.360907e+01
      885  -6.607111e+00
      886  -5.600907e+00
      887  -3.371527e+01
      888  -3.108970e+01
      889  -3.167648e+01
      890  -2.600634e+01
      891  -2.341839e+01
      892  -1.635348e+00
      893   2.408939e+01
      894   1.386925e+01
      895  -2.596552e+01
      896   1.760446e+01
      897  -6.944164e-01
      898   2.582626e+01
      899  -2.945053e+02
      900  -3.065538e+02
      901  -9.374150e-01
      902   6.008804e+00
      903  -8.467472e+01
      904   4.399080e+00
      905  -3.595541e+01
      906  -3.737246e+01
      907  -3.939243e+00
      908   2.620092e+01
      909   2.654202e+01
      910  -1.221150e+00
      911  -7.722551e+01
      912  -6.613409e+01
      913  -1.472011e-01
      914   1.899786e+01
      915   2.251148e+01
      916   2.013564e+01
      917   1.041601e+01
      918  -4.339248e+00
      919  -1.145150e+01
      920  -6.553334e+00
      921  -3.705901e+01
      922  -5.358413e+01
      923   1.549237e+02
      924   1.790173e+02
      925  -1.248070e+01
      926   1.131741e+02
      927   5.927229e+01
      928   3.829510e+00
      929   8.064225e+00
      930   3.377576e+01
      931  -1.062668e+01
      932   9.314654e+01
      933   6.284813e+01
      934  -3.850963e-01
      935  -1.820265e+01
      936   1.901026e+01
      937  -7.685487e+00
      938  -1.918012e+01
      939   7.003896e+00
      940   1.317327e+00
      941  -2.834751e+01
      942  -3.029388e+01
      943   4.424576e+00
      944   5.523786e+01
      945   8.459113e+01
      946   3.944444e-01
      947  -1.692556e+02
      948  -5.984887e+01
      949  -2.517381e+00
      950  -2.968926e+01
      951   1.179664e+01
      952   6.101091e+01
      953  -2.118148e+02
      954  -1.130272e+02
      955   1.621552e+01
      956  -1.779520e+01
      957   1.482536e+02
      958  -9.321472e+00
      959  -1.452165e+01
      960   2.368459e+01
      961  -1.826751e+02
      962   4.069463e+02
      963  -1.700583e+02
      964  -3.742817e+01
      965   6.012934e+00
      966   3.901944e+00
      967   6.033399e+00
      968  -1.551573e+01
      969  -1.101223e+01
      970  -2.052199e+01
      971   9.087345e+01
      972   3.354173e+01
      973   8.321302e+00
      974  -1.018113e+00
      975   6.660923e+01
      976   2.286986e+01
      977  -3.486659e+00
      978  -3.972652e+01
      979   4.774220e+00
      980   2.268181e-01
      981   3.183837e+00
      982  -2.177399e+01
      983   1.809895e+01
      984  -1.623394e+01
      985  -1.627581e+00
      986   1.138373e+01
      987   1.486917e+01
      988  -7.153259e+00
      989  -4.581584e+01
      990  -2.269418e+01
      991  -4.771699e+01
      992  -9.535970e+00
      993  -4.121010e+01
      994  -2.277065e+00
      995  -4.523001e+01
      996   3.511388e-01
      997  -9.780828e+00
      998   3.882584e+01
      999  -5.739457e+00
      1000  3.298537e+00
      1001  7.219451e+00
      1002  4.009409e+00
      1003  3.111774e+01
      1004  8.981282e+00
      1005 -5.302126e+01
      1006 -2.209630e+02
      1007 -3.569736e+02
      1008 -1.609656e+02
      1009 -3.976444e+01
      1010 -4.915944e-01
      1011  1.417721e+02
      1012 -1.145685e+01
      1013 -3.012700e+01
      1014 -1.696658e+01
      1015  3.907699e+01
      1016  7.018574e+01
      1017  1.536714e+01
      1018 -3.247131e+01
      1019 -1.344629e+02
      1020 -1.103007e+02
      1021 -4.650687e+00
      1022  8.925219e+01
      1023  1.992912e+01
      1024 -1.692843e+01
      1025  4.895228e+01
      1026  3.974124e+01
      1027  8.246527e+01
      1028  7.473344e+01
      1029  3.371448e+01
      1030 -2.167825e+01
      1031 -6.391617e+01
      1032 -4.359531e+01
      1033  1.153229e+02
      1034  2.147263e+02
      1035  1.215022e+02
      1036  8.192669e+01
      1037  4.123468e+01
      1038  8.446988e+01
      1039  7.690395e+01
      1040  7.419245e+01
      1041  8.509208e+01
      1042 -2.968622e+01
      1043 -7.848219e+01
      1044 -5.410236e+01
      1045 -2.320774e+01
      1046 -7.261518e+01
      1047 -1.026415e+01
      1048 -2.735877e+01
      1049 -3.181630e+01
      1050 -3.355086e+01
      1051 -6.106661e+01
      1052  3.399236e+00
      1053 -7.201138e+01

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
      1    211_528514      JaccardDiss  0.016466117 0.229606351            0
      2    211_528514 MorisitaHornDiss  0.011510256 0.741736591            0
      3    211_528514   BrayCurtisDiss -0.001134076 0.943233207            0
      4    211_524878      JaccardDiss -0.030644828 0.061738185            0
      5    211_524878 MorisitaHornDiss -0.060114737 0.209823011            0
      6    211_524878   BrayCurtisDiss -0.042005035 0.232230755            0
      7    211_521245      JaccardDiss  0.007492335 0.756120147            0
      8    211_521245 MorisitaHornDiss -0.018813874 0.471069461            0
      9    211_521245   BrayCurtisDiss -0.014953472 0.568542113            0
      10   211_522693      JaccardDiss  0.027572520 0.108677342            0
      11   211_522693 MorisitaHornDiss  0.050219603 0.282118088            0
      12   211_522693   BrayCurtisDiss  0.032042257 0.421384744            0
      13   211_516876      JaccardDiss  0.020103306 0.735137376            0
      14   211_516876 MorisitaHornDiss  0.005039937 0.975352494            0
      15   211_516876   BrayCurtisDiss  0.093904330 0.392267026            0
      16   211_516147      JaccardDiss  0.013562248 0.009648326            1
      17   211_516147 MorisitaHornDiss -0.049345362 0.410116711            0
      18   211_516147   BrayCurtisDiss -0.007715775 0.926900414            0
      19  437_2074469      JaccardDiss  0.012428120 0.085091524            0
      20  437_2074469 MorisitaHornDiss  0.049305201 0.208175388            0
      21  437_2074469   BrayCurtisDiss  0.036612792 0.523905114            0
      22  437_2076657      JaccardDiss -0.043230231 0.013422784            1
      23  437_2076657 MorisitaHornDiss  0.015534820 0.645994406            0
      24  437_2076657   BrayCurtisDiss -0.001983839 0.958180478            0
      25  437_2075929      JaccardDiss -0.035569936 0.202373158            0
      26  437_2075929 MorisitaHornDiss -0.018768995 0.458844587            0
      27  437_2075929   BrayCurtisDiss -0.029662335 0.055367840            0
      28  437_2078113      JaccardDiss  0.011403775 0.672923116            0
      29  437_2078113 MorisitaHornDiss -0.018343932 0.540008313            0
      30  437_2078113   BrayCurtisDiss -0.003918587 0.821621588            0
      31  437_2075928      JaccardDiss  0.015061360 0.179385743            0
      32  437_2075928 MorisitaHornDiss  0.062536228 0.245770912            0
      33  437_2075928   BrayCurtisDiss  0.030408842 0.252202834            0
      34  437_2075200      JaccardDiss -0.036797158 0.233709903            0
      35  437_2075200 MorisitaHornDiss -0.015957164 0.181915234            0
      36  437_2075200   BrayCurtisDiss -0.024477041 0.174019472            0
      37  437_2073742      JaccardDiss  0.016442445 0.519997777            0
      38  437_2073742 MorisitaHornDiss  0.006988277 0.099111013            0
      39  437_2073742   BrayCurtisDiss -0.013951057 0.312102595            0
      40  437_2073741      JaccardDiss  0.030656345 0.079023964            0
      41  437_2073741 MorisitaHornDiss  0.031622558 0.641753140            0
      42  437_2073741   BrayCurtisDiss  0.047328352 0.516437303            0
           intercept
      1   -31.997958
      2   -22.486480
      3     2.944410
      4    61.467806
      5   119.604204
      6    84.043341
      7   -14.153891
      8    38.091477
      9    30.441113
      10  -54.004559
      11  -99.358089
      12  -63.006406
      13  -39.122077
      14   -9.728472
      15 -185.524584
      16  -26.195987
      17   97.986983
      18   16.127830
      19  -24.324486
      20  -98.725114
      21  -73.013310
      22   87.572339
      23  -30.930996
      24    4.581067
      25   72.190870
      26   38.026796
      27   60.172066
      28  -22.274275
      29   37.307670
      30    8.473196
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

