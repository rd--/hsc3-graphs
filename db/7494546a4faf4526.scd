// why supercollider (jmcc) #0
var s = { Resonz.ar(Dust.ar(0.2) * 50, Rand(200, 3200), 0.003) }.dup(10).sum;
var x = { CombL.ar(DelayN.ar(s, 0.048, 0.048), 0.1, LFNoise1.kr(Rand(0, 0.1)) * 0.04 + 0.05, 15) }.dup(7).sum;
4.do {
	x = AllpassN.ar(x, 0.050, [Rand(0, 0.05), Rand(0, 0.050)])
};
s + (0.2 * x)
