// sawed cymbals (jmcc) ; #10 ; graph rewrite
var p = 15;
OverlapTexture({ |tr|
	var f1 = TRand.kr(500, 2500, tr);
	var f2 = TRand.kr(0, 8000, tr);
	var s = LFSaw.ar(TxLine.kr(TRand.kr(0, 600, tr), TRand.kr(0, 600, tr), 12, tr), 0, 0.0005);
	{ RingzBank.ar(s, { f1 + TRand.kr(0, f2, tr)}.dup(p), nil, { TRand.kr(2, 6, tr) }.dup(p)) }.dup * 0.1;
}, 4, 4, 6, 2)

//---- sawed cymbals (jmcc) ; #10
var p = 15;
Texture.overlapRoutine({
	var f1 = Rand(500, 2500);
	var f2 = Rand(0, 8000);
	var s = LFSaw.ar(XLine.kr(Rand(0, 600), Rand(0, 600), 12), 0, 0.0005);
	{ RingzBank.ar(s, { f1 + Rand(0, f2)}.dup(p), nil, { Rand(2, 6) }.dup(p)) }.dup * 0.1;
}, 4, 4, 6, 2)
