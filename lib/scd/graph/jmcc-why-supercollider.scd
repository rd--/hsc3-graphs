// why supercollider (jmcc) #0
var s = { Resonz.ar(Dust.ar(0.2) * 50, Rand(200, 3200), 0.003) }.dup(10).sum;
var x = { CombL.ar(DelayN.ar(s, 0.048, 0.048), 0.1, LFNoise1.kr(Rand(0, 0.1)) * 0.04 + 0.05, 15) }.dup(7).sum;
4.do {
	x = AllpassN.ar(x, 0.050, [Rand(0, 0.05), Rand(0, 0.050)])
};
s + (0.2 * x)

//---- why supercollider (jmcc) #0 ; keywords
var s = { Resonz.ar(in: Dust.ar(density: 0.2) * 50, freq: Rand(lo: 200, hi: 3200), bwr: 0.003) }.dup(10).sum;
var z = DelayN.ar(in: s, maxdelaytime: 0.048, delaytime: 0.048);
var x = { CombL.ar(in: z, maxdelaytime: 0.1, delaytime: LFNoise1.kr(freq: Rand(lo: 0, hi: 0.1)) * 0.04 + 0.05, decaytime: 15) }.dup(7).sum;
4.do({ x = AllpassN.ar(in: x, maxdelaytime: 0.050, delaytime: [Rand(lo: 0, hi: 0.05), Rand(lo: 0, hi: 0.050)], decaytime: 1) });
s + (0.2 * x)
