// wuxia5 (jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/
var amp = 0.1;
var eg = EnvGen.kr(Env.linen(0.03, 4, 2, 1, 'lin'), 1, 1, 0, 1, 2);
var noise = WhiteNoise.ar * 0.1 * eg;
var dt = XLine.kr(ExpRand.ir(12000, 10), ExpRand.ir(12000, 10), 4).reciprocal;
6.do({
	noise = LeakDC.ar(CombC.ar(noise, 0.1, dt, dt * 6) + dt, 0.995);
});
noise = {
	var pos = Rand.ir(-1, 1);
	Pan2.ar(
		CombN.ar(noise, 0.2, Rand.ir(0.1, 0.2), 3) + noise,
		Line.kr(pos, pos + Rand.ir(-2, 2), 4)
	);
}.dup(5).sum;
noise * eg * amp
