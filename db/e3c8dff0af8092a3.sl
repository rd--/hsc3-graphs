;; https://sccode.org/1-50L (mk)
var freq = 100;
var rt = 0.5;
var z = { PinkNoise() } ! 2;
var rw = { :f1 :f2 :q |
	4.timesRepeat {
		z := Brf(
			z,
			Rand(f1, f2).RoundTo(10) + (freq * LfNoise1(Rand(0, rt) ! 2)),
			q
		)
	}
};
rw(100, 500, 0.1);
rw(1000, 2500, 0.2);
rw(250, 750, 0.1);
rw(2500, 5000, 0.2);
z := FreqShift(
	z,
	DmdFor(8, 0, Lwhite(inf, -1 * freq * 10, freq * 10).RoundTo(freq / 2)),
	0
) * 0.25 + z;
z := CombC(z, 1, 1, 8);
Lpf(z, LfNoise1(Rand(0, rt) ! 2) * 1250 + 2500)
