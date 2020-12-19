-- bufWr
let b = localBuf 'α' 1 (sampleRate * 2)
    o = sinOsc AR (lfNoise1 'β' KR 2 * 300 + 400) 0 * 0.1
    ph z = phasor AR 0 (bufRateScale KR b * z) 0 (bufFrames KR b) 0
    w = bufWr b (ph (mouseX KR 0.25 1 Linear 0.2)) Loop o
    r = bufRdL 1 AR b (ph (mouseY KR 0.25 16 Linear 0.2)) Loop
in mrg2 r w
