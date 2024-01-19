// sturmian sequencer ii (jrhb)
var rules = [[0, 1], [0]];
var rewrite = {
	arg c, n;
	n.do {
		c = c.collect({ arg e; rules.at(e) }).flat
	};
	c
};
var n = 7;
var strFunc = {
	arg i;
	var str = rewrite.value([0], i + 6);
	var dt = 2 ** (n - i).neg * 20;
	var trig = TDuty.ar(dt, 0, Dseq.dr(str, inf));
	var freq = TExpRand.kr(200, (n - i) / n * 10100, trig);
	var trigFlt = BPF.ar(trig, LFNoise2.kr(0.1, 0.02, 1) * freq, 0.2);
	Ringz.ar(trigFlt, freq * [1, 1.1, 1.2], ExpRand.ir(2 ** i.neg * 0.1, 0.5)).sum.distort
};
Splay.ar((0 .. n - 1).collect(strFunc)) * 0.3
