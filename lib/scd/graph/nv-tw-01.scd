// http://sccode.org/1-V (nv) L1
var a = { PinkNoise.ar }.dup(2);
var o = {
	var f = LinExp.kr(LFNoise1.kr(0.05.rand), -1, 1, 40, 15000);
	a = BBandStop.ar(a, f, ExpRand(0.1, 2))
};
50.do(o);
LPF.ar(a, 100000)

//---- http://sccode.org/1-V (nv) L1 ; keywords
var a = { PinkNoise.ar }.dup(2);
var o = {
	var f = LinExp.kr(in: LFNoise1.kr(freq: 0.05.rand), srclo: -1, srchi: 1, dstlo: 40, dsthi: 15000);
	a = BBandStop.ar(in: a, freq: f, bw: ExpRand(lo: 0.1, hi: 2))
};
50.do(o);
LPF.ar(in: a, freq: 100000)

// http://sccode.org/1-V (nv) L1
{a=PinkNoise.ar(1!2);50.do{a=BBandStop.ar(a,LFNoise1.kr(0.05.rand).exprange(40,15000),exprand(0.1,2))};LPF.ar(a,1e5)}
