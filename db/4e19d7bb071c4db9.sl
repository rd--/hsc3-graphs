(* PmOsc ; random parameters, linear modulation *)
let dur = 6;
{ :tr |
	let cf = TRand(0, 2000, tr);
	let mf = TRand(0, 800, tr);
	let pme = TRand(0, 12, tr);
	let l1 = TRand(-1, 1, tr);
	let l2 = TRand(-1, 1, tr);
	let l = TLine(l1, l2, dur, tr);
	let pm = TLine(0, pme, dur, tr);
	EqPan2(PmOsc(cf, mf, pm, 0), l)
}.OverlapTexture(2, 2, 4).Mix * 0.05
