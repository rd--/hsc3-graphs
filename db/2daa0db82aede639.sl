(* Harmonic tumbling (Jmcc) #1 *)
let t = XLine([10, 11], 0.1, 60);
(0 .. 10).collect { :h |
	let e = Decay2(Dust(t) * 0.02, 0.005, Rand(0, 0.5));
	SinOsc(80 * (h + 1), 0) * e
}.Mix
