// https://sccode.org/1-4Qy ; f0 ; 0270
var d = InFeedback.ar(0, 1);
var f = 1 / [9, 8.9];
var c = Lag.ar(Amplitude.ar(d, 0.01, 0.01) < SinOscFB.ar(f, 0), f / 9) + d;
AllpassN.ar(SinOscFB.ar(98.5 + c, d + f) * c, 1, f * 3, 20).tanh
