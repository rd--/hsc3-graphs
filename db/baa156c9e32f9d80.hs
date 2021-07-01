-- resonz ; pinkNoise ; event control
let f c (g,_,y,z,o,_,_,p,_,_) =
      pan2 (resonz (pinkNoiseId c ar) (midiCPS p) (y * 0.25) * 24) (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 1
