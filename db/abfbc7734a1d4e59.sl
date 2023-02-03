;; Sequencer ; jmcc
var clock = Impulse(XLn(24, 1, 12), 0);
var x = SinOsc(Sequencer(Lwhite(inf, 2000, 12000), clock), 0) * Decay2(clock, 0.002, 0.04);
{ CombN(x, 0.1, { ExpRand(0.02, 0.05) } ! 2, 2) * Ln(0.2, 0, 12) } !+ 2
