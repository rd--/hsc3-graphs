// f0 ; https://sccode.org/1-5eN ; requires=GlitchRHPF
var s = GbmanN.ar([2300, 1150], 1.2, 2.1);
var f0 = Pulse.ar(
	4,
	[1, 2] / 8,
	1,
	LFPulse.ar(1/8, 0, 0.5) / 5 + 1
);
var f1 = LFSaw.ar(f0, 0) + 2;
GlitchRHPF.ar(s, f1, 1) * 0.05

// f0 ; https://sccode.org/1-5eN
{GlitchRHPF.ar(GbmanN.ar([2300,1150]),LFSaw.ar(Pulse.ar(4,[1,2]/8,1,LFPulse.ar(1/8)/5+1))+2) * 0.05}
