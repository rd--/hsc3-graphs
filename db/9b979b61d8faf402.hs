-- data space (jmcc) #2 ; texture=overlap,1,6,4,inf
let p0 = lfPulse kr (rand0 200) 0 (rand0 1)
    p1 = lfPulse kr (rand0 40) 0 (rand0 1) * rand0 8000 + rand0 2000
    p2 = lfPulse kr (rand0 20) 0 (rand0 1)
    p3 = lfPulse kr (rand0 4) 0 (rand0 1) * rand0 8000 + rand0 2000
    p4 = lfPulse kr (rand0 20) 0 (rand0 1)
    p5 = lfPulse kr (rand0 4) 0 (rand0 1) * rand0 8000 + rand0 2000
    f = p0 * p1 + p2 * p3 + p4 * p5
    dt = rand 0.15 0.35
    o = lfPulse ar f 0 0.5 * 0.04
    l = lfNoise0 kr (rand0 3) * 0.8
in combL (pan2 o l 1) dt dt 3
