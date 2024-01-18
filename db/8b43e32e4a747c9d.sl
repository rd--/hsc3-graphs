{-********* Ring modulate input using Ring1 ; Jmcc *********-}
let input = AudioIn([1, 2]) * 0.5;
let modulator = SinOsc(
	MouseX(10, 4000, 1, 0.2), {- mouse x controls ring mod freq -}
	[0, 0.5.pi] {- offset phase ofone osc by 90 degrees -}
);
input.Ring1(modulator)
