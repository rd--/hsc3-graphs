(* tw 0125 (f0) *)
var f = SinOsc(1 / [8, 9], 0) * 4 + [400, 202];
var u = SinOsc(1 / 9, 0) + 1 / 88;
var d = SinOsc(1 / 8, 0) + 1 / 99;
var i = InFeedback(1, [1, 0]);
var p = CombC(i.LagUd(u, d), 1, 0.08, 9);
SinOsc(f, p) * 0.25
