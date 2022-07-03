// http://sccode.org/1-V (nv) L1
var a = { PinkNoise.ar }.dup(2);
var o = {
    var f = LinExp.kr(LFNoise1.kr(0.05.rand), -1, 1, 40, 15000);
    a = BBandStop.ar(a, f, ExpRand.ir(0.1, 2))
};
50.timesRepeat(o);
LPF.ar(a, 100000)
