// https://twitter.com/redFrik/status/1467507942664646661
var b = (1..8).rotate(6);
var fb1 = { arg freq; FBSineC.ar(freq, 1, 0.1, 1.1, 0.5, 0.1, 0.1) };
var d = fb1.value(b / 12) > 0 / 80 + 1.051;
var c = fb1.value(1 / b) + 1;
var p = FBSineC.ar(
	999 * b,
	2 ** fb1.value(b / 9) * 4 - 1,
	fb1.value(b / 8) / 2 + 1 + (99 ** fb1.value(1 / 4) / 99),
	d,
	fb1.value(1 / b) / 40 + 0.1,
	0.1,
0.1);
var q = FBSineC.ar(
	fb1.value(27 + b) > 0 + 2 + b * d * 1400,
	2,
	c,
	c / 2,
	2,
	2,
	0.1
);
Splay.ar(
	3 ** fb1.value(1 / b) / 5 * p + (q / 12) + (HPF.ar(fb1.value(32) < 0, 3) * fb1.value(b * 70 / d) * fb1.value(1 / 2))
) / 2
