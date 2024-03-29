// bitwise (jl) - a0f253ff89f6b244ea29a1e431dd9e5df5571a8b (jonatan liljedahl)
var t = PulseCount.ar(Impulse.ar(8000, 0), 0);
var s = ((((t * 15) & (t >> 5))     |
	((t *  5) & (t >> [3,4])) |
	((t *  2) & (t >> 9))     |
	((t *  8) & (t >> 11))) - 3) % 256;
	HPF.ar(((s / 127) - 1) * 3, 20).tanh * 0.02

	// bitwise (jl) - a0f253ff89f6b244ea29a1e431dd9e5df5571a8b (jonatan liljedahl) ; abstracted (rd)
	var t = PulseCount.ar(Impulse.ar(8000, 0), 0);
	var f = { arg p; (t * p.key) & (t >> p.value) };
	var b = [15 -> 5, 5 -> [3, 4], 2 -> 9, 8 -> 11, 7 -> [7, 13], 3 -> 17, 11 -> 3].collect(f);
	var s = (b.inject(0, { arg i, j; i | j }) - 3) % 256;
	HPF.ar(((s / 127) - 1) * 3, 20).tanh * 0.02
