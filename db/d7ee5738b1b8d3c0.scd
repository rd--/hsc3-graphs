// nice buzzing effect
var speed = 14;
var f = SinOsc.ar(1000, 0) * 150 + 300;
var t = Impulse.kr(1 / 3, 0);
var v = { arg n; SinOsc.ar(f * n, 0) * (LFNoise1.kr(Rand.ir(speed, speed * 2)) * 0.5 + 0.5) / n };
(1 .. 12).collect(v).sum * 0.1
