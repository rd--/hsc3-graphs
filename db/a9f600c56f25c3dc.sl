;; http://earslap.com/weblog/music-release-laconicism.html
var n = { :freq | LfNoise0(freq) };
var v = Blip([20000, 20000 - 9], 1) * (n(16) * 0.5 + 0.5 ** 9);
42.timesRepeat {
	v := LeakDc(AllpassC(v, 1, n(5) * 0.05 + (0.05 + 0.001), 100), 0.995)
};
(v * 99).Tanh
