// choip (jmcc) #10
{
	var t = 12;
	var i = Impulse.ar(XLn.kr(1.exprand(30), 1.exprand(30), t), 0);
	var f = XLn.kr(600.exprand(8000), 600.exprand(8000), t);
	var a = SinOsc.ar(Decay2.ar(i, 0.05, 0.5) * (-0.9 * f) + f, 0);
	var l = Ln.kr(1.0.rand2, 1.0.rand2, t);
	var j = XLn.kr(0.01.exprand(0.5), 0.01.exprand(0.5), t);
	var z = Pan2.ar(Decay2.ar(i * j, 0.01, 0.2) * a, l, 1);
	4.do({ z = AllpassN.ar(z, 0.1, [0.05.rand, 0.05.rand], 4)});
	z
}.overlap(10, 1, 8)

// choip (jmcc) #10 ; keywords ; post-process
var gen_f = {
	var t = 12;
	var i = Impulse.ar(freq: XLine.kr(start: 1.exprand(30), end: 1.exprand(30), dur: t), phase: 0);
	var f = XLine.kr(start: 600.exprand(8000), end: 600.exprand(8000), dur: t);
	var a = SinOsc.ar(freq: Decay2.ar(in: i, attackTime: 0.05, decayTime: 0.5, mul: -0.9 * f, add: f), phase: 0);
	var l = Line.kr(start: 1.0.rand2, end: 1.0.rand2, dur: t);
	var j = XLine.kr(start: 0.01.exprand(0.5), end: 0.01.exprand(0.5), dur: t);
	Pan2.ar(in: Decay2.ar(in: i * j, attackTime: 0.01, decayTime: 0.2, mul: a), pos: l, level: 1)
};
var pp_f = {
	arg z;
	4.do({z = AllpassN.ar(z, 0.1, [0.05.rand, 0.05.rand], 4)});
	z
};
Texture.overlapRoutine(
	newEventFunc: gen_f,
	postProcess:pp_f,
	sustainTime:10,
	transitionTime:1,
	overlap:8
)
