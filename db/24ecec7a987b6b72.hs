-- bufRd ; requires=buf ; audio rate sine oscillator as phase input
let nc = 2
    b = control kr "buf" 0
    phase = sinOsc ar 0.1 0 * bufFrames kr b * bufRateScale kr b
in bufRdL nc ar b phase Loop
