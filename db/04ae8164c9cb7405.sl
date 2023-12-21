(* Decay2 *)
var lfo = SinOsc([1, 11], 0);
var tr = Tr1(lfo);
SinOsc([222, 2222], 0) * Decay2(tr, 0.01, [0.5, 0.1]) * [0.2, 0.1]
