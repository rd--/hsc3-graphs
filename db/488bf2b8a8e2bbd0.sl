{- https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi) -}
let decay = 0.42;
let amp = 1;
let pan = 0;
let tr = Impulse(LfNoise2(1) + 1.5, 0);
let env = Perc(tr, 0.005, decay, -30);
let osc = LfPulse(
	[203.52 366.31 301.77 518.19 811.16 538.75],
	0,
	0.5
).Sum;
let sighi = Hpf(Bpf(osc, 8900, 1), 9000);
let siglow = BHiPass(BBandPass(osc, 8900, 0.8), 9000, 0.3);
let sig = BPeakEq((siglow + sighi), 9700, 0.8, 0.7);
Pan2(sig * env, pan, amp)
