-- integrator
let x = mouseX KR 0.001 0.999 Exponential 0.2
    o = lfPulse AR 300 0.2 0.1 * 0.1
in integrator o x
