-- dynKlank ; change frequencies (x) and ring-times (y) with mouse.
let x = mouseX KR 0.5 2 Exponential 0.2
    f = map (* x) [800,1071,1153,1723]
    y = mouseY KR 0.1 10 Exponential 0.2
    d = map (* y) [1,1,1,1]
    s = klankSpec f [1,1,1,1] d
    i = impulse AR 2 0 * 0.1
in dynKlank i 1 0 1 s
