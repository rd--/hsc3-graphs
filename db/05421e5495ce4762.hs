-- bufWr
let b = localBufId 'α' 1 (sampleRate * 2)
    o = sinOsc ar (lfNoise1Id 'β' kr 2 * 300 + 400) 0 * 0.1
    ph z = phasor ar 0 (bufRateScale kr b * z) 0 (bufFrames kr b) 0
    w = bufWr b (ph (mouseX kr 0.25 1 Linear 0.2)) Loop o
    r = bufRdL 1 ar b (ph (mouseY kr 0.25 16 Linear 0.2)) Loop
in mrg2 r w
