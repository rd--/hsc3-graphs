{- https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi) -}
let decay = 0.5;
let amp = 1;
let pan = 0;
let tr = Impulse(LfNoise2(1) + 1.5, 0);
let env1 = Perc(tr, 0.1, decay, -3);
let env2 = Env([0, 1, 0], [0, decay * 5], -150, nil, nil, 0).asEnvGen(tr);
let osc = LfPulse(
	[203.52 366.31 301.77 518.19 811.16 538.75],
	0,
	0.5
).Sum;
let sig1 = Bpf(BLowShelf(osc, 990, 2, -3), 7700, 1);
let sig2 = BPeakEq(sig1, 7200, 0.5, 5);
let sig3 = BHiPass4(sig2, 8100, 0.7);
let sig4 = BHiShelf(sig3, 9400, 1, 5);
let siga = sig4 * env1 * 0.6;
let sigb = sig4 * env2;
let sum = Lpf(siga + sigb, 4000);
Pan2(sum, pan, amp * 2)
