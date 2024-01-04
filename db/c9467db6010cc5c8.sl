(* Input noise gate ; Jmcc *)
let input = AudioIn([1, 2]);
Compander(
	input, input,
	MouseX(0.01, 0.5, 0, 0.2), (* threshold *)
	10, (* below threshold slope *)
	1, (* above threshold slope *)
	0.01, 0.1
)
