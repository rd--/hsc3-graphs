// f0 ; https://sccode.org/1-5eN
{var s = GbmanN.ar(freq: [2300,1150], xi: 1.2, yi: 2.1)
;var f0 = Pulse.ar(freq: 4, width: [1,2] / 8, mul: 1, add: LFPulse.ar(freq: 1/8, iphase: 0, width: 0.5) / 5 + 1)
;var f1 = LFSaw.ar(freq: f0, iphase: 0) + 2
;GlitchRHPF.ar(in: s, freq: f1, rq: 1) * 0.05}

// f0 ; https://sccode.org/1-5eN
{GlitchRHPF.ar(GbmanN.ar([2300,1150]),LFSaw.ar(Pulse.ar(4,[1,2]/8,1,LFPulse.ar(1/8)/5+1))+2) * 0.05}
