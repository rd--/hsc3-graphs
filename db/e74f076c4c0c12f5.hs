-- event ; x=freq ; 0-1 = full range ; i.e. mpe controller or large touch controller
let f _ (g,x,_,_,_,_,_,_,_,_) = sinOsc AR (midiCPS (x * 127)) 0 * g
in mix (eventVoicer 16 f) * control KR "gain" 0.1
