// jmcc ; choip choip choip
{var dur = 12
;var z = RTexture.overlapGraph(
 {arg tr
 ;var i = Impulse.ar(freq: RTXLine.kr(start: TExpRand.kr(lo: 1, hi: 30, trig: tr), end: TExpRand.kr(lo: 1, hi: 30, trig: tr), dur: dur, trig: tr), phase: 0)
 ;var f = RTXLine.kr(start: TExpRand.kr(lo: 600.0, hi: 8000.0, trig: tr), end: TExpRand.kr(lo: 600.0, hi: 8000.0, trig: tr), dur: dur, trig: tr)
 ;var o = SinOsc.ar(freq: Decay2.ar(in: i, attackTime: 0.05, decayTime: 0.5, mul: -0.9 * f, add: f))
 ;var l = RTXLine.kr(start: TExpRand.kr(lo: 0.01, hi: 0.5, trig: tr), end: TExpRand.kr(lo: 0.01, hi: 0.5, trig: tr), dur: dur, trig: tr)
 ;var s = Decay2.ar(in: i * l, attackTime: 0.01, decayTime: 0.2, mul: o)
 ;Pan2.ar(in: s, pos: RTLine.kr(start: TRand.kr(lo: -1, hi: 1, trig: tr), end: TRand.kr(lo: -1, hi: 1, trig: tr), dur: dur, trig: tr), level: 1)}, dur - 2, 1, 8, 2)
;4.do({z = AllpassN.ar(in: z, maxdelaytime: 0.1, delaytime: [0.05.rand, 0.05.rand], decaytime: 4)})
;z}