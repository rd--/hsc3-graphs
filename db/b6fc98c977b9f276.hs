-- dx7 ; event control ; data at shared buffer
let f (_,g,x,_,z,o,_,_,p,_,_) =
      let buf = control kr "buf" 400
          vc = control_m kr "vc" 0 (0,31,"lin")
          x0 = latch x g
          pw = 0x2000 * (1 + (x - x0) * 2)
          s = X.dx7 ar buf g 0 0 vc (p * 127) (z * 99) pw 0 0 0
      in pan2 s (o * 2 - 1) 1
in mix (voicer 16 f) * control_m kr "gain" 1 (0,4,"amp")
