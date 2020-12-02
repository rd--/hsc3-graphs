-- bufRd ; requires=buf ; phasor as phase input ; constructors bufRd{N|L|C} preset interpolation type
let nc = 2
    b = control KR "buf" 0
    tr = impulse AR (recip (bufDur KR b)) 0
    ph = phasor AR tr (bufRateScale KR b) 0 (bufFrames KR b) 0
in bufRdL nc AR b ph NoLoop
