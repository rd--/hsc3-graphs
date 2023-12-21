// https://twitter.com/redFrik/status/1084601286488a674304
var b = #[2, 5, 1, 6, 3];
var x = PitchShift.ar(LocalIn.ar(2, 0), 1.5, 0.5, 0, 0);
var y = VarSaw.ar(LFSaw.ar(1 / b, 0) > 0 / 4 + 1.25 ** b * 99, 0, LFSaw.ar(b / 9, 0) % 1);
var z = HPF.ar(LFSaw.ar(LFSaw.ar(1 / b, 0).round + 1/2, 0) > 0, LFSaw.ar(b / 33, 0) * 4 + 8);
var d = MoogFF.ar(Splay.ar(y * z), LFSaw.ar(1/9, 0) + 2 * 4000, 2, 0);
d <! LocalOut.ar(d)
