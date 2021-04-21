// https://twitter.com/redFrik/status/1374139774269857798
{var a = SinOscFB
;var b = [1,0.5,1.25]
;var c = ar(a,3)>0
;var x = ar(a,ar(a,1/64)<0*9+50,ar(a,1/8)+1/2,ar(HPF,c,4,5))!2
;var f0 = ar(Demand,ar(a,1/12),0,Dseq([1,1,2,3,4,1]*(ar(a,1/96)<0.5*19+99),inf)*b).lag3ud(1,3)
;var y = ar(Splay,ar(a,f0,ar(a,b/16)+1/3))
;var z = ar(HPF,c>0.1,9**ar(a,1/19)+3)*ar(a,[12,9]*99)/6
;tanh(x+y+z)*0.1}
