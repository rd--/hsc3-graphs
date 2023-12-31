// nv https://swiki.hfbk-hamburg.de/MusicTechnology/899
var s = LocalIn.ar(2, 0) * 7.5 + (Saw.ar(#[32, 33]) * 0.2);
var f = 2 ** (LFNoise0.kr(4 / 3) * 4) * 300;
var a = CombN.ar(BPF.ar(s, f, 0.1).distort, 2, 2, 40);
a <! LocalOut.ar(a)
