// http://earslap.com/weblog/music-release-laconicism.html
var n = { arg freq; LFNoise0.ar(freq) };
var f = [60, 61];
var l = n.value(6);
(BBandPass.ar((n.value(4).max(l).max(SinOsc.ar(f * (l * 9).ceil.lag(0.1), 0) * 0.7)), f, n.value(1).abs / 2) * 700 * l.lag(1)).tanh
