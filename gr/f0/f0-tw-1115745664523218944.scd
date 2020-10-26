// https://twitter.com/redFrik/status/1115745664523218944

play{a=SinOsc;ar(HPF,ar(Splay,ar(CombC,ar(a,ar(Duty,c=2**ar(a,b=[1,2,6,3]+(ar(a,0.0345)<0)),0,Dseq(99*ar(a,1/b,0,b/3,b*(ar(a,0.0234)<0+1)).round,inf)),b,ar(a,1.5/c).max(ar(a,0.0123,0,0.5,-0.5))),1,7-b/12*(ar(a,c<0.6)%1+0.1),2**ar(a,ar(a,0.1,0,0.1),b,9))),9).tanh}

play
{var a = SinOsc
;var b = [1,2,6,3]+(ar(a,0.0345)<0)
;var c = 2**ar(a,b)
;var j = ar(a,1/b,0,b/3,b*(ar(a,0.0234)<0+1)).round
;var o = ar(a,ar(Duty,c,0,Dseq(99*j,inf)),b,ar(a,1.5/c).max(ar(a,0.0123,0,0.5,-0.5)))
;ar(HPF,ar(Splay,ar(CombC,o,1,7-b/12*(ar(a,c<0.6)%1+0.1),2**ar(a,ar(a,0.1,0,0.1),b,9))),9).tanh}
