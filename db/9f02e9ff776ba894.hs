-- phasor ; audio rate oscillator as phase input to bufRd ; requires=buf (non-wavetable format)
let (b, nc) = (control kr "buf" 0, 2)
    f = 440
    fr = bufFrames kr b
    rt = f * (fr / sampleRate)
    ph = phasor ar b (rt * bufRateScale kr b) 0 fr 0
in bufRdL nc ar b ph Loop * 0.1
