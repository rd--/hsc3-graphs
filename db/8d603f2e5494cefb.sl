(* random panning sines (jmcc) #4 *)
{ :tr |
	let n = 8;
	{
		let osc = SinOsc(80 + TRand(0, 2000, tr), 0);
		let pos = LfNoise1(0.4 + TRand(0, 0.8, tr));
		let amp = LfNoise1(0.4 + TRand(0, 0.8, tr)) * 0.4 + 0.5;
		EqPan2(osc, pos) * amp
	} !+ n * 0.1 / n
}.OverlapTexture(8, 8, 2).Mix
