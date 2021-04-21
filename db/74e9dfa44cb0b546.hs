-- latch ; density control for sample and hold of noise signal
let n = whiteNoise 'α' AR
    c = control_m KR "density" 26 (0.01,8000,"exp")
in latch n (dust 'γ' AR c) * 0.1
