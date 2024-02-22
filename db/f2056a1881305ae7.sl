{- Sturmian sequencer i (jrhb) -}
let rules = [[0, 1], [0]];
let rewrite = { :n |
	let r = [0];
	n.timesRepeat {
		r := r.collect { :e |
			rules[e + 1]
		}.concatenation
	};
	r
};
0:6.collect { :i |
	let str = rewrite(i + 6);
	let dt = 2 ^ i.negated * 10;
	let trig = Sequencer(str, Impulse(1 / dt, 0));
	let freq = ExpRand(200, i + 1 / 7 * 10100);
	Ringz(
		trig,
		freq * [1, 1.2, 1.5],
		ExpRand(2 ^ i.negated * 0.1, 1.101)
	).Sum.Distort
}.Splay * 0.5
