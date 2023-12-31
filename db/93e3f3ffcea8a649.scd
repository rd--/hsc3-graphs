// half life (jrhb);
var tHalf = 3.92;
var nAtoms = 100000;
var n = 0.max(nAtoms - PulseCount.ar(LocalIn.ar(2), 0));
var activity = Dust.ar(n * 2.log / tHalf);
activity <! LocalOut.ar(activity) * 0.2
