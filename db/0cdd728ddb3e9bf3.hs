-- phasor ; as phase input to bufRd
let b = control kr "buf" 0
    ph = phasor ar 0 (bufRateScale kr b) 0 (bufFrames kr b) 0
in bufRd 1 ar b ph Loop NoInterpolation
