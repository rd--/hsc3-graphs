-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    zn = 66
    x = let ph = InFeedback 2 yn * map (\i -> LfdNoise3 (sqrt i)) [1, 2]
        in Out xn (reverse (SinOsc 89 ph))
    y = let ph = InFeedback 2 xn * Dup (\() -> LfdNoise1 (sqrt pi)) 2 * pi
        in Out yn (Tanh (SinOsc 19 ph))
    z = let ph = InFeedback 2 yn * Dup (\() -> LfdNoise0 (sqrt (sqrt pi))) 2 * 42 * pi
        in Out zn (Tanh (SinOsc 43 ph) * exp (-0.5 * pi))
in Mrg4 (InFeedback 2 xn) y x z * 0.1
