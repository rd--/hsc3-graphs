	// bitwise (jl) - a0f253ff89f6b244ea29a1e431dd9e5df5571a8b (jonatan liljedahl) ; abstracted (rd)
	var t = PulseCount.ar(Impulse.ar(8000, 0), 0);
	var f = { arg p; (t * p.key) & (t >> p.value) };
	var b = [15 -> 5, 5 -> [3, 4], 2 -> 9, 8 -> 11, 7 -> [7, 13], 3 -> 17, 11 -> 3].collect(f);
	var s = (b.inject(0, { arg i, j; i | j }) - 3) % 256;
	HPF.ar(((s / 127) - 1) * 3, 20).tanh * 0.02
