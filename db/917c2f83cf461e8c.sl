(* Ar ; https://github.com/alikthename/Musical-Design-in-Supercollider ; 1 *)
Voicer(1, 16) { :e |
	let withMod = true;
	let level = e.z * e.w.LagUd(0, e.y * 4 + 0.1);
	let f1 = (e.x * 36 + 48).MidiCps;
	let f2 = f1.Clip(50, 1500);
	let formantA = TChoose(e.w, [1 2 3]) * withMod.if { (e.k * 2).RoundTo(1).Max(1) } { 1 };
	let formantB = TChoose(e.w, [3 4 5 6 7]) * withMod.if { (e.j * 4).RoundTo(1).Max(1) } { 1 };
	let overlapA = TChoose(e.w, [0.5 1 2 4]) * withMod.if { e.y * 2 } { 1 };
	let overlapB = TChoose(e.w, [0.5 1 2]) * withMod.if { e.y * 2 } { 1 };
	let attackTime = f2.LinLin(50, 1500, 0.1, 0.02);
	let e0 = Perc(e.w, attackTime, Rand(1, 7), -4);
	let e1 = e0 * PinkNoise().Range(0.1, 1).Lag(0.02);
	let p = e.j * 2 - 1;
	let gTrg = Impulse(f1, 0);
	let fund = GrainSin(1, gTrg, overlapA * (1.05 - e1.Pow(1.1)) / f1, f1, p, -1, 512);
	let a = GrainSin(2, gTrg, overlapA * (1.05 - e1.Pow(1.5)) / f1, f1 * formantA, p, -1, 512);
	let b = GrainSin(2, gTrg, overlapB * (1.05 - e1.Pow(2.5)) / f1, f1 * formantB, p, -1, 512);
	let c1 = fund * (level * e1).Pow(0.7);
	let c2 = a * (level * e1).Pow(f2.LinLin(50, 1500, 1.1, 1.5));
	let c3 = b * (level * e1).Pow(f2.LinLin(50, 1500, 1.5, 2.5));
	LeakDc([c1 c2 c3].Sum, 0.995)
}.Sum * 0.25
