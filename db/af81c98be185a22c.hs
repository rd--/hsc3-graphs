-- phasor ; as phase input to bufRd
let b = control KR "buf" 0
    ph = phasor AR 0 (bufRateScale KR b) 0 (bufFrames KR b) 0
in bufRdN 1 AR b ph Loop
