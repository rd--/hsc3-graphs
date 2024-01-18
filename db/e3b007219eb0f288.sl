{-********* Filter the input ; Jmcc *********-}
let rQ = MouseY(0.01, 1, 1, 0.2); {- bandwidth ratio = 1/Q -}
Rlpf(
	AudioIn([1, 2]) * 0.4 * rQ.Sqrt, {- attenuate to offset resonance -}
	MouseX(100, 12000, 1, 0.2), {- mouse x controls cutoff freq -}
	rQ
)
