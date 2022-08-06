// https://sccode.org/1-4Qy ; tweet0006 ; texture variant (rd)
OverlapTexture({
	arg tr;
	var n = MoogFF.ar(ClipNoise.ar * 0.4, LFPar.kr({ TRand.kr(0, 0.3, tr) }.dup(2), 0) * 600 + 990, 2, 0);
	GVerb.ar(n, 9, 9, 1, 0.5, 15, 1, 0.7, 0.5, 300)
}, 1, 9, 6)

//--tweet0006
r{loop{x={GVerb.ar(MoogFF.ar(ClipNoise.ar*0.4,LFPar.kr({0.3.rand}!2,0,600,990)),9,9,1)}.play(s,0,19);3.wait;x.release}}.play
