// ar ; https://github.com/alikthename/Musical-Design-in-Supercollider ; 1
var voiceFunc = { | e |
	var withMod = true;
	var voiceTrig = e.w;
	var lev = e.z * LagUD.kr(in: e.w, lagTimeU: 0, lagTimeD: e.y * 4 + 0.1);
	var f1 = (e.x * 36 + 48).midicps;
	var f2 = f1.clip(lo: 50, hi: 1500);
	var formantA = TChoose.kr(trig: voiceTrig, array: [1,2,3]) * withMod.if({(e.k * 2).round.max(1)}, {1});
	var formantB = TChoose.kr(trig: voiceTrig, array: [3,4,5,6,7]) * withMod.if({(e.j * 4).round.max(1)}, {1});
	var overlapA = TChoose.kr(trig: voiceTrig, array: [0.5,1.0,2.0,4.0]) * withMod.if({e.y * 2}, {1});
	var overlapB = TChoose.kr(trig: voiceTrig, array: [0.5,1.0,2.0]) * withMod.if({e.y * 2}, {1});
	var attackTime = f2.linlin(inMin: 50, inMax: 1500, outMin: 0.1, outMax: 0.02);
	var e0 = Env.perc(attackTime: attackTime, releaseTime: Rand.ir(lo: 1, hi: 7), level: 1, curve: -4);
	var e1 = EnvGen.kr(envelope: e0, gate: voiceTrig) * PinkNoise.ar().range(lo: 0.1, hi: 1).lag(0.02);
	var p = e.j * 2 - 1;
	var gtrg = Impulse.ar(freq: f1, phase: 0);
	var fund = GrainSin.ar(numChannels: 1, trigger: gtrg, dur: overlapA * (1.05 - e1.pow(1.1)) / f1, freq: f1, pan: p);
	var a = GrainSin.ar(numChannels: 2, trigger: gtrg, dur: overlapA * (1.05 - e1.pow(1.5)) / f1, freq: f1 * formantA, pan: p);
	var b = GrainSin.ar(numChannels: 2, trigger: gtrg, dur: overlapB * (1.05 - e1.pow(2.5)) / f1, freq: f1 * formantB, pan: p);
	var c1 = fund * (lev * e1).pow(0.7);
	var c2 = a * (lev * e1).pow(f2.linlin(inMin: 50, inMax: 1500, outMin: 1.1, outMax: 1.5));
	var c3 = b * (lev * e1).pow(f2.linlin(inMin: 50, inMax: 1500, outMin: 1.5, outMax: 2.5));
	LeakDC.ar(in: Mix.ar([c1,c2,c3]), coef: 0.995)
};
Mix.ar(Voicer.ar(numVoices: 16, voiceFunc: voiceFunc)) * 0.25
