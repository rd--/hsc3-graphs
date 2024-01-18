// ostinoodles (jmcc) #9
var sequ = {
	arg s, tr;
	Demand.kr(tr, 0, Dseq(s, inf))
};
var root = 81 + 6.rand2;
var major = #[0, 2, 4, 5, 7, 9, 11];
Texture.overlapRoutine({
	var offset = 16.rand2;
	var sequence = (([0, 1, 2, 3] + offset).scramble.degreeToKey(major) + root).midicps;
	var trig = Impulse.kr(freq: XLine.kr(start: 4.0.exprand(24.0), end: 4.0.exprand(24.0), dur: 12), phase: 0);
	var f = sequ.value(sequence, trig);
	Pan2.ar(in: LFTri.ar(freq: f, iphase: 0, mul: Decay2.kr(in: trig, attackTime: 0.004, decayTime: 0.3, mul: 0.1)), pos: 1.0.rand2, level: 1)
}, 6, 3, 6, 2, postProcess: {
	arg z;
	6.do({z = AllpassN.ar(in: z, maxdelaytime: 0.040, delaytime: [0.040.rand, 0.040.rand], decaytime: 16) });
	z
})
