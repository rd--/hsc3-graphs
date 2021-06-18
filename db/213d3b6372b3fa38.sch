-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    zn = 66
    x = let j = lfnoise2 (log 2 / 2) `tolinrange` (1,30)
            ph = infeedback 2 zn * map (lfdnoise3 . sqrt) [1,2]
            f = [281,107,263,151,271,19,229,193,293,131,71,101,181,7,13,29,223,251,199,79,61,163,173,37,139,43,3,89,113,53,239]
        in out xn (selectx j (sinosc f ph))
    y = let ph = infeedback 2 xn * mcefill 2 (\_ -> lfdnoise1 (sqrt pi)) * pi
        in out yn (tanh (sinosc 19 ph) * exp 1)
    z = let ph = infeedback 2 yn * mcefill 2 (\_ -> lfdnoise0 (sqrt (sqrt pi))) * 42 * pi
        in out zn (tanh (sinosc 43 ph) * exp (-0.5 * pi))
in mrg4 (infeedback 2 xn) y x z
