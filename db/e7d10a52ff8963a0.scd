// http://earslap.com/weblog/music-release-laconicism.html
var i = Impulse.ar(8, 0).lag(0.3).dup(2);
10.do({
	i = LeakDC.ar(AllpassC.ar(i, 1, LFNoise0.ar(8).range(0.00001, 0.2), -0.15) * LFNoise0.ar(8).range(1, 3), 0.995).tanh
});
i
