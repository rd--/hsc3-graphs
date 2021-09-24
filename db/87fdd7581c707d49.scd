// more bells
{var env = EnvGen.kr(Env.perc(0, 2), Dust.kr(1/3)) * 0.1
;var osc = SinOsc.ar({300.rrand(1200)}.dup(12), mul: env)
;Mix.ar(Pan2.ar(osc, {1.rand2}.dup(12)))}
