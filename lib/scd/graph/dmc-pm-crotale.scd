// pm-crotale (dmc) #1.7 ; graph rewrite
OverlapTexture({ |tr|
	var midi = TIRand.kr(48, 72, tr);
	var tone = TRand.kr(1, 6, tr);
	var art = TRand.kr(2, 6, tr) * 3;
	var pan = TRand.kr(-1, 1, tr);
	var freq = midi.midicps;
	var env = Decay2.kr(tr, 0, art);
	var mod = 5 + (1 / TIRand.kr(2, 6, tr));
	var amp_1 = Decay2.kr(tr, 0, art) * TRand.kr(0.1, 0.3, tr);
	var amp_2 = Decay2.kr(tr, 0, art * 1.3) * TRand.kr(0.1, 0.5, tr);
	var sig = PMOsc.ar(freq, mod * freq, Decay2.kr(tr, 0, art) * tone, 0);
	Pan2.ar(sig, pan, amp_1 * amp_2)
}, 12, 0, 8)
