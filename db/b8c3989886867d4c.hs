-- stepper
let i = impulse kr 10 0
    f = stepper i 0 4 16 (-3) 4 * 100
in sinOsc ar f 0 * 0.1
