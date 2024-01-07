let k = 16;
(1 .. k).collect { :each |
	SinOsc(Rand(33, 333) * each, 0) * SinOsc(Rand(1 / 33, 1 / 11), 0) / k
}.Splay
