// https://twitter.com/earslap/status/18314287525
AllpassC.ar(
	Splay.ar(tanh((LFNoise0.ar(8!2, 8).lag(*{LFNoise2.ar(4).exprange(5e-3, 500)}!2)*pi).cos*75), 0.5),
	1,
	0.008,
	LFNoise0.ar(8, 2)
)

// https://twitter.com/earslap/status/5430344275
var n = { |freq| LFNoise0.ar(freq) };
var f = [60, 61];
var l = n.value(6);
var o = SinOsc.ar(f * (l * 9).ceil.lag(0.1), 0) * 0.7;
var p = n.value(4).max(l).max(o);
var q = BBandPass.ar(p, f, n.value(1).abs / 2);
(q * 700 * l.lag(1)).tanh
