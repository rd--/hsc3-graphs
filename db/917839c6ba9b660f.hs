-- decay2 ; compare with decay used as the envelope
let s = fSinOsc ar 600 0 * 0.25
    f = xLine kr 1 50 20 RemoveSynth
in decay (impulse ar f 0) 0.2 * s
