{-********* Distort, ring modulate & echo input, a real noise fest ; Jmcc *********-}
let in = (AudioIn([1, 2]) * 20).Distort.Ring1(
	SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5.pi])
) * 0.02;
CombL(
	in,
	0.5,
	MouseY(0, 0.5, 0, 0.2), {- mouse y controls delay time -}
	4
) + in
