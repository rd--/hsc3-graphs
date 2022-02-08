// LinSeg
var tr = Impulse.ar(1 / 6, 0);
SinOsc.ar(LinSeg.ar(tr, [220, 1, 880, 5, 220]), 0) * LinSeg.ar(tr, [0, 0.001, 0.1, 6, 0.001])
