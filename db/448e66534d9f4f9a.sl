/* VarSaw (Jmcc) */
let f0 = 80;
let tr = Impulse(4, 0) * 0.05;
let n = WhiteNoise().MulAdd(3, 3).RoundTo(0.5) + 1;
let f = Lag(f0 * Latch(n, tr), 0.03);
let osc = VarSaw(
	f * [1, 1.004, 1.505, 1.499],
	0,
	MouseY(0, 1, 0, 0.2)
) * Decay2(tr, 0.005, 1.4);
CombN(osc.clump(2).Mix * 0.5, 0.375, 0.375, 4).SoftClip
