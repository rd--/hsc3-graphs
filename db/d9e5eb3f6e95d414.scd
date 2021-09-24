// envelope used also for the index ; https://github.com/cianoc/supercollider_fragments
{var f = Latch.kr(Mix.ar(SinOsc.ar([100, 200, 300, 550], mul: 100, add: 110)), Impulse.kr(7))
;var e = EnvGen.kr(Env.perc(0, 0.2), Impulse.kr(7))
;PMOsc.ar(f, f * 1.25, e * 5, mul: e * 0.1)}
