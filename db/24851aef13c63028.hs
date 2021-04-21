-- latch ; density control for sample and hold of noise signal (c.f. dust)
let n0 = whiteNoise 'α' AR
    n1 = whiteNoise 'β' AR
    k = 1000
    c = control_m KR "density" 26 (0.01,k,"exp")
in latch n0 (n1 `greater_than` ((constant k - c) / constant k)) * 0.1
