// 20060911 ; rd
var t = Impulse.ar(22, 0) * (SinOsc.kr(0.5, 0) + 1);
var x = MouseX.kr(0.005, 0.12, 1, 0.1);
var y = MouseY.kr(0.01, 0.52, 1, 0.1);
var n = {
	var n1 = LFNoise0.kr(2);
	var n2 = CoinGate.ar(0.05 + n1 + (y * 0.4) + (t * 0.5), t * 0.5);
	var n3 = TExpRand.ar([500, 900], 1600, t);
	Ringz.ar(n2, n3, x)
};
var b = TRand.kr(0, 1, Dust.kr(8));
n.dup(3).sum.clip2(In.kr(0, 1)) <! Out.kr(0, b) * 0.25
