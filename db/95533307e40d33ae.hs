-- strummable guitar (jmcc) #11 ; event control
let f _ (g,_,y,z,o,_,_,p,_,_) =
      let e = decay (trig g controlDur) 0.05
          n = pinkNoise ar * e
          dt = 1 / midiCPS p
          s = combL n dt dt ((y + 1) * 3)
      in pan2 s (o * 2 - 1) (0.5 + latch z g)
in leakDC (lpf (mix (eventVoicer 16 f)) 12000) 0.995 * control kr "gain" 1
