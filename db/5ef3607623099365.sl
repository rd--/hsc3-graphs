/* http://sccode.org/1-4Qy (F0) ; 0345 */
0:7.collect { :i |
	let c = SinOsc(8 - i / 8, 0);
	let p = SinOsc(1 + i, 0).Max(c);
	let q = SinOsc(i - 2.1, 0) % SinOsc(9, 1) + (SinOsc(1, 0) > 0 / 3 + 1.83) ^ i + 99;
	let r = SinOsc(q, c + 1 / 4);
	p * r
}.Splay / 2
