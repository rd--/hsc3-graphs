// http://www.fredrikolofsson.com/f0blog/?q=node/537 ; graph rewrite (rd)
var n1 = [0, 0, 0, 0, 0, 0, 0, 3, 4, 6, 4, 0, 3, 2, 0, 0, 0, 0, 1, 6, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 3];
var n2 = [1, 1, 2, 0, 0, 3, 3, 0, 0, 3, 4, 0, 1, 3, 0, 0, 0, 0, 1, 0, 1, 7, 0, 0, 5, 6, 3, 0, 4, 0, 9, 0];
var n = n1 ++ n2;
var b = [0, 2, 4, 5, 7, 9, 11].asLocalBuf;
var t = Impulse.kr(4, 0);
var m = DegreeToKey.kr(b, Demand.kr(t, 0, Dseq(n, inf)), 12);
var e = Decay2.kr(t, 0.01, TRand.kr(0.15, 0.5, t));
{ CombC.ar((Blip.ar((48 + m + TRand.kr(0, 0.05, t)).midicps, TRand.kr(1, 7, t)) * e * 8).tanh / 8, 1, 1, 8) * TRand.kr(0.05, 0.15, t) }.dup
