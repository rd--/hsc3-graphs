-- bufRd ; requires=buf ; audio rate sine oscillator as phase input
let (buf, nc) = (control kr "buf" 100, 2)
    phase = sinOsc ar 0.1 0 * bufFrames kr buf * bufRateScale kr buf
in bufRdL nc ar buf phase Loop
