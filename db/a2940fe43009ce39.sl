{- http://sccode.org/1-4Qy (F0) ; 0101 ; graph variant (rd) -}
let d = [0 9 17 24 30 35 39 42 44];
1:9.collect { :c |
	let a = DelayN(InFb(2, 0), 1, 1);
	let o = SinOsc(c + 1 * 99 + [0, 2], a.reversed) / 4;
	DelayN(o * LinSeg(Impulse(1 / 45, 0), [1, 9 - c + 16, 0]), d[c], d[c])
}.Mix
