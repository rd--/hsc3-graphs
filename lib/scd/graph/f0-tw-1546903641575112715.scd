// https://twitter.com/redFrik/status/1546903641575112715 ; wait
var b = Scale.yu(\mean5).semitones;
var k = DegreeToKey.ar(b.asLocalBuf, 2 ** StandardL.ar(StandardL.ar(b + 1 / 32, b + 1, 0.5, 0), b / 7 + 1, 0.5, 0) * 12, 12);
var f1 = (k + 36 - (StandardL.ar(1 / 32, 1, 0.5, 0) > 0)).midicps;
var f2 = StandardL.ar(b / 8 + 8, b / 5 + 1, 0.5, 0);
var fb = StandardL.ar(1 / 3, b / 8 + 1, 0.5, 0) + 1 / 3;
var a = StandardL.ar(b + 2 / 32, b / 9 + 1, 0.5, 0).max(0) * AmpComp.kr(f1, 60.midicps, 1 / 3) / 16;
var x = Splay.ar(SinOscFB.ar(f1 + f2, fb) * a);
x  +  GVerb.ar(x, 99, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300)

// ---- calculations
Scale.yu(\mean5).semitones == [0, 3.084, 5.028, 6.972, 10.056]

// ---- original
play{x=ar(Splay,ar(SinOscFB,ar(a=StandardL,(b=Scale.yu(\mean5).semitones)/8+8,b/5+1)+f=midicps(ar(DegreeToKey,LocalBuf newFrom:b,2**ar(a,ar(a,b+1/32,b+1),b/7+1)*12)+36-(ar(a,1/32)>0)),ar(a,1/3,b/8+1)+1/3,ar(a,b+2/32,b/9+1).max*kr(AmpComp,f)/16));x+ar(GVerb,x,99)}// #SuperCollider
