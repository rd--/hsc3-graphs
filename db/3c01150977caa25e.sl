{- http://sccode.org/1-4Qy (F0) ; 0301 ; requires=kr -}
let b = 0:3.collect { :i |
	Duty(
		i + 1 / 9,
		0,
		ControlIn(1, i + 1 % 4) + Dseq(inf, 8.fibonacciList) % 9
	).kr
};
CombN(SinOsc(b * 99, b * 2), 1, 1 / 3, 1).Splay / 2 <! ControlOut(0, b)
