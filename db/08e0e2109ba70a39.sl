/* 12 Juli 2019 ; https://github.com/lukiss/Losers-Union-SC-Research ; rd edit */
let f = { :freq :mul |
	let z = LfdNoise3(freq) * mul;
	z.Ring1(z % 0.01).Hypot(z)
};
let o = Formant(
	f(f(3, 13), 220),
	f(f(2, 10), f(f(3, 13), 2320)),
	f(f(3, 5), 2500)
);
let a = Excess(
	f(f(2, 12), 1),
	f(f(1, 14), f(4.4, 0.5) + 0.3)
);
(o * a).EqPan2(0).SoftClip
