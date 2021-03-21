-- lpf ; event control
let f _ (g,_,y,z,o,rx,ry,p,_,_) =
      let f0 = midiCPS p
      in pan2 (lpf (blip AR f0 (1 + y * 5)) (f0 * 0.25) * 4) (o * 2 - 1) (lagUD g 0.05 1 * z)
in mix (rEventVoicer 16 f) * control KR "gain" 2
