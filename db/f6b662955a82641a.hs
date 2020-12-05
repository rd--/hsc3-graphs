-- crotale (rd, 2006-10-17)
let crotale_data =
      ([35.45
       ,128.59
       ,346.97
       ,483.55
       ,1049.24
       ,1564.02
       ,1756.33
       ,3391.66
       ,3451.80
       ,3497.26
       ,3596.89
       ,3696.73
       ,3835.23
       ,3845.95
       ,4254.85
       ,4407.53
       ,4415.26
       ,4552.86
       ,5538.07
       ,5637.73
       ,5690.29
       ,5728.00
       ,5764.27
       ,5824.41
       ,6377.60
       ,6544.35
       ,6807.14
       ,6994.97
       ,7026.84
       ,7144.58
       ,7269.61
       ,7393.67
       ,7897.25
       ,8040.45
       ,8157.77
       ,8225.01
       ,9126.15
       ,9488.52
       ,9916.40
       ,10155.59
       ,11715.95
       ,12111.83
       ,12339.99
       ,12417.66
       ,12459.28
       ,12618.33
       ,13116.49
       ,13201.12
       ,13297.83
       ,13533.75]
      ,[0.001282
       ,0.000804
       ,0.017361
       ,0.004835
       ,0.004413
       ,0.004110
       ,0.000333
       ,0.003614
       ,0.006919
       ,0.000322
       ,0.000603
       ,0.066864
       ,0.000605
       ,0.003602
       ,0.000283
       ,0.015243
       ,0.020536
       ,0.016677
       ,0.000924
       ,0.202050
       ,0.001254
       ,0.012705
       ,0.000252
       ,0.000486
       ,0.000642
       ,0.000776
       ,0.208116
       ,0.002491
       ,0.001934
       ,0.005231
       ,0.006924
       ,0.001203
       ,0.205002
       ,0.040604
       ,0.003834
       ,0.002189
       ,0.180560
       ,0.002192
       ,0.006516
       ,0.009982
       ,0.004745
       ,0.046154
       ,0.000510
       ,0.001890
       ,0.001978
       ,0.006729
       ,0.002342
       ,0.002400
       ,0.035155
       ,0.001408]
      ,[5.203680
       ,1.703434
       ,40.165168
       ,27.282501
       ,0.895052
       ,42.847427
       ,2.660366
       ,15.767886
       ,6.848367
       ,3.232500
       ,1.734338
       ,2.020241
       ,4.727905
       ,9.400103
       ,0.710251
       ,37.494625
       ,36.248794
       ,29.172658
       ,3.891019
       ,4.757885
       ,3.851426
       ,20.907810
       ,3.732874
       ,2.383410
       ,10.443285
       ,8.795611
       ,20.985643
       ,18.011800
       ,25.297883
       ,14.819819
       ,42.391899
       ,2.948513
       ,11.043763
       ,49.551651
       ,29.882694
       ,10.527188
       ,23.557245
       ,26.555616
       ,45.099605
       ,22.550390
       ,36.461261
       ,11.826201
       ,16.818185
       ,14.903121
       ,32.811138
       ,43.138904
       ,12.289558
       ,11.498942
       ,10.465788
       ,24.931695])
    (cf,ca,cd) = crotale_data
    ps = mce [-12,-5,0,2,4,5,7,12]
    n = pinkNoise 'α' AR
    t = dust 'β' KR 3
    fs = select (tiRand 'γ' 0 7 t) ps
    g = tRand 'δ' 0 1 t
    fo = tRand 'ε' 0 1 t
    ds = tRand 'ζ' 2 7 t
    p = tRand 'η' (-1) 1 t
    s = decay2 t 0.06 0.01 * n * g
    ks = klankSpec_k cf ca (map recip cd)
    k = dynKlank s (midiRatio fs) fo ds ks
in pan2 k p 1
