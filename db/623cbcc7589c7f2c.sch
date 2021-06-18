-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    zn = 66
    x = let ph = infeedback 2 yn * map (\i -> lfdnoise3 (sqrt i)) [1,2]
        in out xn (mcereverse (sinosc 89 ph))
    y = let ph = infeedback 2 xn * mcefill 2 (\_ -> lfdnoise1 (sqrt pi)) * pi
        in out yn (tanh (sinosc 19 ph))
    z = let ph = infeedback 2 yn * mcefill 2 (\_ -> lfdnoise0 (sqrt (sqrt pi))) * 42 * pi
        in out zn (tanh (sinosc 43 ph) * exp (-0.5 * pi))
in mrg4 (infeedback 2 xn) y x z
