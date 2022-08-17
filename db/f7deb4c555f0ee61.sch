-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    zn = 66
    x = let j = LinLin (LFNoise2 (log 2 / 2)) (-1) 1 1 30
            ph = InFeedback 2 zn * map (LFDNoise3 . sqrt) [1, 2]
            f = [281, 107, 263, 151, 271, 19, 229, 193, 293, 131, 71, 101, 181, 7, 13, 29, 223, 251, 199, 79, 61, 163, 173, 37, 139, 43, 3, 89, 113, 53, 239]
        in Out xn (SelectX j (SinOsc f ph))
    y = let ph = InFeedback 2 xn * dup (\() -> LFDNoise1 (sqrt pi)) 2 * pi
        in Out yn (Tanh (SinOsc 19 ph) * exp 1)
    z = let ph = InFeedback 2 yn * dup (\() -> LFDNoise0 (sqrt (sqrt pi))) 2 * 42 * pi
        in Out zn (Tanh (SinOsc 43 ph) * exp (-0.5 * pi))
in Mrg4 (InFeedback 2 xn) y x z * 0.1
