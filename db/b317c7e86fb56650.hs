-- bufRd ; requires=buf ; phasor as phase input ; constructors bufRd{N|L|C} preset interpolation type
let nc = 2
    b = control kr "buf" 0
    tr = impulse ar (recip (bufDur kr b)) 0
    ph = phasor ar tr (bufRateScale kr b) 0 (bufFrames kr b) 0
in bufRdL nc ar b ph NoLoop
