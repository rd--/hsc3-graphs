// risefallpad ; https://github.com/cianoc/supercollider_fragments
{var freq = 440
;var gate = 1
;var osc1 = Saw.ar(freq + LFTri.kr(0.3, 0, 1))
;var osc2 = Saw.ar((freq.cpsmidi - 0.03).midicps)
;var filterEnv = EnvGen.kr(Env.adsr(1, 0.7, 0.0, 0.2), gate)
;var ampEnv = EnvGen.ar(Env.adsr(0.1, 0.01, 0.6, 1.5), gate)
;RLPF.ar(osc1 + osc2, 3000 *filterEnv + freq, 1.5) * ampEnv}
