(* Modal space (Jmcc) #8 *)
let b = [0 2 3.2 5 7 9 10].asLocalBuf;
let k = DegreeToKey(b, MouseX(0, 15, 0, 0.2), 12);
let c = { :n :r |
	let o = SinOsc((r + k + (n * 0.04)).MidiCps, 0) * 0.1;
	let t = LfPulse([48, 55].MidiCps, 0, 0.15);
	let f = (SinOsc(0.1, 0) * 10 + r).MidiCps;
	let d = Rlpf(t, f, 0.1) * 0.1;
	let m = o + d;
	CombN(m, 0.31, 0.31, 2) + m
};
let n = LfNoise1([3, 3]);
(c(n, 48) + c(n, 72)) * 0.25
