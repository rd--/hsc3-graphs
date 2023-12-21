// https://sccode.org/1-51m (spz)
var voiceFunc = { | e |
	var amp = e.z;
	var gate = e.w;
	var attack = 0.3;
	var release = 0.3 + e.y;
	var osc = Pulse.ar((Rand.ir(-0.03, 0.05) + e.p.unitMidi).midiCps, 0.48 + LFNoise1.kr(0.06, 0.1)) * 0.2;
	var dst = Disintegrator.ar(osc, 0.5, 0.7) * (LFNoise2.kr(5) * 0.05 + 1);
	var env = EnvGen.ar(Env.asr(attack, 1.0, release, -4), gate, 1, 0, 1, 0);
	var snd = dst + (BPF.ar(dst, env.linexp(0, 1, 2000, 2442), 0.3) * 3);
	var flt = BHiShelf.ar(snd, 1200, 1, 3) * env;
	Pan2.ar(flt, 0, amp.lag(0.1))
};
Voicer(16, voiceFunc).sum
