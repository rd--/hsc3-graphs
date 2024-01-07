(* Berlin 1977 (Jmcc) #4 ; event control *)
Voicer(1, 16) { :e |
	let freq = (e.x * 24 + 48).MidiCps;
	let env = Decay2(Trig(e.w, 0.001), 0.05 * e.y, 2 * e.y);
	let amp = env * e.z + 0.02;
	let filt = env * (FSinOsc(0.17, 0) * 800) + 1400;
	let pw = SinOsc(0.08, [0, 0.5 * pi]) * 0.45 + 0.5;
	let s = Pulse(freq, pw) * amp;
	CombC(Rlpf(s, filt, 0.15), 0.2, [0.2, 0.17], 1.5) * LagUd(e.w, 0, 2 + e.y)
}.Mix
