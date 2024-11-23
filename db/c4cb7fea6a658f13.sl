/* Sturmian sequencer ii (jrhb) */
let rules = [[0, 1], [0]];
let rewrite = { :c :n |
	let r = c;
	n.timesRepeat {
		r := r.collect { :e |
			rules[e + 1]
		}.++
	};
	r
};
let n = 7;
(0 .. n - 1).collect { :i |
	let str = rewrite([0], i + 6);
	let dt = 2 ^ (n - i).negated * 20;
	let trig = TDuty(dt, 0, Dseq(1, str));
	let freq = TExpRand(200, (n - i) / n * 10100, trig);
	let trigFlt = Bpf(trig, LfNoise2(0.1) * 0.02 + 1 * freq, 0.2);
	Ringz(
		trigFlt,
		freq * [1, 1.1, 1.2],
		ExpRand(2 ^ i.negated * 0.1, 0.5)
	).Sum.Distort
}.Splay * 0.5
