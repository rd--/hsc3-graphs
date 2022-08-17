// http://earslap.com/article/sctweeting.html
var f = {
	var a = LFNoise1.ar(Rand.ir(0, 0.2));
	DelayC.ar(BPF.ar(WhiteNoise.ar() * Dust2.ar(a * a * 4 ** 2).lag(0.008), IRand.ir(0, 10000) + 300, 0.09), 3, a * 1.5 + 1.5) * 45
};
Mix(f.dup(80)).dup
