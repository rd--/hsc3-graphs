// https://twitter.com/redFrik/status/839296011982024704
var t = LFSaw.ar(#[0.5, 0.6], 0);
var f = LFSaw.ar(5, 0) * LFSaw.ar(0.015, 0) + 1 * 98;
var m = (2 ** LFSaw.ar(4, 0)).round(0.5) * 99;
var i = 2 ** LFSaw.ar(1 / #[8, 9], 0) * 8;
var g = GrainFM.ar(1, t, 16, f, m, i, 0, -1, 512);
(g/2).tanh * 0.25

//----
{a=LFSaw;tanh(GrainFM.ar(1,a.ar([0.5,0.6]),16,a.ar(5)*a.ar(0.015)+1*98,round(2**a.ar(4),0.5)*99,2**a.ar(1/[8,9])*8)/2)}
