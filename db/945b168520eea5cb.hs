-- MiRings ; basics ; 2=MODULATED/INHARMONIC_STRING ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let tr = trig1 g controlDur
          md = X.miRings_mode "MODULATED/INHARMONIC_STRING"
      in X.miRings AR 0
         tr (x * 24 + 36) (0.25 + latch o tr * 0.15) (0.25 + y * 0.5) (0.7 - latch rx tr * 0.15) (0.25 + latch ry tr * 0.15)
         md 1 0 0 0 * z
in mix (eventVoicer 16 f) * control KR "gain" 2
