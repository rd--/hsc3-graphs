/* CurveGen ; https://audiomasher.org/patch/Y3OOFF */
let tEnvx = { :tr :atk :hld :rel |
	CurveGen(tr, [0 1 1 0], [atk hld rel], [0 0 -9])
};
let noteZero = MouseY(48, 75, 0, 0.2).rounded;
let decayTime = MouseX(2, 4, 0, 0.2);
let seq = Dseq(inf, [0 5 0 3 0 3 5 0 3] + noteZero);
let tr = Impulse(4, 0);
let osc = SinOsc(Demand(tr, 0, seq.MidiCps), 0) * 0.1;
let env = tEnvx(tr, 0.01, 0.1, 0.2) + tEnvx(PulseDivider(tr, 2, 0), 0.01, 0.1, 0.2);
let snd = osc * env # 2;
CombC(snd, 0.25, 0.25, decayTime) * 0.4 + snd
