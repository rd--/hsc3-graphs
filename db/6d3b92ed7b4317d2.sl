;; risefallpad ; https://github.com/cianoc/supercollider_fragments ; requires=voicer
var vc = { :e |
	var mnn = e.x * 24 + 48;
	var freq = mnn.MidiCps;
	var gate = e.w;
	var osc1 = Saw(freq + LfTri(0.3, 0));
	var osc2 = Saw((mnn - 0.03).MidiCps);
	var filterEnv = Adsr(gate, 1, 1.4, 0.05, 0.2, 0);
	var ampEnv = Adsr(gate, 0.1, 0.01, 0.6, 1.5, 0) * e.z;
	Pan2(Rlpf(osc1 + osc2, 3000 * filterEnv + freq, 1.5), e.o * 2 - 1, ampEnv)
};
Voicer(16, vc).sum
