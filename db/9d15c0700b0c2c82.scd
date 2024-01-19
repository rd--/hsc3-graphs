// https://sccode.org/1-4Qy ; f0 ; tweet0003 ; texture variant
OverlapTexture({ |tr|
	var t = SinOsc.ar(TRand.kr(1, 999, tr), 0).abs;
	Formlet.ar(TDuty.ar(t, 0, t, 0, 0), TLinRand.kr(20, 4000, 0, tr), t, 1 - t).dup(2)
}, 1, 15, 7)
