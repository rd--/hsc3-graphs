-- spring ;several springs in series
let inforce = k2a (mouseButton kr 0 1 0) `greater_than` 0
    k = mouseX kr 0.1 20 Exponential 0.2
    d = mouseY kr 0.00001 0.1 Exponential 0.2
    m0 = spring ar inforce k 0.01
    m1 = spring ar m0 (0.5 * k) d
    m2 = spring ar m0 (0.6 * k + 0.2) d
    m3 = spring ar (m1 - m2) 0.4 d
in sinOsc ar (m3 * 200 + 500) 0 * 0.1 -- modulate frequency with the force
