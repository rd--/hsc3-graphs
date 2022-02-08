-- bufRd ; requires=buf ; phasor as phase input ; constructors bufRd{N|L|C} preset interpolation type
let (buf, nc) = (control kr "buf" 0, 2)
    tr = impulse ar (recip (bufDur kr buf)) 0
    ph = phasor ar tr (bufRateScale kr buf) 0 (bufFrames kr buf) 0
in bufRdL nc ar buf ph NoLoop
