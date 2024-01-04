(* TRand ; Jmcc/Rd *)
var clock = Impulse(16, 0);
var x = SinOsc(TRand(2000, 12000, clock), 0) * Decay2(clock, 0.002, 0.04);
CombN(x, 0.2, { Rand(0.04, 0.2) } ! 2, 2) * XLine(0.2, 0.001, 9)
