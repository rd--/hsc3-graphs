(* LfSaw ; https://scsynth.org/t/6320/2 (nh) ; requires=voicer *)
Voicer(16) { :e |
	var freq = e.p.UnitCps;
	var auto = SinOsc(e.z * 2, 0).Range(1, 1 + e.y);
	var formantTable = [400 1600 2700; 830 1200 4000; 325 600 2530].asLocalBuf;
	var formants = BufRd(3, formantTable, e.y * 3, 1, 2).kr * [1 / auto, auto, auto ^ 0.5];
	var phase = LfSaw(freq, 0).Range(0, 1);
	var snd = (phase * formants / freq * 2 * pi).Sin;
	EqPan2(
		(snd.first + (snd.second.Sign * 0.25)) * e.z * 2 * e.w,
		e.i * 2 - 1
	)
}.Mix
