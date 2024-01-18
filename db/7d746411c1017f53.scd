// tw 0033 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/537
var f = LFPar.ar(1 / 14, 0).round * 20 + 80;
var a = Pulse.ar([1, 2, 3, 4], 0.35);
var n = BrownNoise.ar * a;
var z = (0 .. 3).collect { arg i;
	[i + 1 * f, i * f + i + 0.333]
};
var o = LFPar.ar(z, 0);
var s = Splay.ar((o > n) / 3);
Mix.ar(s) * 0.1
