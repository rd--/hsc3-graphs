/* https://sonomu.club/@lukiss/113424886949750691 ; Nov 05, 2024, 12:20 AM */
var o = SinOsc.ar(440, 0);
(0 .. 4).do { |n|
	o = SinOsc.ar(
		SinOsc.ar(o ** n, o).exprange(0.01, 1.0) ** n,
		SinOsc.ar(o + 1 ** n.nthPrime, 0) * pi
	)
};
o ! 2 / 3
