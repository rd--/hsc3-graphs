// LinSeg
var tr = Impulse.ar(1 / 3, 0);
var f0 = TRand.ar(110, 440, tr);
var f1 = TRand.ar(110, 440, tr);
SinOsc.ar(LinSeg.ar(tr, [f0, 1, f1, 2, f0]), 0) * LinSeg.ar(tr, [0, 0.01, 0.1, 3, 0.01])
