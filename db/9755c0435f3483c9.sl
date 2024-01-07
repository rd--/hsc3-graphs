(* What was i thinking? (Jmcc) #2 *)
let i = LfPulse(0.1, 0, 0.05) * Impulse(8, 0) * 500;
let f = (SinOsc(4, 0) + 80).Max(Decay(i, 2));
let p = Pulse(f, LfNoise1(0.157) * 0.4 + 0.5) * 0.04;
let z = Rlpf(p, LfNoise1(0.2) * 2000 + 2400, 0.2) * 0.25;
let y = z * 0.6;
{
	[y, y].collect { :i |
		CombL(i, 0.06, LfNoise1(0.3.Rand0) * 0.025 + 0.035, 1)
	}.Sum
} ! 2 + z
