;; DmdFor
var f = { :tr :trs |
	var n = Seq(inf, [7, 0, 3, 3, 3, Choose(1, [5, 10, 12]), 7]) + 48;
	var a = Decay2(tr, 0.01, TRand(0.15, 0.35, tr) * MouseY(0.5, 2, 0, 0.2)) * TRand(0.01, 0.2, tr);
	var f = DmdOn(tr, 0, (n + trs).MidiCps);
	var o = SinOsc([f, f + TRand(tr, 0.7, 1.3)], 0);
	o.Cubed.Cubed * a
};
var d = Seq(inf, [8, 3, 3, 2, 8, 4, 4]) / MouseX(9, 27, 1, 0.2);
var t1 = TDmdFor(d, 0, 1);
var t2 = PulseDivider(t1, 2, 0);
var t4 = PulseDivider(t1, 4, 0);
var t24 = PulseDivider(t1, 24, 0);
var b = DmdOn(t24, 0, Seq(inf, [0, -1, -2]));
f(t1, b + 0) + f(t2, b + 12) +  f(t4, b - 5)
