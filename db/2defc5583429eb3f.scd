// sidereal time ; graph re-write
{
var p;
p = 15;	// number of partials per channel per 'cymbal'.
	RTexture.overlapGraph({
        arg tr;
		var z, f1, f2, f3, in, out;
		f1 = 100;
		f2 = 6000.0;
		z = Array.fill(2, {
			`[	// sine oscil bank specification :
				y = Array.fill(p, { TExpRand.kr(f1, f2, tr) } ), // frequencies
				nil, 							// amplitudes default to 1.0
				Array.fill(p, { 2.0 + TRand.kr(0,4.0,tr) })	// ring times
			]
		});
		f3 = LinExp.kr(Sweep.kr(tr,1/12),0,1,TExpRand.kr(40.0, 300.0, tr), TExpRand.kr(40.0, 300.0, tr));
		in = LFPulse.ar(f3, TRand.kr(0.1, 0.9, tr), 0, 0.002 * LFNoise2.kr(TRand.kr(0,8.0,tr)).max(0));
		out = DynKlank.ar(z, in).distort * 0.1;
		CombN.ar(out, 0.6, TRand.kr(0,0.5,tr) + 0.1, 8, 1, out.reverse);
	}, 4, 4, 6, 2)
}
