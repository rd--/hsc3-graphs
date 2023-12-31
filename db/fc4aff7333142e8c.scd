// https://twitter.com/redFrik/status/1197185125819277312
var f = [2, 2.2];
var e = f / 22;
var g = 2 << 2;
var c = RHPF.ar(CombN.ar(SinOsc.ar(e, 0) / 2 * LocalIn.ar(2, 0), 2, 2, g), [22, 2] * 222, e * 2);
var o = SinOsc.ar(2.2 ** ToggleFF.ar(LFPulse.ar(2, [2.2, 2], e)) * 22 * 2.22, ToggleFF.ar(c - e).lag(0.1) * g) * LFPulse.ar(2, f, 0.5);
var d = Splay.ar(RLPF.ar(o, g ** SinOsc.ar(e / 2 / 2, 0) * 2222 / 2, SinOsc.ar(e, 0) + 2 / (2 * pi)) + c).tanh;
d <! LocalOut.ar(d) * 0.25
