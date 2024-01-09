// https://twitter.com/redFrik/status/1374139774269857798
var b = #[1, 0.5, 1.25];
var c = SinOscFB.ar(3, 0) > 0;
var x = SinOscFB.ar(
	SinOscFB.ar(1 / 64, 0) < 0 * 9 + 50,
	SinOscFB.ar(1 / 8, 0) + 1 / 2
) * HPF.ar(c, 4) * 5 ! 2;
var sq = Dseq(#[1, 1, 2, 3, 4, 1] * (SinOscFB.ar(1 / 96, 0) < 0.5 * 19 + 99), inf);
var f0 = Lag3UD.ar(Demand.ar(SinOscFB.ar(1 / 12, 0), 0, sq * b), 1, 3);
var y = Splay.ar(SinOscFB.ar(f0, SinOscFB.ar(b / 16, 0) + 1 / 3));
var z = HPF.ar(c > 0.1, 9 ** SinOscFB.ar(1 / 19, 0) + 3) * SinOscFB.ar(#[12, 9] * 99, 0) / 6;
tanh(x + y + z) * 0.1
