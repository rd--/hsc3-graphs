// 12 Juli 2019 ; https://github.com/lukiss/Losers-Union-SC-Research
var f = { | freq mul |
	var z = LFDNoise3.kr(freq) * mul;
	z.ring1(z % 0.01).hypot(z)
};
var o = Formant.ar(
	f.(f.(3, 13), 220),
	f.(f.(2, 10), f.(f.(3, 13), 2320)),
	f.(f.(3, 5), 2500)
);
var a = {
	f.(f.(2, 12), 1).excess(f.(f.(1, 14), f.(4.4, 0.5) + 0.3))
} ! 2;
(o * a).softclip
