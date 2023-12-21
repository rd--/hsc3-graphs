-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = InFeedback 2 yn * Dup (\() -> LfdNoise3 (sqrt 2)) 2
        in Out xn (reverse (SinOsc 89 ph))
    y = let ph = InFeedback 2 xn * Dup (\() -> LfdNoise3 (sqrt pi)) 2 * pi
        in Out yn (Tanh (SinOsc 19 ph))
in Mrg3 (InFeedback 2 xn) y x * 0.1
