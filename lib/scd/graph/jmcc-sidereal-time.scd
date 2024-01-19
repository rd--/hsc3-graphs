// sidereal time (jmcc) #9
var z = OverlapTexture({ |tr|
	var p = 15;
	var z = { [{ TExpRand.kr(100, 6000, tr) }.dup(p), nil, { TRand.kr(2, 6, tr) }.dup(p)].asRef }.dup(2);
	var f = TxLine.kr(TExpRand.kr(40, 300, tr), TExpRand.kr(40, 300, tr), 12, tr);
	var t = LFPulse.ar(f, TRand.kr(0.1, 0.9, tr), 0) * 0.002 * LFNoise2.kr(TRand.kr(0, 8, tr)).max(0);
	DynKlank.ar(z, t).distort * 0.1
}, 4, 4, 6);
CombN.ar(z, 0.6, Rand.ir(0.1, 0.6), 8) + z.reverse
