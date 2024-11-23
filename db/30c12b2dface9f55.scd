// https://sonomu.club/@lukiss/113333974470037868 ; Oct 19, 2024, 11:00 PM
var f = 110;
var o = SinOsc.ar(f, 0);
5.do {
	o = SinOsc.ar(
		f * o.degrad,
		SinOsc.ar(1 + o.ceil * f, 0) * pi
	)
};
o ! 2 / 4
