// interesting drone ; https://github.com/cianoc/supercollider_fragments
{var freq = [40, 42, 43, 45, 47, 48, 41, 42].midicps
;var amp = LFNoise1.kr(0.1.rrand(0.5).dup(8), 0.5, 0.5)
;Mix.ar(Pan2.ar(SinOsc.ar(freq, mul: amp), 1.0.rand2.dup(8))) * 0.2}
