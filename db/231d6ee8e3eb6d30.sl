(* Duty *)
let f = { :tr :trs |
	let n = Dseq(inf, [7, 0, 3, 3, 3, Drand(1, [5, 10, 12]), 7]) + 48;
	let a = Decay2(
		tr,
		0.01,
		TRand(0.15, 0.35, tr) * MouseY(0.5, 2, 0, 0.2)
	) * TRand(0.01, 0.2, tr);
	let f = Demand(tr, 0, (n + trs).MidiCps);
	let o = SinOsc([f, f + TRand(0.7, 1.3, tr)], 0);
	o.Cubed.Cubed * a
};
let d = Dseq(inf, [8, 3, 3, 2, 8, 4, 4]) / MouseX(9, 27, 1, 0.2);
let t1 = TDuty(d, 0, 1);
let t2 = PulseDivider(t1, 2, 0);
let t4 = PulseDivider(t1, 4, 0);
let t24 = PulseDivider(t1, 24, 0);
let b = Demand(t24, 0, Dseq(inf, [0, -1, -2]));
f(t1, b + 0) + f(t2, b + 12) + f(t4, b - 5)
