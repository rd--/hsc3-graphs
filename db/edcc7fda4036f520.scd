// http://earslap.com/weblog/music-release-laconicism.html
var n = { arg freq; LFNoise0.kr(freq) };
var v = Blip.ar([20000, 20000 - 9], 1) * (n.value(16) * 0.5 + 0.5 ** 9);
42.do({
	v = LeakDC.ar(AllpassC.ar(v, 1, n.value(5) * 0.05 + (0.05 + 0.001), 100), 0.995)
});
(v * 99).tanh
