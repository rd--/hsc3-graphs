-- rEvent ; y=freq ; 0-1 = partial range
let f _ (g,_,y,_,_,_,_,_) = sinOsc AR (midiCPS (y * 24 + 48)) 0 * g
in mix (rEventVoicer 16 f) * control KR "gain" 0.1
