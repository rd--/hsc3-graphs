-- blitB3Tri ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCPS (x * 12 + 48)
      in pan2 (X.blitB3Tri AR freq (1 - (rx * 0.05)) y) (o * 2 - 1) (z * g)
in mix (rEventVoicer 16 f) * control KR "gain" 0.25