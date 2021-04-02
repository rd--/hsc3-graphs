// https://twitter.com/redFrik/status/1254441448327479299
{var b = [1,3,5,8,10]
;var e = [3,2/3,4,3/2,2]
;var a = LFTri
;var c = 0.021
;var d = ar(a,b/999)%1
;var l = ar(a,b*c)*7+20+Dseq(b%(ar(a,b*c)*5+6),inf)
;var j = ar(Duty,e/(12**ar(a,b*c)),0,l)
;var f = ar(DegreeToKey,as(b,LocalBuf),j).midicps
;var o = ar(SinOscFB,f,ar(a,c/b)+1/3,ar(Decay2,ar(Impulse,e@@b),c,d)*d)
;ar(FreeVerb,ar(Splay,o),0.1,1)}

// https://twitter.com/redFrik/status/1254441448327479299
{ar(FreeVerb,ar(Splay,ar(SinOscFB,ar(DegreeToKey,as(b=[1,3,5,8,10],LocalBuf),ar(Duty,(e=[3,2/3,4,3/2,2])/(12**ar(a=LFTri,b*c=0.021)),0,ar(a,b*c)*7+20+Dseq(b%(ar(a,b*c)*5+6),inf))).midicps,ar(a,c/b)+1/3,ar(Decay2,ar(Impulse,e@@b),c,d=ar(a,b/999)%1)*d)),0.1,1)}

// rd (edit) ; f0 <https://twitter.com/redFrik/status/1254441448327479299>
{var b = [1, 3, 5, 8, 10]
;var e = [3, 2/3, 4, 3/2, 2]
;var c = 0.021
;var d = LFTri.ar(b / 999, 0) % 1
;var l = LFTri.ar(b * c, 0) * 7 + 20 + Dseq(b % (LFTri.ar(b * c, 0) * 5 + 6), inf)
;var j = Duty.ar(e / (12 ** LFTri.ar(b * c, 0)), 0, l)
;var k = DegreeToKey.ar(LocalBuf.newFrom(b), j)
;var o = SinOscFB.ar(k.midicps, LFTri.ar(c / b + 1 / 3, Decay2.ar(Impulse.ar(e @@ b, 0), c, d)) * d)
;FreeVerb.ar(Splay.ar(o,1,1,0,true), 0.1, 1, 0.5) * 0.2}

//-----
[3,2/3,4,3/2,2] @@ [1,3,5,8,10]
