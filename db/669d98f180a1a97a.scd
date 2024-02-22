// SinOsc ; random stereo
{ SinOsc.ar(IRand(48, 72).midicps, 0) * Rand(0.05, 0.1) } ! 2
