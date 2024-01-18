{- http://earslap.com/weblog/music-release-laconicism.html ; wait -}
let v = Blip([60, 61], 5) * (LfNoise0(4).MulAdd(1, 0) ^ 8);
12.timesRepeat {
	v := LeakDc(CombC(v, 1, LfNoise0(1).MulAdd(0.05, 0.06).Lag(5000), 9), 0.995)
};
Limiter(v, 0.9, 1)
