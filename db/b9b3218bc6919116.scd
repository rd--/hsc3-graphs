// wandering sines ; https://github.com/cianoc/supercollider_fragments
var o = SinOsc.ar((LFNoise1.kr(0.5) * 600 + (LFSaw.kr(1.5, 0) * 50 + 500)).abs, 0) * 0.1;
var d = CombN.ar(o, 3.0, #[1.35, 0.7], 6);
Pan2.ar(o, 0, 1) + d
