/* Phase modulation with slow beats (Jmcc) #6 ; Graph rewrite */
let n = 4;
let x = MouseX(100, 6000, 1, 0.2); /* Controls random frequency of new events */
let y = MouseY(0, 2, 0, 0.2); /* Controls modulation index */
{ :tr |
	let a = 0;
	let f1 = TRand(0, x, tr);
	3.timesRepeat {
		let f2 = TRand(0, x, tr);
		a := SinOsc([f2, f2 + TRand(-1, 1, tr)], 0) * y + a
	};
	SinOsc([f1, f1 + TRand(-1, 1, tr)], a) * 0.1
}.OverlapTexture(4, 4, n).Mix * 0.25
