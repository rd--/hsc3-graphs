(* <https://twitter.com/redFrik/status/1452954849885163525> ; f0 *)
var i = Rand(1, 64);
var x = (SinOsc(i % 9.33, 0) * 5 + 5).Ceiling;
var t = SinOsc(2 ^ (i % 11) * 150 / x, 0);
var y = Hpz1(x).Abs > 0;
var f = LinExp(t, -1, 1, Latch(LinExp(SinOsc(i % 4.4, 0), -1, 1, 9, 999), y), Latch(LinExp(SinOsc(i % pi, 0), -1, 1, 99, 9000), y));
EqPan(
	Blip(f, t + 2) * (1 - t),
	SinOsc(0.1, i)
) * (Line(0.2, 0, 9).Min(0.6) ^ 2)