// AnalogFoldOsc
LPF.ar(AnalogFoldOsc.ar(60 + #[0, 1], SinOsc.ar(LFSaw.ar(0.1, 0) * 4, 0).range(0, 1)), 1330)
