-- uplink (jmcc) #2 ; texture=overlap,4,1,5,inf ; id
let f z _ = let p0 = lfPulse kr (rand0Id (z,'α') 20) 0 (rand0Id (z,'β') 1)
                p1 = lfPulse kr (rand0Id (z,'γ') 4) 0 (rand0Id (z,'δ') 1) * rand0Id (z,'ε') 8000 + rand0Id (z,'ζ') 2000
            in p0 * p1
in pan2 (lfPulse ar (mixFill_z 'η' 2 f) 0 0.5 * 0.04) (randId 'θ' (-0.8) 0.8) 1
