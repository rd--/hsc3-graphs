/* LfSaw ; https://scsynth.org/t/6320/2 (nh) ; Event control */
Voicer(1, 16) { :e |
	let freq = e.p.UnitCps;
	let auto = SinOsc(e.z * 2, 0).LinLin(-1, 1, 1, 1 + e.y);
	let formantTable = [400 1600 2700; 830 1200 4000; 325 600 2530].asLocalBuf;
	let formants = BufRd(3, formantTable, e.y * 3, 1, 2).kr * [1 / auto, auto, auto ^ 0.5];
	let phase = LfSaw(freq, 0).LinLin(-1, 1, 0, 1);
	let snd = (phase * formants / freq * 2 * pi).Sin;
	EqPan2(
		(snd.first + (snd.second.Sign * 0.25)) * e.z * 2 * e.w,
		e.i * 2 - 1
	)
}.Mix
