-- sweep ; using sweep to modulate sine frequency
let x = mouseX kr 0.5 20 Exponential 0.1
    t = impulse kr x 0
    f = sweep kr t 700 + 500
in sinOsc ar f 0 * 0.2
