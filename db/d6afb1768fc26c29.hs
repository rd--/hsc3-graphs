-- phasor ; audio rate oscillator as phase input to bufRd
let b = control kr "buf" 0
    f = 440
    fr = bufFrames kr b
    rt = f * (fr / sampleRate)
    ph = phasor ar b (rt * bufRateScale kr b) 0 fr 0
in bufRdL 1 ar b ph Loop * 0.1
