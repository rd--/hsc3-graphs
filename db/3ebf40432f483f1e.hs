-- resonz ; pinkNoise ; event control
let f c (g,_,y,z,o,rx,ry,p) =
      pan2 (resonz (pinkNoise c AR) (midiCPS p) (y * 0.25) * 24) (o * 2 - 1) (z * g)
in mix (rEventVoicer 16 f) * control KR "gain" 1
