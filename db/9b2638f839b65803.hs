-- rEvent ; c=freq ; harmonics of A2
let f c (g,_,_,_,_,_,_,_) = sinOsc AR (110 * (constant c + 1)) 0 * g
in mix (rEventVoicer 16 f) * control KR "gain" 0.05
