// https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 1.1
{var n = 11
;var mk =
 {var freq = 50.rrand(560.3)
 ;var numcps = 2.rrand(20)
 ;var knum = SinOsc.kr(freq: 0.02.exprand(0.2), phase: 0, mul: numcps / 2, add: numcps / 2)
 ;var gen = Gendy1.ar(ampdist: 6.rand, durdist: 6.rand, adparam: 1.0.rand, ddparam: 1.0.rand, minfreq: freq, maxfreq: freq, ampscale: 1.0.rand, durscale: 1.0.rand, initCPs: numcps, knum: knum, mul: 0.5 / n.sqrt)
 ;Pan2.ar(in: gen, pos: 1.0.rand2, level: 1.0)}
;var x = MouseX.kr(minval: 100, maxval: 2000, warp: 0, lag: 0.2)
;var y = MouseY.kr(minval: 0.01, maxval: 1.0, warp: 0, lag: 0.2)
;Resonz.ar(in: Mix.fill(n: n, function: mk), freq: x, bwr: y, mul: 0.5)}
