// tw 0125 (f0)
var f = SinOsc.ar(1 / [8, 9], 0) * 4 + [400, 202];
var u = SinOsc.ar(1 / 9, 0) + 1 / 88;
var d = SinOsc.ar(1 / 8, 0) + 1 / 99;
var i = InFeedback.ar([1, 0], 1);
var p = CombC.ar(i.lagud(u, d), 1, 0.08, 9);
SinOsc.ar(f, p) * 0.25

// ---- tw 0125 (f0)
var a = SinOsc;
var f = a.ar(1/[8,9])*4+[400,202];
var u = a.ar(1/9)+1/88;
var d = a.ar(1/8)+1/99;
var i = InFeedback.ar([1,0]);
var p = CombC.ar(i.lagud(u,d),1,0.08,9);
a.ar(f,p) * 0.25
