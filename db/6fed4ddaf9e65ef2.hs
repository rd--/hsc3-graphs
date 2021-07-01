-- phasor ; approximation of square wave ; sync ; http://listarc.bham.ac.uk/lists/sc-users/msg69869.html
let freq = mouseX kr 200 4000 Exponential 0.2
    syncFreq = mouseY kr 50 800 Exponential 0.2
    syncSig = sinOsc ar syncFreq 0
    phase = phasor ar syncSig (freq * sampleDur) 0 1 0 * 2 * pi
    k = 12000 * (sampleRate / 48000) / (freq * log10 freq)
    width = sinOsc kr 0.1 0 `in_range` (0,1)
    sinSig = sinOsc ar 0 phase - (width * 2 - 1)
    squareSig = tanh (sinSig * k)
in pan2 (leakDC squareSig 0.995) 0 0.05
