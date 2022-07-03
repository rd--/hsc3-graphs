-- event ; x=freq ; 0-1 = full range ; i.e. mpe controller or large touch controller
let f (_,g,x,_,_,_,_,_,_,_,_) = sinOsc ar (midiCps (x * 127)) 0 * g
in mix (voicer 16 f) * control kr "gain" 0.1
