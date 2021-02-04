-- rEvent ; ry=freq ; 0-1 = partial range
let f _ (g,_,_,_,_,_,ry,_) = sinOsc AR (midiCPS (ry * 24 + 48)) 0 * g
in mix (rEventVoicer 16 f) * control KR "gain" 0.1
