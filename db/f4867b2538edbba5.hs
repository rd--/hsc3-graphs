-- integrator ; used as an envelope
let i = lfPulse AR 3 0.2 0.0004
    o = sinOsc AR 700 0 * 0.1
in integrator i 0.999 * o
