// tapping tools (jmcc) #7
Texture.spawnRoutine({
	var rate = XLine.kr(64, 0.125, 60, doneAction: 0);
	var exc = Decay.ar(Impulse.ar((1 + 20.0.linrand) * rate, 0) * 0.03, 0.001);
	var flt = RingzBank.ar(exc, {400 + 8000.0.rand} ! 4, nil, { 0.01 + 0.1.rand } ! 4);
	Release.ar(Pan2.ar(flt, 1.0.rand2, 1), 1, 4, 1)
}, nextTime: 2, postProcess: {
	arg z;
	3.do { z = AllpassN.ar(z, 0.05, { 0.05.rand } ! 2, 2) };
	z
})
