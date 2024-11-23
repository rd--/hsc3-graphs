/* Tw 0033 (F0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537 */
let f = LfPar(1 / 14, 0).RoundTo(1) * 20 + 80;
let a = Pulse([1 .. 4], 0.35);
let n = BrownNoise() * a;
let z = 0:3.collect { :i |
	[i + 1 * f, i * f + i + 0.333]
};
let o = LfPar(z, 0);
(o > n / 3).Splay2.Mix * 0.1
