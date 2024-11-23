/* https://sonomu.club/@lukiss/113424886949750691 ; Nov 05, 2024, 12:20 AM */
let o = SinOsc(440, 0);
(0 .. 4).do { :n |
	o := SinOsc(
		SinOsc(o ^ n, o).LinExp(-1, 1, 0.01, 1) ^ n,
		SinOsc(o + 1 ^ (n + 1).nthPrime, 0) * pi
	)
};
o ! 2 / 3
