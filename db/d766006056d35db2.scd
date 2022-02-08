// random sine waves ; https://github.com/cianoc/supercollider_fragments
var f = { Pan2.ar(SinOsc.ar(SinOsc.ar(1 / 10, 0.0.rrand(6.0)) * 200 + 600, 0), 1.0.rand, 0.05) };
f.dup(15).splay
