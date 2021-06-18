-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = infeedback 2 yn * [lfdnoise3 1, lfdnoise3 1]
        in out xn (mcereverse (sinosc (60 * 2) ph))
    y = let ph = infeedback 2 xn * [lfdnoise3 0.3, lfdnoise3 0.3] * 4
        in out yn (sinosc (50 * 2) ph)
in mrg3 (infeedback 2 xn) y x
