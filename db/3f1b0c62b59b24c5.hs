-- rEvent ; z=freq ; 0-1 = partial range
let f _ (g,_,_,z,_,_,_,_) = sinOsc AR (midiCPS (z * 24 + 48)) 0 * g
in mix (rEventVoicer 16 f) * control KR "gain" 0.1
