-- friction ; event control
let f (_,w,x,y,z,o,_,_,_,_,_) =
      let im = trig1 (k2a w) sampleDur * 0.1
          kl = ringz im (x * mce [800, 1071, 1153, 1723]) 1
          ru = X.friction ar kl (y * 0.000175584) 0.414 0.313 2.69789 1.0
      in pan2 (mix ru) (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 1
