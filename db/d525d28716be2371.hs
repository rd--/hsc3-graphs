-- event ; x=freq y=amp ; 0-1 = partial range
let f _ (g,x,y,_,_,_,_,_,_,_) = sinOsc ar (midiCps (x * 12 + 48)) 0 * y * lagUD g 0.05 1
in mix (eventVoicer 16 f) * control kr "gain" 0.2
