// lovely bells ; https://github.com/cianoc/supercollider_fragments
{var t = Impulse.kr(1/3)
;var env = EnvGen.kr(Env.perc(0, 1), t, levelScale: 1/(1..6), timeScale: 1.0.rrand(3.0).dup)
;Mix.ar(SinOsc.ar([60, 64, 67, 71, 74, 78].midicps, mul: env)) * [0.3, 0.3]}
