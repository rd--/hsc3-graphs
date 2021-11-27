// sturmian sequencer (jrhb)
var rules = [[0, 1], [0]];
var rewrite = {
    arg c, n;
    n.timesRepeat({ c = c.collect({ arg e; rules.at(e) }).concatenation });
    c
};
var strFunc = {
    arg i;
    var str = rewrite.value([0], i + 6);
    var dt = 2 ** i.neg * 10;
    var trig = TDuty.ar(dt, 0, Dseq.dr(str.postln, 1), 0, 0);
    var freq = ExpRand.ir(200, i + 1 / 7 * 10100);
    Ringz.ar(trig, freq * [1, 1.2, 1.5], ExpRand.ir(2 ** i.neg * 0.1, 1.101) ).sum.distort
};
0.to(6).collect(strFunc).splay * 0.3
