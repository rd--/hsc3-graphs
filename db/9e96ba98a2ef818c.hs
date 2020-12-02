-- phasor ; audio rate oscillator as phase input to bufRd
let b = control KR "buf" 0
    f = 440
    fr = bufFrames KR b
    rt = f * (fr / sampleRate)
    ph = phasor AR b (rt * bufRateScale KR b) 0 fr 0
in bufRdL 1 AR b ph Loop * 0.1
