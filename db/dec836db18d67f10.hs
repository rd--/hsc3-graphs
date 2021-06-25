-- event ; p+px=freq
let f _ (w,_,_,_,_,_,_,p,px,_) = sinOsc AR (midiCPS (p + px)) 0 * w
in mix (eventVoicer 16 f) * control KR "gain" 0.1
