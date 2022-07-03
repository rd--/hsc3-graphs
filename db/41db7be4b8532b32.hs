-- event ; o=freq ; 0-1 = partial range
let f (_,g,_,_,_,o,_,_,_,_,_) = sinOsc ar (midiCps (o * 24 + 48)) 0 * g
in mix (voicer 16 f) * control kr "gain" 0.1
