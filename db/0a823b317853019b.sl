{- Sturmian sequencer iii (jrhb) -}
let rules = [[0, 1], [0]];
let rewrite = { :c :n |
	let r = c;
	n.timesRepeat {
		r := r.collect { :e |
			rules[e + 1]
		}.concatenation
	};
	r
};
let n = 9;
let x = MouseX(1, SampleRate(), 1, 0.2);
1:n.collect { :i |
	let str = rewrite([0], i + 5);
	let dt = 1 / SampleRate() / (n - i + 1) * x;
	TDuty(dt, 0, Dseq(inf, str - 0.5))
}.Splay * 0.3
