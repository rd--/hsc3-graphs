// sturmian sequencer iii (jrhb)
var rules = [[0, 1], [0]];
var rewrite = {
    arg c, n;
    n.do {
		c = c.collect { |e| rules.at(e) }.flat
	};
    c
};
var n = 9;
var strFunc = {
    arg i;
    var str = rewrite.value([0], i + 6);
    var dt = SampleDur.ir / (n - i + 2) * MouseX.kr(1, SampleRate.ir, 2, 0.2);
    TDuty.ar(dt, 0, Dseq.dr(str - 0.5, inf), 0, 0)
};
Splay.ar((0 .. n - 1).collect(strFunc)) * 0.3
