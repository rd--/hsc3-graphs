-- event ; p=freq
let f _ (g,_,_,_,_,_,_,p,_,_) = sinOsc ar (midiCps p) 0 * g
in mix (eventVoicer 16 f) * control kr "gain" 0.1
