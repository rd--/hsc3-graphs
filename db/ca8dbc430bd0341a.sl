(* More bells *)
var env = Decay2(Dust(1 / 3), 0.01, 2) * 0.1;
var osc = SinOsc({ Rand(300, 1200) } ! 12, 0);
Pan2(osc, { 1.Rand2 } ! 12, env).Mix
