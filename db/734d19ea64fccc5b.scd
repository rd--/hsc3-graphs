// pwm crossfade (jl)
var n = #[400, 500, 450, 376, 600];
var d = 1 / 20;
var f = Demand.kr(Impulse.kr(d, #[0, 0.5]), 0, Dseq.dr(n, inf));
var f_ = LFPulse.kr(8, 0, LFTri.kr(d, 1).range(0, 1)).performList(\range, f);
LPF.ar(Saw.ar(f_.max(376) * #[1, 0.99]) * 0.5, 8000) * 0.2
