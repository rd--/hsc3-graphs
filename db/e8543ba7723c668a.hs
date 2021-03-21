-- blip ; event control
let f _ (g,x,y,z,o,_,_,_,_,_) = pan2 (blip AR (midiCPS (x * 13 + 48)) (y * 10 + 1)) (o * 2 - 1) (g * z)
in mix (rEventVoicer 16 f) * control KR "gain" 0.5
