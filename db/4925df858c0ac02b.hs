-- event ; rx=freq ; 0-1 = partial range
let f (_,g,_,_,_,_,rx,_,_,_,_) = sinOsc ar (midiCps (rx * 24 + 48)) 0 * g
in mix (voicer 16 f) * control kr "gain" 0.1
