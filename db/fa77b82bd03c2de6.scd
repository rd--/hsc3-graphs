// lasers ; https://github.com/cianoc/supercollider_fragments
SinOsc.ar(EnvGen.kr(Env.adsr(0.1, 0.4, 0.8, 0.5, 1, [-4], 0), Dust.kr(1), 10000, 0, 1, 0)) * 0.1
