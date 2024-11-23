/* http://earslap.com/weblog/music-release-laconicism.html */
let i = Impulse(8, 0).Lag(0.3);
10.timesRepeat {
	i := LeakDc(AllpassC(i, 1, LfNoise0(8).LinLin(-1, 1, 0.00001, 0.2), -0.15) * LfNoise0(8).LinLin(-1, 1, 1, 3), 0.995).Tanh
};
i
