-- moogLadder ; event control
let f _ (g,_,y,z,o,rx,ry,p) =
      let f0 = midiCPS p
          f1 = f0 * (1 + y * 8)
          res = rx + ry
          env = lagUD g 0.05 (2 - y * 2) * (2 - y) * z
      in pan2 (X.moogLadder (lfSaw AR f0 0) f1 res) (o * 2 - 1) env
in mix (rEventVoicer 16 f) * control KR "gain" 1
