// jmcc ; choip choip choip
var dur = 12;
var z = RTexture.overlapGraph({
    arg tr;
    var i = Impulse.ar(TXLine.kr(TExpRand.kr(1, 30, tr), TExpRand.kr(1, 30, tr), dur, tr), 0);
    var f = TXLine.kr(TExpRand.kr(600.0, 8000.0, tr), TExpRand.kr(600.0, 8000.0, tr), dur, tr);
    var o = SinOsc.ar(Decay2.ar(i, 0.05, 0.5) * -0.9 * f + f, 0);
    var l = TXLine.kr(TExpRand.kr(0.01, 0.5, tr), TExpRand.kr(0.01, 0.5, tr), dur, tr);
    var s = Decay2.ar(i * l, 0.01, 0.2) * o;
    Pan2.ar(s, TLine.kr(TRand.kr(-1, 1, tr), TRand.kr(-1, 1, tr), dur, tr), 1)
}, dur - 2, 1, 8, 2);
4.do({ z = AllpassN.ar(z, 0.1, { Rand.ir(0, 0.05) }.dup, 4) });
z

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

//---- jmcc ; choip choip choip
{var dur = 12
;var z = RTexture.overlapGraph(
 {arg tr
 ;var i = Impulse.ar(freq: TXLine.kr(start: TExpRand.kr(lo: 1, hi: 30, trig: tr), end: TExpRand.kr(lo: 1, hi: 30, trig: tr), dur: dur, trig: tr), phase: 0)
 ;var f = TXLine.kr(start: TExpRand.kr(lo: 600.0, hi: 8000.0, trig: tr), end: TExpRand.kr(lo: 600.0, hi: 8000.0, trig: tr), dur: dur, trig: tr)
 ;var o = SinOsc.ar(freq: Decay2.ar(in: i, attackTime: 0.05, decayTime: 0.5, mul: -0.9 * f, add: f))
 ;var l = TXLine.kr(start: TExpRand.kr(lo: 0.01, hi: 0.5, trig: tr), end: TExpRand.kr(lo: 0.01, hi: 0.5, trig: tr), dur: dur, trig: tr)
 ;var s = Decay2.ar(in: i * l, attackTime: 0.01, decayTime: 0.2, mul: o)
 ;Pan2.ar(in: s, pos: TLine.kr(start: TRand.kr(lo: -1, hi: 1, trig: tr), end: TRand.kr(lo: -1, hi: 1, trig: tr), dur: dur, trig: tr), level: 1)}, dur - 2, 1, 8, 2)
;4.do({z = AllpassN.ar(in: z, maxdelaytime: 0.1, delaytime: [0.05.rand, 0.05.rand], decaytime: 4)})
;z}

