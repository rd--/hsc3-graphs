{-********* Echo input ; Jmcc *********-}
let in = AudioIn([1, 2]) * 0.1;
CombL(
	in,
	0.5, {- max delay time -}
	MouseX(0, 0.5, 0, 0.2), {- mouse x controls delay time -}
	4) {- echo 60 dB decay time in seconds -}
+ in {- mix with input -}
