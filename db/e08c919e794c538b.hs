-- integrator
let x = mouseX kr 0.001 0.999 Exponential 0.2
    o = lfPulse ar 300 0.2 0.1 * 0.1
in integrator o x
