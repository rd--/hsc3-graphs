-- uplink (jmcc) #2 ; texture=overlap,4,1,5,inf
let f _ = let p0 = lfPulse kr (rand0 20) 0 (rand0 1)
              p1 = lfPulse kr (rand0 4) 0 (rand0 1) * rand0 8000 + rand0 2000
          in p0 * p1
in pan2 (lfPulse ar (mixFill 2 f) 0 0.5 * 0.04) (rand (-0.8) 0.8) 1
