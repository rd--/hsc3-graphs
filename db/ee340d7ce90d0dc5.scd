// TRand ; Jmcc/Rd
var clock = Impulse.kr(16, 0);
var x = SinOsc.ar(TRand.kr(2000, 12000, clock), 0) * Decay2.kr(clock, 0.002, 0.04);
CombN.ar(x, 0.2, { Rand(0.04, 0.2) } ! 2, 2) * Line.kr(0.2, 0, 4)
