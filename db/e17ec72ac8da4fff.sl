;; http://earslap.com/weblog/music-release-laconicism.html ; wait
var n = { :freq :mul :add | LfNoise0(freq) * mul + add };
var v = Blip([60, 61], 5) * (n(4, 1, 0) ** 8);
12.timesRepeat {
	v := LeakDc(CombC(v, 1, n(1, 0.05, 0.06).Lag(5000), 9), 0.995)
};
Limiter(v, 0.9, 1)
