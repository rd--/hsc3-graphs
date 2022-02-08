// sc-140 ; 19 ; MCLD
a=[0.02,0.1,1,2,3,4]; k=LFPar.kr(a+0.5).sum; f=Latch.kr(k,Impulse.kr(a)); Splay.ar(SinOsc.ar(f*100+300)/5) // #supercollider
