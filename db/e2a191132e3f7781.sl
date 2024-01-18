{- tw 0020 (f0) -}
let a = { :freq |
	LfPulse(freq, 0, 0.5)
};
let b = (0 .. 3);
let a1 = a(b / 32) + 1 / 8;
let a2 = a(a1) + 1 * b;
let a3 = a(b / 64);
let a4 = a(a(b / 8)) * 2 + b;
let a5 = a(4 / (b + 1)); {- divide by zero -}
let a6 = a(a2);
let a7 = a(a6 + (a3.Sum + a5 * a4) * 100);
a7.Sum.EqPan2(0) * 0.1
