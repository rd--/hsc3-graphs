(* analog bubbles (jmcc) #1 ; requires=keywords *)
var o = LfSaw(
	freq: [8 7.23],
	iphase: 0
) * 3 + 80;
var m = LfSaw(
	freq: 0.4,
	iphase: 0
) * 24 + o; (* glissando function *)
var s = SinOsc(
	freq: m.MidiCps,
	phase: 0
) * 0.04;
CombN(
	in: s,
	maxDelayTime: 0.2,
	delayTime: 0.2,
	decayTime: 4
) * 0.1 (* echoing sine wave *)
