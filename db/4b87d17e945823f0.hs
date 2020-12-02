-- tBrownRand ; audio rate noise
let x = mouseX KR 500 5000 Exponential 0.2
    y = mouseY KR 10 500 Exponential 0.2
    t = dust 'α' AR x
in lag (X.tBrownRand 'β' (-1) 1 0.2 0 t) (y / 48000)
