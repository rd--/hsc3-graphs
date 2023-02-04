;; Gendy1 ; texture ; mouse control ; keywords ; requires=kr
var n = 11;
var f = {
	var freq = Rand(50, 560.3);
	var numcps = Rand(2, 20);
	var knum = MulAdd(SinOsc(ExpRand(0.02, 0.2), 0), numcps / 2, numcps / 2);
	var osc = Gendy1(
		ampdist: Rand(0, 6),
		durdist: Rand(0, 6),
		adparam: Rand(0, 1),
		ddparam: Rand(0, 1),
		minfreq: freq,
		maxfreq: freq,
		ampscale: Rand(0, 1),
		durscale: Rand(0, 1),
		initCPs: numcps,
		knum: knum.kr
	);
	EqPan2(osc, Rand(-1, 1)) * 0.5 / n.sqrt
};
Resonz(f !+ n, MouseX(100, 2000, 0, 0.2), MouseY(0.01, 1.0, 0, 0.2))