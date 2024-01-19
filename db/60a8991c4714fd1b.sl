{- http://twitter.com/redFrik/status/23182604046 (F0) ; 0011 -}
let s = { :o :i |
	SinOsc([i, i + 0.0001] ^ 2 * f(o, i - 1), f(o, i - 1) * 0.0001) * f(o, i - 1)
};
let f = { :o :i |
	(i > 0).if { s(o, i) } { o }
};
let k = 10 + 50.atRandom;
f(k, 6) / k
