// impulse sequencer (jmcc) SC2
{var t = Impulse.ar(8, 0)
;var isequ = {arg s; t * Demand.ar(t, 0, Dseq.new(s, inf))}
;var c_sq = isequ.value(#[1,0,0,1,0,0,1,0,0,0,1,0,1,0,0,0])
;var c = Decay2.ar(c_sq, 0.001, 0.3) * SinOsc.ar(1700, 0) * 0.1
;var d_sq = isequ.value(#[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0])
;var d = Decay2.ar(d_sq, 0.001, 0.3) * SinOsc.ar(2400, 0) * 0.04
;var n_sq = isequ.value(#[1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1])
;var n = Decay2.ar(n_sq, 0.001, 0.25) * BrownNoise.ar * 0.1
;var b_sq = isequ.value(#[1,0,0.2,0,0.2,0,0.2,0])
;var b = Decay2.ar(b_sq, 0.001, 0.5) * SinOsc.ar(100, 0) * 0.2
;c + d + n + b}
