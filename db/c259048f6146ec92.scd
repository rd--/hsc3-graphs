// nice use of blip ; https://github.com/cianoc/supercollider_fragments
{var t = Impulse.kr(6)
;var o = Blip.ar(TRand.kr(48, 72, t).midicps, TRand.kr(1, 12, t), 0.max(TRand.kr(-0.5, 0.4, t)))
;var p = Pan2.ar(o, TRand.kr(-1.0, 1.0, t)) * EnvGen.kr(Env.perc(0, 3), t)
;var m = Mix.ar({p}.dup(6)) * 0.2
;m + CombL.ar(m, 2.0, 4/6, 6)}
