;; nice buzzing effect
var speed = 14;
var f = SinOsc(1000, 0) * 150 + 300;
var t = Impulse(1 / 3, 0);
var v = { :n | SinOsc(f * n, 0) * (LfNoise1(Rand(speed, speed * 2)) * 0.5 + 0.5) / n };
1.to(12).collect(v).sum * 0.1
