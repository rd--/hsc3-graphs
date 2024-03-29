{- http://twitter.com/redFrik/status/1479212835192332289 (F0) ; requires=QuadC -}
let q = { :freq | QuadC(freq, 1, -1, -0.75, 0) };
let q1 = q(5);
let b = [5 2.5 6];
let q2 = q(b / 15) * q1;
let e = 1 / 15;
let q3 = q(500) * q1 / 99;
let q4 = q(999 * b) * q(b / 15).Max(0) / 999 * q(b);
let q5 = q([12 16] * 99) * QuadC(0.1, 1, -1, -0.75, [-0.5 -1]).Max(0) * q(15).Max(0) / 15;
let q6 = EqPan(
	QuadC(99 * b, 1, q(1 / b / [15 5 15]) > 0 * 0.375 - 1.25, -0.75, 0).Tanh * q2,
	0.5 * q2
).Sum / 2;
q3 + q4.Splay2 + AllpassN(q5 + q6, e, e, 15)
