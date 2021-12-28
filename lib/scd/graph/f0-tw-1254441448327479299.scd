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

// rd (edit) ; f0 <https://twitter.com/redFrik/status/1254441448327479299>
var b = #[1, 3, 5, 8, 10];
var e = [3, 2/3, 4, 3/2, 2];
var c = 0.021;
var d = LFTri.ar(b / 999, 0) % 1;
var m = LFTri.ar(b * c, 0);
var l = m * 7 + 20 + Dseq.dr(b % m * 5 + 6, inf);
var j = Duty.ar(e / (12 ** m), 0, l);
var k = DegreeToKey.ar(b.asLocalBuf, j);
var o = SinOscFB.ar(k.midicps, LFTri.ar(c / b + 1 / 3, Decay2.ar(Impulse.ar(e.wrapAt(b), 0), c, d)) * d);
Out.kr(bus: 90, channelsArray: A2K.kr(k));
FreeVerb.ar(Splay.ar(o, 1, 1, 0, true), 0.1, 1, 0.5) * 0.2

//---- https://twitter.com/redFrik/status/1254441448327479299
{ar(FreeVerb,ar(Splay,ar(SinOscFB,ar(DegreeToKey,as(b=[1,3,5,8,10],LocalBuf),ar(Duty,(e=[3,2/3,4,3/2,2])/(12**ar(a=LFTri,b*c=0.021)),0,ar(a,b*c)*7+20+Dseq(b%(ar(a,b*c)*5+6),inf))).midicps,ar(a,c/b)+1/3,ar(Decay2,ar(Impulse,e@@b),c,d=ar(a,b/999)%1)*d)),0.1,1)}

//---- ; drawings
RCtlPlot.new(numFrames: 1200, numChannels: 5, indexZero: 90, plotFrames: 1200, delayTime: 1/20, drawRate: 5)
