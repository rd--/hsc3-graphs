-- event ; c=freq ; harmonics of A2
let f (c,g,_,_,_,_,_,_,_,_,_) = sinOsc ar (110 * (constant c + 1)) 0 * g
in mix (eventVoicer 16 f) * control kr "gain" 0.05
