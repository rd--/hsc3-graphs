-- rdx7 ; event control ; data at shared buffer
let f _ (g,x,_,z,o,_,_,p) =
      let buf = control KR "buf" 100
          vc = control KR "vc" 0
          x0 = latch x g
      in pan2 (X.rdx7 AR buf g 0 0 vc p (z * 99) (0x2000 * (x - x0)) 0 0 0) (o * 2 - 1) 1
in mix (rEventVoicer 16 f) * control KR "gain" 1
