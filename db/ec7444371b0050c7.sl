(* MulAdd ; audio rate with control rate mul and add inputs *)
var ctl = (mul: 0.1, add: 0.05).localControls;
MulAdd(SinOsc(440, 0), ctl::mul, ctl::add)
