-- event ; x=freq ; 0-1 = partial range ; i.e. small touch controller
let f _ (g,x,_,_,_,_,_,_,_,_) = sinOsc AR (midiCPS (x * 24 + 48)) 0 * g
in mix (eventVoicer 16 f) * control KR "gain" 0.1
