// interesting rising sounds ; https://github.com/cianoc/supercollider_fragments
var f = {arg c; Pan2.ar(SinOsc.ar(LFSaw.ar((c * 0.2 + 1)/3, 0) * 500 + 700, 0), LFNoise0.kr(1), 0.05)};
Mix.ar(f.dup(5))
