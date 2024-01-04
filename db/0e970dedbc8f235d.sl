(* Sequencer ; Jmcc *)
var clock = Impulse(XLine(24, 1, 12), 0);
var x = SinOsc(DemandSequencer(Dwhite(inf, 2000, 12000), clock), 0) * Decay2(clock, 0.002, 0.04);
{
	CombN(x, 0.1, { ExpRand(0.02, 0.05) } ! 2, 2) * XLine(0.2, 0.001, 12)
} !+ 2
