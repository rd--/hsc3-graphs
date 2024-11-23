/* http://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; Yh (Yoshinosuke Horiuchi) */
let decay = 2;
let amp = 10;
let pan = 0;
let tone = 0.002;
let tr = Impulse(LfNoise2(1) * 0.25 + 0.35, 0);
let env1 = Perc(tr, 0.3, decay, -3);
let mkEnv = { :l :t :c |
	Env(l, t, c, nil, nil, 0).asEnvGen(tr)
};
let env2 = mkEnv([0, 0.6, 0], [0.1, decay * 0.7], -5);
let env2b = mkEnv([0, 0.3, 0], [0.1, decay * 20], -120);
let env3 = mkEnv([0, 1, 0], [0, decay * 5], -150);
let osc = LfPulse(
	[203.52 366.31 301.77 518.19 811.16 538.75],
	0,
	0.5
).Sum * 0.6;
let sig1 = BLowShelf(
	Lpf(
		BHiPass(
			BPeakEq(
				Bpf(
					BLowShelf(osc, 2000, 1, 5),
					3000, 1
				),
				2400, 0.5, 5
			),
			1550, 0.7
		), 3000
	), 1000, 1, 0
) * env1 * tone;
let sig2 = BHiShelf(BHiPass4(BPeakEq(Bpf(BLowShelf(osc, 990, 2, -5), 7400, 1), 7200, 0.5, 5), 6800, 0.7), 10000, 1, -4);
let sig2a = sig2 * env2 * 0.3;
let sig2b = sig2 * env2b * 0.6;
let sig3 = BHiPass4(BPeakEq(Bpf(BLowShelf(osc, 990, 2, -15), 6500, 1), 7400, 0.35, 10), 10500, 0.8) * 2 * env3;
Pan2(Lpf(sig1 + sig2a + sig2b + sig3, 4000), pan, amp)
