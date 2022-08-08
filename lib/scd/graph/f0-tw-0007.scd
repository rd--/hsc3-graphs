// https://sccode.org/1-4Qy ; tweet0007 ; texture variant (rd)
OverlapTexture({
	arg tr;
	var p = Pluck.ar(Crackle.ar([1.9, 1.8]), Impulse.ar(TIRand.kr(1, 6, tr), 0), 0.05, TLinRand.kr(0, 0.05, tr), 1, 0.5);
	BPF.ar(p, TIRand.kr(0, 1200, tr), 1)
}, 1, 23, 7)
