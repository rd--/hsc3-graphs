-- eggcrate (rd, 2007-04-23)
let cosu = cos . (* pi)
    sinu = sin . (* pi)
    eggcrate_f u v = cosu u * sinu v
    p = mce [64,72,96,128,256,6400,7200,8400,9600]
    bimap f (i,j) = (f i,f j)
    (x,y) = bimap (`brownNoise` KR) ('α','β')
    t = dust 'γ' KR 2.4
    (f0,f1) = bimap (\z -> tChoose z t p) ('δ','ε')
    f = linLin_b (eggcrate_f x y) f0 f1
    a = linLin_b x 0 0.1
in pan2 (mix (sinOsc AR f 0)) y a
