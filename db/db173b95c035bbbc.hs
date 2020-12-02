-- bufRd ; requires=buf ; audio rate sine oscillator as phase input
let nc = 2
    b = control KR "buf" 0
    phase = sinOsc AR 0.1 0 * bufFrames KR b * bufRateScale KR b
in bufRdL nc AR b phase Loop
