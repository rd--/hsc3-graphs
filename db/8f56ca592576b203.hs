-- phasor ; as phase input to bufRd ; requires=buf
let (b, nc) = (control kr "buf" 0, 2)
    ph = phasor ar 0 (bufRateScale kr b) 0 (bufFrames kr b) 0
in bufRd nc ar b ph Loop NoInterpolation
