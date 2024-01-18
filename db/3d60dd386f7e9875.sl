{- Rise fall pad ; requires=voicer -}
Voicer(1, 16) { :e |
	let mnn = e.x * 24 + 48;
	let freq = mnn.MidiCps;
	let gate = e.w;
	let osc1 = Saw(freq + LfTri(0.3, 0));
	let osc2 = Saw((mnn - 0.03).MidiCps);
	let filterEnv = Adsr(gate, 1, 1.4, 0.05, 0.2, 0);
	let ampEnv = Adsr(gate, 0.1, 0.01, 0.6, 1.5, 0) * e.z;
	Pan2(Rlpf(osc1 + osc2, 3000 * filterEnv + freq, 1.5), e.i * 2 - 1, ampEnv)
}.Mix
