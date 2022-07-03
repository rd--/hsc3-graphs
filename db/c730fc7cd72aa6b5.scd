	// deep trip ; graph re-write
	Texture.overlapGraph( {
        arg tr;
        var f, z, s;
		f = LFNoise1.kr(TRand.kr(0,0.3,tr), 60, 70).midicps;
		z = SinOsc.ar(f, 0,
			LFNoise2.ar(
				f * TRand.kr(0,0.5,tr),
				LFNoise1.kr(TRand.kr(0,8.0,tr), SinOsc.kr(TRand.kr(0,40.0,tr),0,0.1)).max(0)
			)
		);
		s = Pan2.ar(z, LFNoise1.kr(TRand.kr(0,5.0,tr)));
		s + CombN.ar(s, 0.5, [TRand.kr(0,0.2,tr) + 0.3, TRand.kr(0,0.2,tr) + 0.3], 20)
		+ CombN.ar(s, 0.5, [TRand.kr(0,0.2,tr) + 0.3, TRand.kr(0,0.2,tr) + 0.3], 20);
	}, 12, 4, 4, 2)
