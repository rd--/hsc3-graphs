-- birdies (jmcc) #6 ; texture=overlap,7,4,4,inf
let p1 = lfPulse kr (0.4 + rand 0 1) 0 (rand 0 0.8 + 0.1) * (rand 0 3 + 4) + 2
    p2 = lfPulse kr (0.4 + rand 0 1) 0 (rand 0 0.8 + 0.1) * (rand 0 3 + 4)
    p3 = lfPulse kr (0.2 + rand 0 0.5) 0 0.4 * 0.02
    sw = lfSaw kr (p1 + p2) 0 * (- (1000 + rand 0 800)) + (4000 + rand2 1200)
    freq = lag sw 0.05
    amp = lag p3 0.3
in pan2 (sinOsc ar freq 0 * amp) (rand2 1) 1
