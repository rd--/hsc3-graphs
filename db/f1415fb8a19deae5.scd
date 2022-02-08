// Rand2 (UnaryOp)
var c = NamedControl.ir(name: "c", values: 220.0);
SinOsc.ar(freq: c * 2 + c.rand2, phase: 0, mul: 0.10)
