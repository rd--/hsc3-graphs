-- analogSnareDrum ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCPS (x * 25 + 36)
          tr = trig g controlDur
          sig = X.analogSnareDrum AR tr 0 z freq y rx (ry * 2)
      in pan2 sig (o * 2 - 1) (lagUD g 0 2)
in mix (eventVoicer 16 f) * control KR "gain" 0.25
