// impulse sequencer (jmcc) SC2
{var isequ = {arg s, tr; tr * Demand.ar(tr, 0, Dseq(s, inf))}
// single sample impulse as trigger
;var t = Impulse.ar(8)
// clave rhythm
;var c_sq = isequ.([1,0,0,1,0,0,1,0,0,0,1,0,1,0,0,0],t)
;var c = Decay2.ar(c_sq, 0.001, 0.3, FSinOsc.ar(1700, 0, 0.1))
// dee dee dee dee dee
;var d_sq = isequ.([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0], t)
;var d = Decay2.ar(d_sq, 0.001, 0.3, FSinOsc.ar(2400, 0, 0.04))
// noise drum
;var n_sq = isequ.([1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1], t)
;var n = Decay2.ar(n_sq, 0.001, 0.25, BrownNoise.ar(0.1))
// bass drum
;var b_sq = isequ.([1,0,0.2,0,0.2,0,0.2,0], t)
;var b = Decay2.ar(b_sq, 0.001, 0.5, FSinOsc.ar(100, 0, 0.2))
;c + d + n + b}
