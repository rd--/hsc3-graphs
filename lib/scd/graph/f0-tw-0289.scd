// https://sccode.org/1-4Qy ; f0 ; 0289
var b = 1.to(50);
var t = Impulse.ar(b / 49, 0);
GVerb.ar(SinOscFB.ar(33 * b, LagUD.ar(t, 0.005, 0.2) * 99, LagUD.ar(t, 0.007, 1)).sum, 299, 9, 0.01, 0.5, 6, 1, 1, 1, 300)

// ---- tweet0289
GVerb.ar(sum(SinOscFB.ar(33*b=(1..50),lagud(t=Impulse.ar(b/49),5e-3,0.2)*99,t.lagud(7e-3,1))),299,9,0.01,0.5,6,1,1,1)
