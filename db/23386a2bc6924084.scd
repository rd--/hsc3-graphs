// SinOsc ; random stereo
{ SinOsc.ar(IRand.ir(48, 72).midicps, 0) * Rand.ir(0.05, 0.1) } ! 2
