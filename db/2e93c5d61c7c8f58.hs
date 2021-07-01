-- phase modulation with slow beats (jmcc) #6 texture=overlap,4,4,4,inf
let x = mouseX kr 100 6000 Exponential 0.2 {- random freq of new events -}
    y = mouseY kr 0 2 Linear 0.2 {- modulation index -}
    ph = iter 3 (\i -> let f = rand 0 x in fSinOsc ar (mce [f,f + rand2 1]) 0 * y + i) 0
    freq = rand 0 x
in sinOsc ar (mce [freq, freq + rand2 1]) ph * 0.1
