-- sos
let f _ (w,x,y,z,o,_,_,_,_,_) =
      let b1 = linLin y 0 1 1.45 1.998
          b2 = linLin x 0 1 (-0.999) (-0.9998)
      in pan2 (sos (trig (k2a w) 0) 0.0 0.05 0.0 b1 b2) (o * 2 - 1) 8
in mix (eventVoicer 16 f) * control KR "gain" 1
