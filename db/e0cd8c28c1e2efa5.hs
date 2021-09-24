-- aleatoric quartet (jmcc) #7
let base_mn = 66 -- control kr "note" 66
    amp = 0.07 -- control kr "amp" 0.07
    density = mouseX kr 0.01 1 Linear 0.1
    dmul = recip density * 0.5 * amp
    dadd = amp - dmul
    rapf i = allpassN i 0.05 (mce2 (rand 0 0.05) (rand 0 0.05)) 1
    mk_f _ = let m = lfNoise0 kr (lchoose [1, 0.5, 0.25]) * 7 + base_mn + rand (-30) 30
             in midiCps (lag (roundTo m 1) 0.2)
    mk_s n = let x = pinkNoise ar * max 0 (lfNoise1 kr 8 * dmul + dadd)
             in pan2 (combL x 0.02 (recip (mk_f n)) 3) (rand2 1) 1
    g = iter 5 rapf (mixFill 4 mk_s)
in leakDC g 0.995
