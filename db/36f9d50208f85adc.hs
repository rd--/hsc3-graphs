-- strummable silk (jmcc) #11 ; event control
let f (_,g,_,y,z,o,_,_,p,_,_) =
      let n = 15
          e = decay (impulse ar (linExp y 0 1 11 19) 0 * (z * 2 + lag (trig g 1) 0.2) * 0.04) 0.04
          plk = pinkNoise ar * e
          freq = mce (map ((*) (unitCps p)) [1 .. constant n + 1])
          param = klankSpec_mce freq (mce (replicate n 1)) (X.randN n 0.3 1)
      in pan2 (dynKlank plk 1 0 1 param) (o * 2 - 1) z
    r_allpass i = allpassN i 0.1 (X.randN 2 0 0.05) 4
in iter 6 r_allpass (leakDC (lpf (mix (voicer 16 f)) 12000) 0.995) * control kr "gain" 1
