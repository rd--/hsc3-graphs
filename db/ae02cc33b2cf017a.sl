(* DelayC ; decorrelation *)
let x = BrownNoise() * 0.2;
[
	DelayC(x, 0.01, 0.01),
	DelayC(x, 0.02, MouseX(0.02, 0, 0, 0.2))
]
