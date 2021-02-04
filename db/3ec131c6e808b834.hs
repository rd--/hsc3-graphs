-- strummable silk (jmcc) #11 ; event control
let f c (g,_,y,z,o,_,_,p) =
      let n = 15
          e = decay (impulse AR (linExp y 0 1 11 19) 0 * (z * 2 + lag (trig g 1) 0.2) * 0.04) 0.04
          plk = pinkNoise c AR * e
          freq = mce (map ((*) (midiCPS p)) [1 .. constant n + 1])
          param = klankSpec_mce freq (mce (replicate n 1)) (X.randN n c 0.3 1)
      in pan2 (dynKlank plk 1 0 1 param) (o * 2 - 1) z
    r_allpass i = allpassN i 0.1 (X.randN 2 'ζ' 0 0.05) 4
    rev = Protect.useq_all 'λ' 6 r_allpass
in rev (leakDC (lpf (mix (rEventVoicer 16 f)) 12000) 0.995) * control KR "gain" 1
