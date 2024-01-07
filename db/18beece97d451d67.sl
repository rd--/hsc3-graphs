(* jj ; bohlen-pierce ; texture graph variant *)
{ :tr |
	let f = { :x |
		3 ^ (TRand(0, 17, tr) / 13) * x
	};
	let e = Perc(tr, 0.01, 1, -4) * 0.1;
	PmOsc(f([438, 442]), f(880), f(e), 0) * e
}.OverlapTexture(1 / 3, 0, 4).Mix
