-- event ; p+px=freq
let f (_,w,_,_,_,_,_,_,p,px,_) = sinOsc ar (midiCps (p * 127 + px)) 0 * w
in mix (voicer 16 f) * control kr "gain" 0.1
