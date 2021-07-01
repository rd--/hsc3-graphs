-- latch ; density control for sample and hold of noise signal
let n = whiteNoiseId 'α' ar
    c = control_m kr "density" 26 (0.01,8000,"exp")
in latch n (dustId 'γ' ar c) * 0.1
