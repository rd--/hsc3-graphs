// chrd (rd) ; graph rewrite
OverlapTexture({ |tr|
	var chrd = {
		arg m;
		var ds = 3;
		var d = [5, 4, 5, 7, 4, 5] * ds;
		var f = TxLine.kr(m, m + TRand.kr(0.05, 0.5, tr), d, tr).midicps;
		var z = Env.sine(d.maxItem, TRand.kr(0.005, 0.01, tr));
		var e = EnvGen.kr(z, tr, 1, 0, 1, 0);
		var p = TxLine.kr(TRand.kr(-1, 1, tr), TRand.kr(-1, 1, tr), d, tr);
		var o = SinOsc.ar(f, 0);
		Mix.ar(Pan2.ar(o, p, e))
	};
	var scale = [0, 2, 4, 5, 7, 9, 11];
	var octaves = [4, 5, 6, 7];
	var mnn = scale.collect({ arg n; octaves.collect({ arg o; n + (o * 12) }) }).flatten;
	var chd = 6.collect({ TChoose.kr(tr, mnn) });
	Mix.fill(9, { chrd.value(chd) })
}, 21, 0, 3)

//---- chrd (rd) ; graph rewrite
OverlapTexture(graphFunc: { |tr|
	var chrd = { |m|
		var ds = 3;
		var d = [5, 4, 5, 7, 4, 5] * ds;
		var f = TxLine.kr(start: m, end: m + TRand.kr(lo: 0.05, hi: 0.5, trig: tr), dur: d, trig: tr).midicps;
		var z = Env.sine(dur: d.maxItem, level: TRand.kr(lo: 0.005, hi: 0.01, trig: tr));
		var e = EnvGen.kr(envelope: z, gate: tr, levelScale: 1, levelBias: 0, timeScale: 1, doneAction: 0);
		var p = TxLine.kr(start: TRand.kr(lo: -1, hi: 1, trig: tr), end: TRand.kr(lo: -1, hi: 1, trig: tr), dur: d, trig: tr);
		var o = SinOsc.ar(freq: f, phase: 0);
		Mix.ar(Pan2.ar(in: o, pos: p, level: e))
	};
	var scale = [0, 2, 4, 5, 7, 9, 11];
	var octaves = [4, 5, 6, 7];
	var mnn = scale.collect { |n|
		octaves.collect { |o|
			n + (o * 12)
		}
	}.flatten;
	var chd = 6.collect({TChoose.kr(trig: tr, array: mnn)});
	Mix.fill(n: 9, function: { chrd.value(chd) })
}, sustainTime: 21, transitionTime: 0, overlap: 3)

//----  calculations (stsc3 does not parse list comprehensions);
all {:n + (o * 12),n <- [0,2,4,5,7,9,11],o <- [4,5,6,7]}
[0,2,4,5,7,9,11].collect({arg n [4,5,6,7].collect({arg o n + (o * 12)})}).flatten
