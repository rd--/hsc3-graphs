/* F0 ; http://twitter.com/redFrik/status/1136928201886904320 */
[
	0 -> LfTri:/2,
	1 -> LfSaw:/2,
	2 -> LfPar:/2
].collect { :a |
	let ix = a.key;
	let osc:/2 = a.value;
	let b = [4 2 1 3 5];
	let c = (osc(1 / b, 0) * b).RoundTo(osc(b / 9, 0) > 0);
	let o = SinOscFb(c ^ 2 * ((osc(0.02, ix) > 0) + 1 * 50), osc(c / 9, 0) % 1);
	let s = o * (osc(1 / b * osc(b / 99, ix), 0)).Max(0) * osc(0.01, ix);
	let x = AllpassC(s, 1, Wrap(c, 0.5, 1), 2);
	let y = Bpf(x, ix * 99 + 400, 0.001) * (osc(0.04, ix) + 1 * 9);
	Splay2(x + y) / 3
}.Mix
