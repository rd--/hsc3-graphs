{- Sos -}
Voicer(1, 16) { :e |
	let freq = (e.x * 25 + 48).MidiCps;
	let rq = 0.002 + (e.y * 0.004);
	let b1 = 1.987 * 0.9889999999 * 0.09.cos;
	let b2 = -0.998057;
	let im = Decay(Trig1(K2A(e.w), SampleDur()), 0.1);
	let s1 = Sos(im, 0.3, 0.0, 0.0, b1, b2);
	let s2 = Rhpf(s1 * 0.8, freq, rq);
	let s3 = s2 + DelayC(Rhpf (s1 * 0.9, freq * 0.99999, rq * 0.999), 0.02, 0.01223);
	let s4 = Decay2(s3, 0.4, 0.3) * s2;
	EqPan2(s4, e.i * 2 - 1) * e.z * 0.25
}.Mix
