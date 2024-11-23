// https://twitter.com/lukiss163/status/1581607231463731200 ; lnu
var b = SfAcquire("Floating", 1, [1]);
var n = [-36, -9, -14, 0, -19, -5, 3, -2, -24, -7];
var k = n.size;
var r = { LFDNoise3.ar(1 / 86).abs };
var w = Warp1.ar(1, b, r.dup(k), n.midiratio, 8 * r.dup(k) + 8 / 86, -1, 12, 1 / 4 * r.dup(k), 4) * r.dup(k);
Splay.ar(LeakDC.ar(FreeVerb.ar(w, r.dup(k), 0.5 + r.dup(k), r.dup(k)), 0.995), 1 / 2, 1, 0, true).tanh
