// birdies (jmcc) #6
{
	var p1 = MulAdd(LFPulse.kr(0.4 + Rand.ir(0, 1), 0, Rand.ir(0, 0.8) + 0.1), Rand.ir(0, 3) + 4, 2);
	var p2 = MulAdd(LFPulse.kr(0.4 + Rand.ir(0, 1), 0, Rand.ir(0, 0.8) + 0.1), Rand.ir(0, 3) + 4, 0);
	var p3 = MulAdd(LFPulse.kr(0.2 + Rand.ir(0, 0.5), 0, 0.4), 0.02, 0);
	var sw = MulAdd(LFSaw.kr(p1 + p2, 0), (1000 + Rand.ir(0, 800)).neg, 4000 + Rand.ir(-1200, 1200));
	var freq = Lag.kr(sw, 0.05);
	var amp = Lag.kr(p3, 0.3);
	Pan2.ar(SinOsc.ar(freq, 0), Rand.ir(-1, 1), amp)
}.overlap(7, 4, 4)

// birdies (jmcc) #6 ; language random ; keywords
{
	var p1 = LFPulse.kr(freq: 0.4 + 1.0.rand, iphase: 0, width: 0.8.rand + 0.1, mul: 3.0.rand + 4, add: 2);
	var p2 = LFPulse.kr(freq: 0.4 + 1.0.rand, iphase: 0, width: 0.8.rand + 0.1, mul: 3.0.rand + 4);
	var p3 = LFPulse.kr(freq: 0.2 + 0.5.rand, iphase: 0, width: 0.4, mul: 0.02);
	var sw = LFSaw.kr(freq: p1 + p2, iphase: 0, mul: (1000 + 800.rand).neg, add: 4000 + 1200.rand2);
	var freq = Lag.kr(in: sw, lagTime: 0.05);
	var amp = Lag.kr(in: p3, lagTime: 0.3);
	Pan2.ar(in: SinOsc.ar(freq: freq, phase: 0), pos: 1.0.rand2, level: amp)
}.overlap(7, 4, 4)
