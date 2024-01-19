{- Xylophone (Ws) ; event control ; http://scsynth.org/t/4681/ -}
Voicer(1, 16) { :e |
	let freq = e.p.UnitCps;
	let amp = 1;
	let duration = e.y + 1 * 2 * 440 / freq;
	let scaleBy = 5;
	let velocity = (0.1 + e.z).LagUd(0.01, 1);
	let harmonics = [1 4 7 9 13];
	let envVolume = TxLine(1, 0.01, duration, e.w) - 0.01;
	let hDur = (duration / ((1 - scaleBy) + (harmonics * scaleBy))) * velocity;
	let envHarmonics = TxLine(1, 0.01, hDur, e.w) - 0.01;
	let signal = (amp * SinOsc(freq * harmonics, 0) * velocity / harmonics * envHarmonics).Sum;
	EqPan2(signal, e.i * 2 - 1) * envVolume * amp * e.w.LagUd(0, 2)
}.Mix
