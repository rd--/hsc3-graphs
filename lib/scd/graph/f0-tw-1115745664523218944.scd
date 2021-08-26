// https://twitter.com/redFrik/status/1115745664523218944
{var a = SinOsc
;var b = [1,2,6,3]+(a.ar(0.0345)<0)
;var c = 2**a.ar(b)
;var j = a.ar(1/b,0,b/3,b*(a.ar(0.0234)<0+1)).round
;var o = a.ar(Duty.ar(c,0,Dseq.new(99*j,inf)),b,a.ar(1.5/c).max(a.ar(0.0123,0,0.5,-0.5)))
;var z = CombC.ar(o,1,7-b/12*(a.ar(c<0.6)%1+0.1),2**a.ar(a.ar(0.1,0,0.1),b,9))
;HPF.ar(Splay.ar(z),9).tanh * 0.2}

//----
{var a = SinOsc
;var b = [1,2,6,3]+(ar(a,0.0345)<0)
;var c = 2**ar(a,b)
;var j = ar(a,1/b,0,b/3,b*(ar(a,0.0234)<0+1)).round
;var o = ar(a,ar(Duty,c,0,Dseq(99*j,inf)),b,ar(a,1.5/c).max(ar(a,0.0123,0,0.5,-0.5)))
;var z = ar(CombC,o,1,7-b/12*(ar(a,c<0.6)%1+0.1),2**ar(a,ar(a,0.1,0,0.1),b,9))
;ar(HPF,ar(Splay,z),9).tanh * 0.2}
