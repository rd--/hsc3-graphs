-- rdx7 ; event control ; data at shared buffer
let f _ (g,x,_,z,o,_,_,p,_,_) =
      let buf = control KR "buf" 100
          vc = control_m KR "vc" 0 (0,31,"lin")
          x0 = latch x g
          pw = 0x2000 * (1 + (x - x0) * 2)
          s = X.rdx7 AR buf g 0 0 vc p (z * 99) pw 0 0 0
      in pan2 s (o * 2 - 1) 1
in mix (rEventVoicer 16 f) * control_m KR "gain" 1 (0,4,"amp")
