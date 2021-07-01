-- formlet ; modulating formant frequency
let s = blip ar (sinOsc kr 5 0 * 20 + 300) 1000 * 0.1
    ff = xLine kr 1500 700 8 RemoveSynth
in formlet s ff 0.005 0.04
