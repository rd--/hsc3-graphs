-- decay2 ; used as an envelope
let s = fSinOsc AR 600 0 * 0.25 -- sinOsc AR 11000 0 * 0.25
    f = xLine KR 1 50 20 RemoveSynth
in decay2 (impulse AR f 0) 0.01 0.2 * s
