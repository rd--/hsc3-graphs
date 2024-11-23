/* 2019-12-01_VICRIMA.scd ; https://github.com/gosub/supercollider-explore */
let a = SinOsc(LfNoise0(1).LinExp(-1, 1, 100, 1000), 0);
let e = Perc(Dust(8), 0.01, 1, -4);
let f = { :x |
	x.Ring1(DelayL(PitchShift(x, 0.2, [0.2, 0.21], 0, 0), 1, 0.2))
};
f(f(a * e)).Tanh * 0.2
