// great inharmonic spectrum ; https://github.com/cianoc/supercollider_fragments
var freq = [72, 135, 173, 239, 267, 306, 355, 473, 512, 572, 626];
var amp = [0.25, 0.11, 0.12, 0.04, 0.1, 0.15, 0.05, 0.01, 0.03, 0.02, 0.12];
Mix.ar(SinOsc.ar(freq, 0, mul: amp * 0.1))
