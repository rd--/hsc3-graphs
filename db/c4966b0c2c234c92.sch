-- s-chirp (rd, 2006-10-08)
let x = mousex 15 0 linear 0.1
    y = mousey 15 27 linear 0.1
    t = cr (dust 9)
    b = tchoose t [36,48,60,72]
    n = lfnoise1 [3, 3.05] * 0.04
    d = tirand x y t
    e = decay2 t 0.005 (trand 0.02 0.15 t)
    k = degreetokey (aslocalbuf 1 [0,2,3.2,5,7,9,10]) d 12
    f = midicps (b + k + n)
    m = e * sinosc (cr f) 0 * 0.2
    u = pulsedivider t 9 0
    r0 = trand 0.0075 0.125 u
    r1 = trand 0.05 0.15 u
in m * 0.5 + allpassc m 0.15 r0 r1
