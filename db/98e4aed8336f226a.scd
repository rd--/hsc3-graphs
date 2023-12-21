// MoogFF
var voiceFunc = { | e |
    var freq = e.x.unitCps;
    var osc = Mix.fill(8) {
		Saw.ar(freq * TRand.kr(0.99, 1.01, e.w)) * 0.75
	};
    var filterEnv = EnvGen.ar(Env.adsr(0.02, 0.1, 0.05, 1, 1, -4, 0), e.w, 1, 0, 1, 0);
    MoogFF.ar(osc, e.y * 750 + 250 * filterEnv, e.j * 4, 0) * e.w.lagud(0.01, 4) * 2
};
Splay.ar(Voicer.ar(16, voiceFunc))
