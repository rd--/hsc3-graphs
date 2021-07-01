-- lpf
let f = xLine kr 0.7 300 20 RemoveSynth
    ff = fSinOsc kr f 0 * 3600 + 4000
in lpf (saw ar 200 * 0.1) ff
