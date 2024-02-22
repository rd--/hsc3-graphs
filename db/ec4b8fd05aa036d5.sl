{- Tw 0014 (F0) ; http://twitter.com/redFrik/status/24193534033 -}
1:9.collect { :i |
	let a0 = SinOscFb(i + 1, 1 / 9) * 999;
	let a1 = SinOscFb(1 / 9, 1) / 9;
	let a2 = SinOscFb(a0, 1 / 9) * a1;
	let a3 = SinOscFb(0.1, 3);
	let a4 = SinOscFb(a2, a3) * (i + 2 * 999);
	let a5 = SinOscFb(1 / 9, 1 / 9);
	SinOscFb(a4, a5) / 9
}.Splay * 0.35
