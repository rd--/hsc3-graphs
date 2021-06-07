-- phasor ; approximation of square wave ; sync ; http://listarc.bham.ac.uk/lists/sc-users/msg69869.html
let freq = mouseX KR 200 4000 Exponential 0.2
    syncFreq = mouseY KR 50 800 Exponential 0.2
    syncSig = sinOsc AR syncFreq 0
    phase = phasor AR syncSig (freq * sampleDur) 0 1 0 * 2 * pi
    k = 12000 * (sampleRate / 48000) / (freq * log10 freq)
    width = sinOsc KR 0.1 0 `in_range` (0,1)
    sinSig = sinOsc AR 0 phase - (width * 2 - 1)
    squareSig = tanh (sinSig * k)
in pan2 (leakDC squareSig 0.995) 0 0.05
