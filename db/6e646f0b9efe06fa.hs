-- event ; y=freq ; 0-1 = partial range
let f _ (g,_,y,_,_,_,_,_,_,_) = sinOsc ar (midiCPS (y * 24 + 48)) 0 * g
in mix (eventVoicer 16 f) * control kr "gain" 0.1
