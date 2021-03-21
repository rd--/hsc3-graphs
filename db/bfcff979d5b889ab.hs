-- hell is busy (jmcc) #1 ; event control
let f _ (g,x,y,z,o,rx,_,_,_,_) =
      let s1 = fSinOsc AR (400 + x * 2000) 0
          s2 = lfPulse KR (1 + y * 10) 0 (rx * 0.7)
      in pan2 (s1 * s2 * 0.35) (o * 2 - 1) (z * g)
in mix (rEventVoicer 16 f) * control KR "gain" 1
