(* Vosim ; mouse control of frequency *)
Vosim(
	Impulse(110 + [-1 0 1], 0),
	MouseX([110 220 440], 880, 1, 0.2),
	[3 5 7],
	[0.77 0.88 0.99]
).Splay * 0.1
