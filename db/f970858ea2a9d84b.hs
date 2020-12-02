-- formlet ; modulating formant frequency
let s = blip AR (sinOsc KR 5 0 * 20 + 300) 1000 * 0.1
    ff = xLine KR 1500 700 8 RemoveSynth
in formlet s ff 0.005 0.04
