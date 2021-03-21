-- rEvent ; p=freq z=amp
let f _ (g,_,_,z,_,_,_,p,_,_) = sinOsc AR (midiCPS (p + 12)) 0 * g * z
in mix (rEventVoicer 16 f) * control KR "gain" 1.0
