// nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899
var x = [[4, 4.5], [2, 3, 5, 6]];
var z = x.performBinaryOp('*', x.performBinaryOp('*', x, 'x').allTuples, 'x');
var y = (z * 4).flat.clump(2) ++ 0;
var f = Duty.ar(1 / 5, 0, Dseq(y, 1), 0);
GVerb.ar(VarSaw.ar(f, 0, 0.9) * LFPulse.ar(5, 0, 0.5), 99, 5) / 15

//---- nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899 ; keywords
var x = [[4, 4.5], [2, 3, 5, 6]];
var y = (x *.x (x *.x x).allTuples * 4).flat.clump(2) ++ 0;
var f = Duty.ar(dur: 1/5, reset: 0, level: Dseq(list: y, repeats: 1), doneAction: 0);
GVerb.ar(in: VarSaw.ar(freq: f, iphase: 0, width: 0.9) * LFPulse.ar(freq: 5, iphase: 0, width: 0.5), roomsize: 99, revtime: 5) / 15

//---- nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899
{GVerb.ar(VarSaw.ar(Duty.ar(1/5, 0, Dseq(x=[[4, 4.5], [2, 3, 5, 6]];flat(x*.x allTuples(x*.x x)*4).clump(2)++0)), 0, 0.9)*LFPulse.ar(5), 99, 5)/5}

//---- calculations
x = [[4, 4.5], [2, 3, 5, 6]]
(x *.t x) == [[[16, 18], [9, 13.5, 22.5, 27]], [[8, 9], [6, 9, 15, 18], [20, 22.5], [12, 18, 30, 36]]]
(x *.t x) == x.collect({ arg item; item * x })
(x *.x x) == [[16, 20.25], [8, 13.5, 20, 27.0], [8, 13.5, 20, 27.0], [4, 9, 25, 36]]
(x *.x x) == x.performBinaryOp('*', x, 'x')
[[0, 1], [2, 3]].allTuples == [[0, 2], [0, 3], [1, 2], [1, 3]]
[[0, 1], [2, 3, 4, 5]].allTuples == [[0, 2], [0, 3], [0, 4], [0, 5], [1, 2], [1, 3], [1, 4], [1, 5]]
[[0, 1], [2, 3], [4, 5]].allTuples == [[0, 2, 4], [0, 2, 5], [0, 3, 4], [0, 3, 5], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5]]
[[16, 20.25], [8, 13.5, 20, 27.0], [8, 13.5, 20, 27.0], [4, 9, 25, 36]].allTuples.size == (2 * 4 * 4 * 4)
r = x *.x (x *.x x).allTuples * 4
r.size == 256
r.collect(_.size).asSet == [4].asSet
r.plot
r.flat.plot
