-- lpf
let f = xLine KR 0.7 300 20 RemoveSynth
    ff = fSinOsc KR f 0 * 3600 + 4000
in lpf (saw AR 200 * 0.1) ff
