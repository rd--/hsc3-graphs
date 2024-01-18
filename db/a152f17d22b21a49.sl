{-********* Ring modulate & echo input ; Jmc -}
let in = AudioIn([1, 2]) * 0.4 * SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5.pi]);
CombL(
	in,
	0.5,
	MouseY(0, 0.5, 0, 0.2), {- mouse y controls delay time -}
	4 {- echo 60 dB decay time in seconds -}
) + in {- mix with input -}
