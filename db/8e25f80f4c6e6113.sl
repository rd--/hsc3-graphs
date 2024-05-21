{- https://sonomu.club/@lukiss/112280811322923333 ; Apr 16, 2024 -}
let f = [77 777 7777];
let a = (GbmanL(f, 1.2, 2.1).Sin + 1 * 2).Ceiling / 9;
let e = { :f |
	let t = Duty(a, 0, a);
	Perc(TDuty(t, 0, 1), 0.001, t, -4)
};
Splay(
	SinOsc(f, 0) * (e(f / 7) ^ [2 6 10]) * [1, 1 / 3, 1 / 9],
	SinOsc((e(7) * 7), 0)
).transposed.Sum
