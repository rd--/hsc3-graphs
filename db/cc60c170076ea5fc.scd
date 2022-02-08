// https://twitter.com/redFrik/status/1254441448327479299
var b = #[1, 3, 5, 8, 10];
var e = [3, 2 / 3, 4, 3 / 2, 2];
var c = 0.021;
var d = LFTri.ar(b / 999, 0) % 1;
var m = LFTri.ar(b * c, 0);
var l = m * 7 + 20 + Dseq.dr(b % (m * 5 + 6), inf);
var j = Duty.ar(e / (12 ** m), 0, l, 0);
var f = DegreeToKey.ar(b.asLocalBuf, j, 12).midicps;
var o = SinOscFB.ar(f, LFTri.ar(c / b, 0) + 1 / 3) * Decay2.ar(Impulse.ar(e.wrapAt(b)), c, d) * d;
FreeVerb.ar(Splay.ar(o, 1, 1, 0, true), 0.1, 1)
