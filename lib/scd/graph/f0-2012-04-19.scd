// 2012-04-19 (f0) - https://www.listarc.bham.ac.uk/lists/sc-users/msg17536.html
{var sw = LFSaw.ar(10, 0) * 0.01
;var t0 = LFTri.ar([5, 6] * 0.1, 0)
;var t1 = LFTri.ar(0.1, 0) * 0.05 + 0.05
;CombN.ar(Limiter.ar(BRF.ar(sw, t0, 1), 1, 0.01), 0.1, t1.round(0.01), 1) * 0.1}
