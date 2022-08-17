// NamedControl ; non-argument notation controls
var freq = NamedControl.ir(name: "freq", values: 220.0);
SinOsc.ar(freq: freq, phase: 0, mul: 0.10)
