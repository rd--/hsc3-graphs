-- blip ; event control
let f _ (g,_,y,z,o,_,_,p) = pan2 (blip AR (midiCPS p) (y * 10 + 1)) (o * 2 - 1) (g * z)
in mix (rEventVoicer 16 f) * control KR "gain" 0.5
