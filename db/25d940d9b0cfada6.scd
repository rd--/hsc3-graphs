// what was i thinking? (jmcc) #2
var i = LFPulse.ar(0.1, 0, 0.05) * Impulse.ar(8, 0) * 500;
var f = (SinOsc.kr(4, 0) + 80).max(Decay.ar(i, 2));
var p = Pulse.ar(f, LFNoise1.kr(0.157) * 0.4 + 0.5) * 0.04;
var z = RLPF.ar(p, LFNoise1.kr(0.2) * 2000 + 2400, 0.2);
var c = { | i |
	CombL.ar(i, 0.06, LFNoise1.kr(Rand(0, 0.3)) * 0.025 + 0.035, 1)
};
var y = z * 0.6;
z + [c.value(y) + c.value(y), c.value(y) + c.value(y)]
