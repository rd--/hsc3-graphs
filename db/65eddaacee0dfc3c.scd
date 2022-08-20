// Sequencer ; jmcc
var clock = Impulse.kr(XLine.kr(24, 1, 12), 0);
var x = SinOsc.ar(Sequencer.kr(Dwhite.dr(2000, 12000, inf), clock), 0) * Decay2.kr(clock, 0.002, 0.04);
{ CombN.ar(x, 0.1, { ExpRand(0.02, 0.05) }.dup(2), 2) * Line.kr(0.2, 0, 12) }.dup(2).sum