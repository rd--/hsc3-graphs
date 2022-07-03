-- lpf ; event control
let f (_,g,_,y,z,o,_,_,p,_,_) =
      let f0 = unitCps p
      in pan2 (lpf (blip ar f0 (1 + y * 5)) (f0 * 0.25)) (o * 2 - 1) (lagUD g 0.05 1 * z)
in mix (voicer 16 f) * control kr "gain" 4
