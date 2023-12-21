(* Dictionary ; Voicer *)
(
	w: SinOsc(1 / [5, 7], 0),
	x: SinOsc(1 / [13, 17], 0)
).Voicer { :e |
	SinOsc(e.x * 222 + 333, 0) * e.w * 0.2
}
