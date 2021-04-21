// https://twitter.com/redFrik/status/1367808902457397250
{var a = SinOsc
;var f =
 {arg i
 ;var f0 = Scale.yu.degreeToFreq(\fredaglunch.ascii%12@i,ar(a,1/16)>0*2+6-(ar(a,ar(a,1/32,i))/20),5)
 ;var dt = i+floor(ar(a,1/64)*6+6).varlag(0.1)%11/33+0.1+varlag(ar(a,ar(a,1/4,i/11*pi)<0*2)*0.1,0.01,ar(a,0.01,i))
 ;ar(CombC,ar(a,f0)/9,0.5,dt,ar(a,1/9)+1)}
;ar(Splay,f!11).tanh}
