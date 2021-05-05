// Rand (UnaryOp)
{var c = NamedControl.ir(name: "c", values: 220.0); SinOsc.ar(freq: c.rand + c, phase: 0, mul: 0.10)}
