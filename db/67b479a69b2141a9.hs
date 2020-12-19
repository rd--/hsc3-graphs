-- stepper
let i = impulse KR 10 0
    f = stepper i 0 4 16 (-3) 4 * 100
in sinOsc AR f 0 * 0.1
