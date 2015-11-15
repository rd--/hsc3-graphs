-- crotale (rd)

import Sound.SC3 {- hsc3 -}

crotale :: UGen
crotale =
    let (cf,ca,cd) = crotale_data
        ps = mce [-12,-5,0,2,4,5,7,12]
        n = pinkNoise 'α' AR
        t = dust 'β' KR 3
        fs = select (tIRand 'γ' 0 7 t) ps
        g = tRand 'δ' 0 1 t
        fo = tRand 'ε' 0 1 t
        ds = tRand 'ζ' 2 7 t
        p = tRand 'η' (-1) 1 t
        s = decay2 t 0.06 0.01 * n * g
        ks = klankSpec' cf ca (map recip cd)
        k = dynKlank s (midiRatio fs) fo ds ks
    in pan2 k p 1

main :: IO ()
main = audition (out 0 crotale)

-- (freq,ampl,decay)
crotale_data :: ([Double],[Double],[Double])
crotale_data =
    ([35.45676040649414
     ,128.59849548339844
     ,346.9721984863281
     ,483.5544128417969
     ,1049.2449951171875
     ,1564.0279541015625
     ,1756.3399658203125
     ,3391.666015625
     ,3451.802001953125
     ,3497.261962890625
     ,3596.89794921875
     ,3696.739013671875
     ,3835.235107421875
     ,3845.955078125
     ,4254.85107421875
     ,4407.533203125
     ,4415.26416015625
     ,4552.865234375
     ,5538.076171875
     ,5637.73681640625
     ,5690.2978515625
     ,5728.0068359375
     ,5764.27685546875
     ,5824.4189453125
     ,6377.60498046875
     ,6544.35009765625
     ,6807.14404296875
     ,6994.97021484375
     ,7026.84619140625
     ,7144.5859375
     ,7269.61279296875
     ,7393.6708984375
     ,7897.259765625
     ,8040.4580078125
     ,8157.77099609375
     ,8225.01953125
     ,9126.150390625
     ,9488.529296875
     ,9916.408203125
     ,10155.599609375
     ,11715.9599609375
     ,12111.830078125
     ,12339.990234375
     ,12417.669921875
     ,12459.2802734375
     ,12618.330078125
     ,13116.490234375
     ,13201.1298828125
     ,13297.830078125
     ,13533.75]
    ,[0.0012827360769733787
     ,0.0008040848188102245
     ,0.017361238598823547
     ,0.004835359752178192
     ,0.004413491114974022
     ,0.004110544919967651
     ,0.0003338181704748422
     ,0.0036140112206339836
     ,0.006919348146766424
     ,0.0003224937245249748
     ,0.0006031467346474528
     ,0.06686479598283768
     ,0.000605064386036247
     ,0.003602313343435526
     ,0.0002835785271599889
     ,0.015243238769471645
     ,0.020536603406071663
     ,0.016677580773830414
     ,0.0009245267719961703
     ,0.20205098390579224
     ,0.0012542791664600372
     ,0.012705927714705467
     ,0.0002523190632928163
     ,0.0004866079252678901
     ,0.0006429700297303498
     ,0.0007763264584355056
     ,0.2081160992383957
     ,0.0024918108247220516
     ,0.00193469924852252
     ,0.005231771152466536
     ,0.0069242212921381
     ,0.001203975174576044
     ,0.2050020843744278
     ,0.04060448706150055
     ,0.0038344631902873516
     ,0.002189427148550749
     ,0.18056060373783112
     ,0.002192433224990964
     ,0.006516554858535528
     ,0.009982921183109283
     ,0.004745401442050934
     ,0.046154771000146866
     ,0.000510294979903847
     ,0.0018905038014054298
     ,0.0019782145973294973
     ,0.006729386281222105
     ,0.0023426134139299393
     ,0.0024002245627343655
     ,0.03515550494194031
     ,0.0014084168942645192]
    ,[5.203680992126465
     ,1.7034343481063843
     ,40.16516876220703
     ,27.282501220703125
     ,0.8950523138046265
     ,42.84742736816406
     ,2.6603667736053467
     ,15.7678861618042
     ,6.848367214202881
     ,3.2325007915496826
     ,1.7343382835388184
     ,2.0202419757843018
     ,4.7279052734375
     ,9.400103569030762
     ,0.7102512717247009
     ,37.494625091552734
     ,36.24879455566406
     ,29.172658920288086
     ,3.891019344329834
     ,4.757885456085205
     ,3.851426124572754
     ,20.90781021118164
     ,3.732874870300293
     ,2.3834102153778076
     ,10.443285942077637
     ,8.795611381530762
     ,20.98564338684082
     ,18.01180076599121
     ,25.297883987426758
     ,14.819819450378418
     ,42.39189910888672
     ,2.9485135078430176
     ,11.043763160705566
     ,49.55165100097656
     ,29.882694244384766
     ,10.527188301086426
     ,23.5572452545166
     ,26.55561637878418
     ,45.099605560302734
     ,22.550390243530273
     ,36.46126174926758
     ,11.826201438903809
     ,16.818185806274414
     ,14.903121948242188
     ,32.81113815307617
     ,43.1389045715332
     ,12.289558410644531
     ,11.498942375183105
     ,10.465788841247559
     ,24.93169593811035])

