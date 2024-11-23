/* http://twitter.com/redFrik/status/1454150378241548296 ; F0 */
let a = { :r :i :n :q :p |
	Rlpf(Impulse(r, p), Select(i % 5, [0, 3, 5, 7, 10] + n).MidiCps, q)
};
let x = 0.001;
let b = 1:8 / 8;
let z = [
	a(2, LfSaw(x, 0) * 88, 51, x * 9, 0),
	a(1, 0, 70, x * 5, b),
	a(LfSaw(1 / 9, 0) + 1, 5 ^ LfSaw(b / 9, 0), 82, x * 3, b * 3) / 8,
	a(3, LfSaw(x * 2, 0.5) * 88, 63, x * 7, 0) / 4
];
let o = z.Sum.Splay;
o + GVerb(o.Sum / 9, 50, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300)
