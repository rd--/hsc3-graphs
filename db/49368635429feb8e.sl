(* Vosim ; noise modulation of frequency *)
Vosim(
	Impulse(110 + [-1 0 1], 0),
	LinExp(LfNoise2([0.35 0.25 0.15]), -1, 1, [110 220 440], 880),
	[3 5 7],
	[0.77 0.88 0.99]
).Splay * 0.1
