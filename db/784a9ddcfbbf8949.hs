-- bufWr
let wr_rt = control KR "wr-rate" 1
    rd_rt = control KR "rd-rate" 1
    b = localBuf 'α' 1 (sampleRate * 2)
    o = sinOsc AR (lfNoise1 'β' KR 2 * 300 + 400) 0 * 0.1
    w = bufWr b (phasor AR 0 (bufRateScale KR b * wr_rt) 0 (bufFrames KR b) 0) Loop o
in bufRdL 1 AR b (phasor AR 0 (bufRateScale KR b * rd_rt) 0 (bufFrames KR b) 0) Loop
