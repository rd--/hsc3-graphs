;; analog bubbles (jmcc) #1 ; keywords
var o = LfSaw(
	freq: [8, 7.23],
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
	maxdelaytime: 0.2,
	delaytime: 0.2,
	decaytime: 4
) * 0.1 (* echoing sine wave *)
