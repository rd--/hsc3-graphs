-- bufRd ; fixed frequency wavetable oscillator ; c.f. osc
let (buf, nc) = (asLocalBuf (Gen.sine1_nrm 256 [1, 1/2, 1/3, 1/4, 1/5]), 1)
    x = mouseX kr 220 440 Exponential 0.2
    phase = linLin (lfSaw ar x 0) (-1) 1 0 1 * bufFrames kr buf
in bufRdC nc ar buf phase Loop * 0.1
