(* DelayL ; audio input ; warning=feedback *)
let input = AudioIn([1, 2]);
let delayTime = [
	MouseX(0.5, 4, 0, 2),
	MouseY(0.5, 4, 0, 2)
] * LfNoise2(1 / [5, 7]).Abs;
input + DelayL(input, 4, delayTime)
