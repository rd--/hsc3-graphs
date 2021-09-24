-- event ; p+px=freq
let f _ (w,_,_,_,_,_,_,p,px,_) = sinOsc ar (midiCps (p + px)) 0 * w
in mix (eventVoicer 16 f) * control kr "gain" 0.1
