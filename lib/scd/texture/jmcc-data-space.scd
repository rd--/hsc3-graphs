// data space (jmcc) #2
{
	var dt = 0.25.rand + 0.1;
	var osc = {
		arg n, m;
		var e = LFPulse.kr(m.rand, 0, 1.0.rand) * 8000.rand + 2000.rand;
		LFPulse.kr(n.rand, 0, 1.0.rand) * e
	};
	var freq = osc.value(200.0, 40.0) + osc.value(20.0, 4.0) + osc.value(20.0, 4.0);
	CombL.ar(Pan2.ar(LFPulse.ar(freq, 0, 0.5) * 0.04, LFNoise0.kr(3.0.rand) * 0.8), dt, dt, 3)
}.overlap(6, 1, 4)
