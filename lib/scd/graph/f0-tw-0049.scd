// tw 0049 (f0)
var o0 = LFSaw.ar(3, 0) * 9 + 99;
var s0 = Sweep.ar(0, 7.iota + 3) % o0;
var s1 = Sweep.ar(0, 31.iota * -1 + 33) % 128 & s0;
var o1 = SinOsc.ar((s1 + 33).midicps, 0) * pi;
Splay.ar(SinOsc.ar(9, o1)) / 3

//---- calculations
3.to(9) == (7.iota + 3) // [3, 4, 5, 6, 7, 8, 9]
33.to(3,-1) == 31.iota(33,-1) // [33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3]
33.series(32,3) == (31.iota * -1 + 33) // as above
