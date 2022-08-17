// CombN
var m = LFNoise1.ar(3) * 24 + (LFSaw.ar(#[5, 5.123], 0) * 3 + 80);
CombN.ar(SinOsc.ar(m.midiCps, 0) * 0.4, 1, 0.3, 2)
