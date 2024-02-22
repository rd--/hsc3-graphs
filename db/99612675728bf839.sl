{- Nice buzzing effect -}
let speed = 14;
let f = SinOsc(1000, 0) * 150 + 300;
let t = Impulse(1 / 3, 0);
1:12.collect { :n |
	SinOsc(f * n, 0) * (LfNoise1(Rand(speed, speed * 2)) * 0.5 + 0.5) / n
}.Sum * 0.1
