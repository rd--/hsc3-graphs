-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = infeedback 2 yn * mcefill 2 (\_ -> lfdnoise3 (sqrt 2))
        in out xn (mcereverse (sinosc 89 ph))
    y = let ph = infeedback 2 xn * mcefill 2 (\_ -> lfdnoise3 (sqrt pi)) * pi
        in out yn (tanh (sinosc 19 ph))
in mrg3 (infeedback 2 xn) y x
