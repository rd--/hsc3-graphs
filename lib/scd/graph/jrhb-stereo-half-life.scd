// stereo half-life (jrhb)
var tHalf = 3.92; // Radon-219, discovered 1904 by Giesel and Debierne.
var nAtoms = 1e+5; // ca. 3.6e-14 mg
var n = 0.max(nAtoms - PulseCount.ar(LocalIn.ar(2, 0), 0));
var activity = Dust.ar( n * 2.log / tHalf);
activity <! LocalOut.ar(activity) * 0.2
