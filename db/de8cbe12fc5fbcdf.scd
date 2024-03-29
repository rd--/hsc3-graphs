// ar ; https://github.com/alikthename/Musical-Design-in-Supercollider ; 1
var voiceFunc = { |e|
	var withMod = true;
	var voiceTrig = e.w;
	var lev = e.z * LagUD.kr(e.w, 0, e.y * 4 + 0.1);
	var f1 = (e.x * 36 + 48).midicps;
	var f2 = f1.clip(50, 1500);
	var formantA = TChoose.kr(voiceTrig, [1,2,3]) * withMod.if { (e.k * 2).round.max(1) } { 1 };
	var formantB = TChoose.kr(voiceTrig, [3,4,5,6,7]) * withMod.if { (e.j * 4).round.max(1) } { 1 };
	var overlapA = TChoose.kr(voiceTrig, [0.5,1.0,2.0,4.0]) * withMod.if { e.y * 2 } { 1 };
	var overlapB = TChoose.kr(voiceTrig, [0.5,1.0,2.0]) * withMod.if { e.y * 2 } { 1 };
	var attackTime = f2.linlin(50, 1500, 0.1, 0.02);
	var e0 = Env.perc(attackTime, Rand(1, 7), 1, -4);
	var e1 = EnvGen.kr(e0, voiceTrig) * PinkNoise.ar.range(0.1, 1).lag(0.02);
	var p = e.j * 2 - 1;
	var gtrg = Impulse.ar(f1, 0);
	var fund = GrainSin.ar(1, gtrg, overlapA * (1.05 - e1.pow(1.1)) / f1, f1, p);
	var a = GrainSin.ar(2, gtrg, overlapA * (1.05 - e1.pow(1.5)) / f1, f1 * formantA, p);
	var b = GrainSin.ar(2, gtrg, overlapB * (1.05 - e1.pow(2.5)) / f1, f1 * formantB, p);
	var c1 = fund * (lev * e1).pow(0.7);
	var c2 = a * (lev * e1).pow(f2.linlin(50, 1500, 1.1, 1.5));
	var c3 = b * (lev * e1).pow(f2.linlin(50, 1500, 1.5, 2.5));
	LeakDC.ar(Mix.ar([c1,c2,c3]), 0.995)
};
Mix.ar(Voicer.ar(0, 16, voiceFunc)) * 0.25
