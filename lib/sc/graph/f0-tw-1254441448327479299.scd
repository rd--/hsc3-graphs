// https://twitter.com/redFrik/status/1254441448327479299

play{ar(FreeVerb,ar(Splay,ar(SinOscFB,ar(DegreeToKey,as(b=[1,3,5,8,10],LocalBuf),ar(Duty,(e=[3,2/3,4,3/2,2])/(12**ar(a=LFTri,b*c=0.021)),0,ar(a,b*c)*7+20+Dseq(b%(ar(a,b*c)*5+6),inf))).midicps,ar(a,c/b)+1/3,ar(Decay2,ar(Impulse,e@@b),c,d=ar(a,b/999)%1)*d)),0.1,1)}

play
{b=[1,3,5,8,10]
;e=[3,2/3,4,3/2,2]
;a=LFTri
;c=0.021
;d=ar(a,b/999)%1
;f=ar(DegreeToKey,as(b,LocalBuf),ar(Duty,e/(12**ar(a,b*c)),0,ar(a,b*c)*7+20+Dseq(b%(ar(a,b*c)*5+6),inf))).midicps
;o=ar(SinOscFB,f,ar(a,c/b)+1/3,ar(Decay2,ar(Impulse,e@@b),c,d)*d)
;ar(FreeVerb,ar(Splay,o),0.1,1)}
