-- stkPluck ; rand param ; texture=spawn,1,inf
let freq = midiCPS (iRand 'α' 32 96)
    decay_ = rand 'β' 0.95 0.99
    s = leakDC (X.stkPluck AR freq decay_) 0.995
in mrg2 s (detectSilence s 0.001 0.5 RemoveSynth)
