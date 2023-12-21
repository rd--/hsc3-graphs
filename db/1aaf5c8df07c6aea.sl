(* what was i thinking? (jmcc) #2 *)
var i = LfPulse(0.1, 0, 0.05) * Impulse(8, 0) * 500;
var f = (SinOsc(4, 0) + 80).Max(Decay(i, 2));
var p = Pulse(f, LfNoise1(0.157) * 0.4 + 0.5) * 0.04;
var z = Rlpf(p, LfNoise1(0.2) * 2000 + 2400, 0.2) * 0.25;
var y = z * 0.6;
{
	[y, y].collect { :i |
		CombL(i, 0.06, LfNoise1(0.3.Rand) * 0.025 + 0.035, 1)
	}.Sum
} ! 2 + z
