// LFO modulation of Pulse waves and resonant filters ; jmcc
CombL.ar(
	RLPF.ar(LFPulse.ar(FSinOsc.kr(0.05,0,80,160),0,0.4,0.05),
		FSinOsc.kr([0.6,0.7],0,3600,4000), 0.2),
	0.3, [0.2,0.25], 2)
