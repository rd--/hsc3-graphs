// https://sccode.org/1-4Qy ; f0 ; 0346
var c = SinOscFB.ar(1 - SinOscFB.ar(1 / [3, 2], 0).roundTo(0.5) + InFeedback.ar(0, 2), 0);
(SinOscFB.ar(2 ** SinOscFB.ar(1 - c, 0).roundTo(1 - c) * 400, c.abs) * Lag(c, 0.1) * c).tanh
