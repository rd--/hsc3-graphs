// https://sonomu.club/@lukiss/112280811322923333
var f = [77, 777, 7777];
var a = (GbmanL.ar(f, 1.2, 2.1).sin + 1 * 2).ceil / 9;
var e = { |f|
	var t = Duty.ar(a, 0, a, 0);
	Env.perc(0.001, t, 1, -4).ar(0, TDuty.ar(t, 0, 1, 0, 0))
};
Splay.ar(
	SinOsc.ar(f, 0) * (e.value(f / 7) ** [2, 6, 10]) * [1, 1 / 3, 1 / 9],
	SinOsc.ar((e.value(7) * 7), 0)
).flop.sum
