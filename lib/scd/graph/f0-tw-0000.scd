// https://sccode.org/1-4Qy f0
var c = GbmanN.ar([2300, 1150], 1.2, 2.1);
var f = LFSaw.ar(Pulse.ar(4, [1, 2] / 8) + (LFPulse.ar(1 / 8, 0, 0.5) / 5 + 1), 0) + 2;
GlitchRHPF.ar(c, f, 1).clip2(1) * 0.05

//----tweet0000
GlitchRHPF.ar(GbmanN.ar([2300,1150]),LFSaw.ar(Pulse.ar(4,[1,2]/8,1,LFPulse.ar(1/8)/5+1))+2)
