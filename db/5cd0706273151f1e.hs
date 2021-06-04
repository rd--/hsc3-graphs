-- uplink (jmcc) #2 ; texture=overlap,4,1,5,inf
let f z _ = let p0 = lfPulse KR (rand0 (z,'α') 20) 0 (rand0 (z,'β') 1)
                p1 = lfPulse KR (rand0 (z,'γ') 4) 0 (rand0 (z,'δ') 1) * rand0 (z,'ε') 8000 + rand0 (z,'ζ') 2000
            in p0 * p1
in pan2 (lfPulse AR (mixFill_z 'η' 2 f) 0 0.5 * 0.04) (rand 'θ' (-0.8) 0.8) 1