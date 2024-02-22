// aleatoric quartet (jmcc) #7
var amp = 0.07;
var density = MouseX.kr(0.01, 1, 'linear', 0.1);
var dmul = density.reciprocal * 0.5 * amp;
var dadd = amp - dmul;
var rapf = { |i| AllpassN.ar(i, 0.05, Array.fill(2, {Rand(0, 0.05)}), 1)};
var mkFreq = {
	var n0 = LFNoise0.kr(Select.kr(IRand(0, 2), #[1, 0.5, 0.25]));
	Lag.kr((n0 * 7 + 66 + Rand(-30, 30)).round(1), 0.2).midicps
};
var mkSig = {
	var x = PinkNoise.ar * 0.max(LFNoise1.kr(8) * dmul + dadd);
	Pan2.ar(CombL.ar(x, 0.02, mkFreq.value.reciprocal, 3), Rand(-1, 1), 1)
};
var g = Mix.fill(4, mkSig);
5.do { g = rapf.value(g) };
LeakDC.ar(g, 0.995)
