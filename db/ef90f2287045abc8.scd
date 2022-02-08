// sturmian sequencer iii (jrhb)
var rules = [[0, 1], [0]];
var rewrite = {
    arg c, n;
    n.timesRepeat({ c = c.collect({ arg e; rules.at(e) }).concatenation });
    c
};
var n = 9;
var strFunc = {
    arg i;
    var str = rewrite.value([0], i + 6);
    var dt = SampleDur.ir / (n - i + 2) * MouseX.kr(1, SampleRate.ir, 2, 0.2);
    TDuty.ar(dt, 0, Dseq.dr(str - 0.5, inf), 0, 0) };
0.to(n - 1).collect(strFunc).splay * 0.3
