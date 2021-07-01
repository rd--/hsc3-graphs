-- bufRd ; requires=buf ; fixed frequency wavetable oscillator ; c.f. osc
let nc = 1
    b = control kr "gen" 0
    x = mouseX kr 220 440 Exponential 0.2
    phase = linLin (lfSaw ar x 0) (-1) 1 0 1 * bufFrames kr b
in bufRdC nc ar b phase Loop * 0.1
