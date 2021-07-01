-- latch ; density control for sample and hold of noise signal (c.f. dust)
let n0 = whiteNoiseId 'α' ar
    n1 = whiteNoiseId 'β' ar
    k = 1000
    c = control_m kr "density" 26 (0.01,k,"exp")
in latch n0 (n1 `greater_than` ((constant k - c) / constant k)) * 0.1
