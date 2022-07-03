-- rlpf ; event control
let f (_,g,_,y,z,o,rx,ry,p,_,_) =
      let f0 = unitCps p
          f1 = f0 * 0.5 * (1 + y * 6)
          rq = linLin (rx * ry) 0 0.25 0.1 0.6
      in pan2 (rlpf (lfTri ar f0 0) f1 rq) (o * 2 - 1) (lagUD g 0.05 (2 - y) * (2 - y) * z)
in mix (voicer 16 f) * control kr "gain" 0.25
