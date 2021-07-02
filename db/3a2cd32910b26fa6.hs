-- strummable silk (jmcc) #11 ; id
let x = mouseX kr 0 1 Linear 0.2
    strummable_guitar_str (ix,z) =
      let n = 15
          k = constant ix
          tr = abs (hpz1 (x `greater_than` (0.25 + k * 0.07)))
          e = decay (impulse ar 14 0 * lag (trig tr 1) 0.2 * 0.01) 0.04
          freq0 = midiCPS (([-2,0,3,5,7,10,12,15] !! ix) + 60)
          freq = mce (map ((*) freq0) [1 .. constant n + 1])
          param = klankSpec_mce freq (mce (replicate n 1)) (X.rRandNId n z 0.3 1)
      in pan2 (klank (pinkNoiseId z ar * e) 1 0 1 param) (k * 0.2 - 0.5) 1
    strs = sum (map strummable_guitar_str (zip [0..7] ['α'..]))
    r_allpass z i = allpassN i 0.1 (X.rRandNId 2 (z,'ζ') 0 0.05) 4
    rev = useqId 'λ' 6 r_allpass
in rev (leakDC (lpf strs 12000) 0.995)
