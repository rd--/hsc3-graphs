// https://sccode.org/1-4Qy ; f0 ; 0357
var c = 1 / [31, 23];
var b = VarSaw.ar(c, 0, 0.5);
var o = VarSaw.ar((VarSaw.ar([7, 6], 0, 0.5) < 0 + b) > 1 + 1 * 99, 0, 1 - b / 2) % b;
HPF.ar(BLowPass4.ar(o, 4 ** VarSaw.ar(c, 0, 0.5) * 666, 0.08).sin / 2, 9)
