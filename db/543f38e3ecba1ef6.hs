-- noise burst sweep (jmcc) #6 ; texture=overlap,4,2,4,inf ; id
let n = mce2 (whiteNoiseId 'α' ar) (whiteNoiseId 'β' ar)
    lfoRate = randId 'γ' (-1) 1 + mouseX kr 10 60 Exponential 0.2
    amp = max 0 (lfSaw kr lfoRate (-1))
    cfreq = mouseY kr 400 8000 Exponential 0.2
    freq = sinOsc kr 0.2 0 * cfreq + (1.05 * cfreq)
in resonz (n * amp) freq 0.1
