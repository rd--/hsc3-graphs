/* Clustered sines (Jmcc) #2 ; Graph rewrite */
let n = 80;
{ :tr |
	let f1 = TRand(100, 1100, tr);
	let f2 = 4.0 * f1;
	{
		{
			let y = f1 + TRand(0, f2, tr);
			SinOsc(y, 0) * f1 / y
		} !+ n
	} ! 2 * 0.1 / n
}.OverlapTexture(4, 4, 3).Mix
