-- bufRd ; requires=buf ; fixed frequency wavetable oscillator ; c.f. osc
let nc = 1
    b = control KR "gen" 0
    x = mouseX KR 220 440 Exponential 0.2
    phase = linLin (lfSaw AR x 0) (-1) 1 0 1 * bufFrames KR b
in bufRdC nc AR b phase Loop * 0.1
