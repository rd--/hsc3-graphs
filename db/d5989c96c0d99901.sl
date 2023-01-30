;; pulsing bottles (jmcc) #2
var n = 6;
{
	var a = LfPulse(4 + Rand(0, 10),  0,  Rand(0, 0.7)) * 0.8 / n;
	var l = SinOsc(0.1 + Rand(0, 0.4), Rand(0, 2 * pi));
	Pan2(Resonz(WhiteNoise(), 400 + LinRand(0, 7000, 0), 0.01), l, 1) * a
} !+ n
