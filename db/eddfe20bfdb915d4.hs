-- rEvent ; x=freq z=amp ; 0-1 = partial range ; 24ET
let f _ (g,x,_,z,_,_,_,_) = sinOsc AR (midiCPS ((x * 12 + 48) `roundTo` 0.5)) 0 * z * g
in mix (rEventVoicer 16 f) * control KR "gain" 0.5
