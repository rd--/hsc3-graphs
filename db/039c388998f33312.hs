-- event ; p+px=freq ; z*z=ampl ; w=gate
let f (_,w,_,_,z,_,_,_,p,px,_) = sinOsc ar (midiCps (p * 127 + px)) 0 * w * z * z * 4
in mix (voicer 16 f) * control kr "gain" 1
