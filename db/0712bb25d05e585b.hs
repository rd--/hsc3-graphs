-- MiRings ; basics ; 0=MODAL_RESONATOR ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let tr = trig1 g controlDur
          md = X.miRings_mode "MODAL_RESONATOR"
      in X.miRings AR 0
         tr (x * 24 + 36) (latch o tr * 0.75 + 0.25) (y * 0.65 + 0.15) (0.7 - latch rx tr) (0.25 + latch ry tr)
         md 1 0 0 0 * z
in mix (rEventVoicer 16 f) * control KR "gain" 4