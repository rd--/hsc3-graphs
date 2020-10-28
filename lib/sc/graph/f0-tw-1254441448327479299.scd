// https://twitter.com/redFrik/status/1254441448327479299
{var b = [1,3,5,8,10]
;var e = [3,2/3,4,3/2,2]
;var a = LFTri
;var c = 0.021
;var d = ar(a,b/999)%1
;var j = ar(Duty,e/(12**ar(a,b*c)),0,ar(a,b*c)*7+20+Dseq(b%(ar(a,b*c)*5+6),inf))
;var f = ar(DegreeToKey,as(b,LocalBuf),j).midicps
;var o = ar(SinOscFB,f,ar(a,c/b)+1/3,ar(Decay2,ar(Impulse,e@@b),c,d)*d)
;ar(FreeVerb,ar(Splay,o),0.1,1)}.play
