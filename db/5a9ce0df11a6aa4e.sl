;; lovely bells ; https://github.com/cianoc/supercollider_fragments
var t = Impulse(1 / 3, 0);
var m = Rand(1, 3) ! 2;
var env = Decay2(t, 0.01 * m, 1 * m) / 1.to(6);
SinOsc([60, 64, 67, 71, 74, 78].MidiCps, 0).sum * env * 0.1
