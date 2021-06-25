-- event ; p=freq
let f _ (g,_,_,_,_,_,_,p,_,_) = sinOsc AR (midiCPS p) 0 * g
in mix (eventVoicer 16 f) * control KR "gain" 0.1
