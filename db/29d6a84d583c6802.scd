// f0 ; https://twitter.com/redFrik/status/1395878538297892865
{tanh(ar(f=CombN,c=ar(RLPF,ar(a=SinOscFB,ar(Demand,t=Impulse ar:5,0,Dseq(midicps(flat([24,0,3,5,7,10,36]+.t[36,48,36,33,60,72])),inf)/g=[3,2]),a ar:0.02,e=t.lagud(1e-3,SinOscFB.ar(g/99)+1.08)),3**SinOscFB.ar(0.04)+e*2e3,3**SinOscFB.ar(g/9)/3,4).tanh,1,1/2,4)+ar(f,c,1,1/3,5)/8+c) * 0.1}
