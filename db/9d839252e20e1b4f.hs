-- spring ; modulating a resonating string
let k = mouseX KR 0.5 100 Exponential 0.2
    d = mouseY KR 0.0001 0.1 Exponential 0.2
    t = dust 'α' AR 2
    m0 = spring AR (toggleFF t) k 0.01
    m1 = spring AR m0 (0.5 * k) d
    m2 = spring AR m0 (0.6 * k) d
    m3 = spring AR (mce2 m1 m2) (0.4 * k) d
    m4 = spring AR (m3 - m1 + m2) (0.1 * k) d
in combL t 0.1 (linLin m4 (-10) 10 (1/8000) (1/100)) 12
