-- bufWr
let wr_rt = control kr "wr-rate" 1
    rd_rt = control kr "rd-rate" 1
    b = localBufId 'α' 1 (sampleRate * 2)
    o = sinOsc ar (lfNoise1Id 'β' kr 2 * 300 + 400) 0 * 0.1
    w = bufWr b (phasor ar 0 (bufRateScale kr b * wr_rt) 0 (bufFrames kr b) 0) Loop o
in bufRdL 1 ar b (phasor ar 0 (bufRateScale kr b * rd_rt) 0 (bufFrames kr b) 0) Loop
