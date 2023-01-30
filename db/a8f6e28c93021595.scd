// https://twitter.com/redFrik/status/1590835403157688320
var b = (1 .. 9);
var g = 1 / b / 99;
var z = Latch.ar(WhiteNoise.ar.roundTo(0.5) + 2, BrownNoise.ar + 1.4 > SinOsc.ar(b / 999, 0));
var x = SinOsc.ar(999 * b.scramble / RLPF.ar(z, 9 ** SinOsc.ar(g * 9, 0) * 999, SinOsc.ar(b / 77, 0) /  2 + 0.6), 0);
var w = Latch.ar(WhiteNoise.ar, BrownNoise.ar + 1.3 > SinOsc.ar(b / 99, 0));
var y = RLPF.ar(w, 9 ** SinOsc.ar(g, 0) * 999, SinOsc.ar(b  /88) / 2 + 0.6);
Splay2.ar(7 ** SinOsc.ar(g, 0) / 9 * x * y)
