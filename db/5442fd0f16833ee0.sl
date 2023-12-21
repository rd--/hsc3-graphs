(* PmOsc ; random parameters, linear modulation *)
var dur = 6;
{ :tr |
	var cf = TRand(0, 2000, tr);
	var mf = TRand(0, 800, tr);
	var pme = TRand(0, 12, tr);
	var l1 = TRand(-1, 1, tr);
	var l2 = TRand(-1, 1, tr);
	var l = TLine(l1, l2, dur, tr);
	var pm = TLine(0, pme, dur, tr);
	EqPan2(PmOsc(cf, mf, pm, 0), l)
}.OverlapTexture(2, 2, 4).Mix * 0.05
