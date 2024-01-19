// dragtokeyboard (jmcc) ; graph rewrite ; http://www.iamas.ac.jp/~aka/dspss2004/materials/
OverlapTexture({ |tr|
	var in = LFSaw.ar([21000, 21001], 0) * (LFPulse.kr(TExpRand.kr(0.1, 1, tr), 0, 0.3) * 0.2 + 0.02);
	var sr = TExpRand.kr(300, 3000, tr) + [-0.6, 0.6];
	RLPF.ar(
		in * LFPulse.ar(sr, 0, MouseY.kr(0.01, 0.99, 0, 0.2)),
		sr * (LFPulse.kr(TExpRand.kr(0.1, 12, tr), 0, 0.4) * 0.2 + 0.2 + (LFPulse.kr(TExpRand.kr(0.1, 12, tr), 0, 0.7) * 0.2)),
		0.1
	)
}, 4, 4, 2)
