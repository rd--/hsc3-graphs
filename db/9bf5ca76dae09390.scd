// http://earslap.com/weblog/music-release-laconicism.html ; wait
var n = { arg freq, mul, add; LFNoise0.kr(freq) * mul + add };
v = Blip.ar([60, 61], 5) * (n.value(4, 1, 0) ** 8);
12.timesRepeat({
	v = LeakDC.ar(CombC.ar(v, 1, n.value(1, 0.05, 0.06).lag(5000), 9))
});
Limiter.ar(v, 0.9, 1)
