/* DelayMap ; Event control */
Voicer(1, 16) { :e |
	let b = LocalBuf(1, 2 * 48000).ZeroBuf;
	let a = [
		-1 e.y 0 0.5
		1.5 -1 0 1
	];
	let f = (e.x * 24 + 48).MidiCps;
	let o = SinOsc(f, 0) * e.z * Lag(e.w, 5);
	[DelayMap(b, o, 0, a), o]
}.Sum
