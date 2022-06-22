// jmcc - inharmonic warbulence ; graph rewrite
var z = Texture.overlapGraph({
    arg tr;
    var f = TRand.kr(24, 96, tr).midicps;
    var a = 1.min(500 / f);
    var r = TXLine.kr(TExpRand.kr(0.1, 20, tr), TExpRand.kr(0.1, 20, tr), 25.6, tr);
    var n = 12;
    Mix.arFill(n, {
        arg i;
        var g = TRand.kr(0, n, tr) + 1;
        var m = (SinOsc.kr(r * TRand.kr(0.9, 1.1, tr), TRand.kr(0, 2 * pi, tr)) * 0.08 + -0.04).max(0);
        Pan2.ar(SinOsc.ar(f * g, 0), TRand.kr(-1, 1, tr), m * (2 / g))
    }) * 0.1
}, 12.8, 6.4, 6);
Mix.arFill(5, { CombN.ar(z, 0.3, { Rand.ir(0.1, 0.3) }.dup, 8) }) * 0.3

//---- jmcc - inharmonic warbulence ; graph rewrite
{var z = Texture.overlapGraph(graphFunc:
 {arg tr
 ;var f = TRand.kr(lo: 24, hi: 96, trig: tr).midicps
 ;var a = 1.min(500/f)
 ;var r = TXLine.kr(start: TExpRand.kr(lo: 0.1, hi: 20, trig: tr), end: TExpRand.kr(lo: 0.1, hi: 20, trig: tr), dur: 25.6, trig: tr)
 ;var n = 12
 ;Mix.arFill(n,
  {arg i
  ;var g = TRand.kr(lo: 0, hi: n, trig: tr) + 1
  ;var m = SinOsc.kr(freq: r * TRand.kr(lo: 0.9, hi: 1.1, trig: tr), phase: TRand.kr(lo: 0, hi: 2 * pi, trig: tr), mul: 0.08, add: -0.04).max(0)
  ;Pan2.ar(in: SinOsc.ar(freq: f * g, phase: 0, mul: m * (2 / g)), pos: TRand.kr(lo: -1, hi: 1, trig: tr), level: 1)}) * 0.1}, sustainTime: 12.8, transitionTime: 6.4, overlap: 6)
;Mix.arFill(5, {CombN.ar(in: z, maxdelaytime: 0.3, delaytime: [0.1.rrand(0.3), 0.1.rrand(0.3)], decaytime: 8)}) * 0.3}
