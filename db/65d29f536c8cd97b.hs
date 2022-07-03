-- event ; p=freq ; p is a pitch value in (0,1) calculated by the control input system
let f (_,g,_,_,_,_,_,_,p,_,_) = sinOsc ar (unitCps p) 0 * g
in mix (voicer 16 f) * control kr "gain" 0.1
