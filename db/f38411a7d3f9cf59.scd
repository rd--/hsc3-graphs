// AnalogFoldOsc
{LPF.ar(AnalogFoldOsc.ar(freq: 60 + [0, 1], amp: SinOsc.ar(LFSaw.kr(0.1) * 4).range(0.0,1.0)), 1330)}
