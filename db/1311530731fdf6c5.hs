-- decay2 ; used as an envelope
let s = fSinOsc ar 600 0 * 0.25 -- sinOsc ar 11000 0 * 0.25
    f = xLine kr 1 50 20 RemoveSynth
in decay2 (impulse ar f 0) 0.01 0.2 * s
