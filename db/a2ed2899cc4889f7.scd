// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43
{var f =
 {arg i
 ;var x = Impulse.ar(freq: 1, phase: i / 10) + Impulse.ar(freq: 0, phase: 0)
 ;var o = LFSaw.ar(freq: [102, 101], iphase: 0)
 ;var d = 1 / Latch.ar(in: 1.015 ** Sweep.ar(trig: 0, rate: 1) * 64 % 1 + 1 * 200, trig: x)
 ;Pluck.ar(in: o, trig: x, maxdelaytime: 1, delaytime: d, decaytime: 4, coef: 0.2)}
;(f ! 10).mean}
