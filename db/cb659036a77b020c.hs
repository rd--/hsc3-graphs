-- integrator ; used as an envelope
let i = lfPulse ar 3 0.2 0.0004
    o = sinOsc ar 700 0 * 0.1
in integrator i 0.999 * o
