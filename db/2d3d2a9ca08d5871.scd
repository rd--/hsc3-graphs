// nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899
var x = [[4, 4.5], [2, 3, 5, 6]];
var z = x.performBinaryOp('*', x.performBinaryOp('*', x, 'x').allTuples, 'x');
var y = (z * 4).flat.clump(2) ++ 0;
var f = Duty.ar(1 / 5, 0, Dseq(y, 1), 0);
GVerb.ar(VarSaw.ar(f, 0, 0.9) * LFPulse.ar(5, 0, 0.5), 99, 5) / 15
