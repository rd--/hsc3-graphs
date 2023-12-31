(* DelayL ; audio input ; warning=feedback *)
var input = AudioIn([1, 2]);
var delayTime = [
	MouseX(0.5, 4, 0, 2),
	MouseY(0.5, 4, 0, 2)
] * LfNoise2(1 / [5, 7]).Abs;
input + DelayL(input, 4, delayTime)
