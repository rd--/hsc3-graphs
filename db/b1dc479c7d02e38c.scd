// https://sonomu.club/@lukiss/113012278480517510 ; Aug 24, 2024, 02:28
var p = (1, 3 .. 64);
var r = 2 ** (Logistic.ar(3.9, 3, 0.5) + 1 * 2.1).floor;
var e = Linen.kr(TDuty.kr(1 / r, 0, 1, 0, 0), 0, 1, 0.9 / r, 0);
Splay.ar(
	Blip.ar(
		73 * p * p.degrad,
		Blip.ar(r / p, 0) + 1 / 2 ** 2 * 33
	).sin * ((1 - e * p).log.sin.sin ** (Blip.ar(0.1 / r, 0) + 2 * 2)).sanitize * (e > 0.1),
	Blip.ar(r, 0.1)
)
