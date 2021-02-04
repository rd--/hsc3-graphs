-- rBezier ; event control
let f _ (g,_,y,z,o,rx,ry,p) =
      let w i l r = linLin i 0 1 l r
          s = X.rBezier AR 20 0.004 (midiCPS p) 0 (mce [0,0,w y 0.05 0.25,-1.3,w rx 0.25 0.45,-1.3
                                                         ,0.5,0,w ry 0.55 0.75,1.3,w o 0.75 0.95,1.3
                                                         ,1,0])
      in pan2 s (o * 2 - 1) (z * lagUD g 0 1)
in mix (rEventVoicer 16 f) * control KR "gain" 0.5
