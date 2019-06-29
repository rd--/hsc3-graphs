// chrd (rd)

"../jmcc/overlap-texture.scd".loadRelative;

~overlap_texture.(
{var chrd =
  {arg m = [60, 65, 72, 77, 79, 84]
  ;var r0 = Rand(0.05, 0.5)
  ;var r1 = Rand(-1, 1)
  ;var r2 = Rand(-1, 1)
  ;var r3 = Rand(0.15, 0.35)
  ;var r4 = Rand(0.005, 0.01)
  ;var ds = 3
  ;var d = [5, 4, 5, 7, 4, 5] * ds
  ;var f = XLine.kr(m, m + r0, d).midicps
  ;var z_ = Env.linen(r3 * d, 0, (1 - r3) * d, r4)
  ;var z = Env.sine(d.maxItem, r4)
  ;var e = EnvGen.kr(z, 1, 1, 0, 1)
  ;var p = XLine.kr(r1, r2, d)
  ;var o = SinOsc.ar(f, 0)
  ;Mix.ar(Pan2.ar(o, p, e))}
;var scale = [0, 2, 4, 5, 7, 9, 11]
;var octaves = [4, 5, 6, 7]
;var mnn = all {:n + (o * 12), n <- scale, o <- octaves}
;var chd = 6.collect({mnn.choose})
;Mix.fill(9,{chrd.(chd)})}
,21, 0, 3)
