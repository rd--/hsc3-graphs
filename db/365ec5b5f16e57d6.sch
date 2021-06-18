-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    zn = 66
    x = let j = lfnoise0 (log 2 / 2) `tolinrange` (1,30)
            f = select j [3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127]
            ph = infeedback 2 zn * map (cr . lfdnoise3 . sqrt) [1,2]
        in out xn (mcereverse (sinosc (cr f) ph))
    y = let ph = infeedback 2 xn * mcefill 2 (\_ -> lfdnoise1 (sqrt pi)) * pi
        in out yn (tanh (sinosc 19 ph) * exp 1)
    z = let ph = infeedback 2 yn * mcefill 2 (\_ -> lfdnoise0 (sqrt (sqrt pi))) * 42 * pi
        in out zn (tanh (sinosc 43 ph) * exp (-0.5 * pi))
in mrg4 (infeedback 2 xn) y x z
