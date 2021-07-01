-- integrator ; scope
let x = mouseX kr 0.01 0.999 Exponential 0.2
    o = lfPulse ar (1500 / 4) 0.2 0.1
in integrator o x * 0.1
