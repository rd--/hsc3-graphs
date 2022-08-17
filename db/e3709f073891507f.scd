// RLPF
var freq = Demand.kr(
	Impulse.kr(0.25, 0),
	0,
	Dseq.dr([27, 24, 22, 24] + 2, inf)
).midicps + [0, 0.3];
RLPF.ar(LFPulse.ar(freq, 0, 0.2) * 0.4 - 0.2, 300, 0.5)
