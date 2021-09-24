// RandRange (BinaryOp)
{var c = NamedControl.ir(name: "c", values: 220.0);
SinOsc.ar(freq: c.rrand(c * 2), phase: 0, mul: 0.10)}
