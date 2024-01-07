(* https://sccode.org/1-4Qy ; f0 ; 0246 ; requires=DynRingzBank *)
let b = [1 .. 9] * 1.5;
let d = [2 / b, 3 / b];
let e = LfPulse(d, 0, 0.5);
CombC(
	DynRingzBank(e, (LfPulse(1 / b, 0, 0.5) * b + 50).MidiCps, 0.0002, b / 9),
	2,
	2 - Lpf(e, 50),
	1
).transposed.Sum
