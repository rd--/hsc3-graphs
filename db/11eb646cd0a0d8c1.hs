-- poll ; print oscillator frequency
let x = mouseX KR 200 260 Exponential 0.2
    o = sinOsc AR x 0 * 0.25
    t = impulse KR 2 0
in mrg2 o (poll t x 0 (label "polling..."))
