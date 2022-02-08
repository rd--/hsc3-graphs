// jmcc ; choip choip choip ; lineto
{var dur = 12
;var z = RTexture.overlapGraph(
 {arg tr
 ;var i = Impulse.ar(freq: TXLineTo.kr(endFunc: {arg t; TExpRand.kr(lo: 1, hi: 30, trig: t)}, dur: dur, trig: tr), phase: 0)
 ;var f = TXLineTo.kr(endFunc: {arg t; TExpRand.kr(lo: 600.0, hi: 8000.0, trig: t)}, dur: dur, trig: tr)
 ;var o = SinOsc.ar(freq: Decay2.ar(in: i, attackTime: 0.05, decayTime: 0.5, mul: -0.9 * f, add: f))
 ;var l = TXLineTo.kr(endFunc: {arg t; TExpRand.kr(lo: 0.01, hi: 0.5, trig: t)}, dur: dur, trig: tr)
 ;var s = Decay2.ar(in: i * l, attackTime: 0.01, decayTime: 0.2, mul: o)
 ;Pan2.ar(in: s, pos: TLineTo.kr(endFunc: {arg t; TRand.kr(lo: -1, hi: 1, trig: t)}, dur: dur, trig: tr), level: 1)}, dur - 2, 1, 8, 2)
;4.do({z = AllpassN.ar(in: z, maxdelaytime: 0.1, delaytime: [0.05.rand, 0.05.rand], decaytime: 4)})
;z}
