// a bath (jrhb)
var above = MouseY.kr(0, 2, 0, 0.2).round(1);
var aside = MouseX.kr(1, 1.6, 0, 0.2);
var sources = [{ WhiteNoise.ar }.dup * 0.3, { PinkNoise.ar }.dup, LFDNoise3.ar(10000) * 0.1];
var u1 = SelectX.ar(LFDNoise1.kr(4).range(0, sources.size), sources) * 0.1;
var u2 = u1 + DelayN.ar(u1, 0.1, [0.001, 0.0012]) * 0.1;
var u3 = u2.collect({
	arg chan;
	RLPF.ar(u2, { Rand(100, 340) * aside }.dup(4), 0.2).sum
});
var u4 = CombL.ar(u3.reverse, 0.05, 0.05, 0.3) * 0.3 * LFNoise2.kr(0.2).max(0) + u3;
SelectX.ar(above.lag(0.4), [u2, u4]) * 2;

