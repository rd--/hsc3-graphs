-- resonz ; pinkNoise ; event control
let f (_,g,_,y,z,o,_,_,p,_,_) =
      pan2 (resonz (pinkNoise ar) (unitCps p) (y * 0.25) * 24) (o * 2 - 1) (z * g)
in mix (voicer 16 f) * control kr "gain" 1
