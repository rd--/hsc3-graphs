-- rEvent ; x=freq y=amp ; 0-1 = partial range
let f _ (g,x,y,_,_,_,_,_,_,_) = sinOsc AR (midiCPS (x * 12 + 48)) 0 * y * lagUD g 0.05 1
in mix (rEventVoicer 16 f) * control KR "gain" 0.2
