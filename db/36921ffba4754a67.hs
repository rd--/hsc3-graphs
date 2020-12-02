-- sweep ; using sweep to modulate sine frequency
let x = mouseX KR 0.5 20 Exponential 0.1
    t = impulse KR x 0
    f = sweep t 700 + 500
in sinOsc AR f 0 * 0.2
