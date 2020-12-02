-- decay2 ; compare with decay used as the envelope
let s = fSinOsc AR 600 0 * 0.25
    f = xLine KR 1 50 20 RemoveSynth
in decay (impulse AR f 0) 0.2 * s
