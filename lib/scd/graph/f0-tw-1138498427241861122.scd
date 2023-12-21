// https://twitter.com/redFrik/status/1138498427241861122 (f0)
var f = 9.sqrt;
var b = [f, 9.999];
var d = SinOscFB.ar(b / 99, 0).max(0);
var t1 = (SinOscFB.ar(SinOscFB.ar(9/999, 0), 0) > SinOscFB.ar(9/99, 0)).if(f, 9 / b);
var t2 = (SinOscFB.ar(9/99, 0) < SinOscFB.ar(99/9999, 0)).if(b / 9, f);
var f1 = (9.9 * b * t1 * t2).lag(0.1);
var s1 = SinOscFB.ar(f1, d) * SinOscFB.ar(b / 9, 0) * d;
var c = PitchShift.ar(s1, 9 / b, 9 / b.sqrt, b / 999, b / 99);
var s2 = GVerb.ar(c * d * d * d, 99, 9, 9 / 999, 0.5, 15, 1, 0.7, 0.5, 300);
var s3 = s2 / 9 + PitchShift.ar(c, f / 9, f / 9, 0, 0);
HPF.ar(Splay.ar(s3), 9) * 0.5

// ----
{var f = sqrt(9)
;var b = [f,9.999]
;var e = PitchShift
;var a = SinOscFB
;var d = max(ar(a,b/99,0),0)
;var t1 = if(ar(a,ar(a,9/999)) > ar(a,9/99),f,9/b)
;var t2 = if(ar(a,9/99) < ar(a,99/9999),b/9,f)
;var f1 = lag(9.9 * b * t1 * t2,0.1)
;var s1 = ar(a,f1,d) * ar(a,b/9,0) * d
;var c = ar(e,s1,9/b,9/sqrt(b),b/999,b/99)
;var s2 = ar(GVerb,c * d * d * d,99,9,9/999)
;var s3 = s2/9 + ar(e,c,f/9,f/9)
;ar(HPF,ar(Splay,s3),9) * 0.5}
