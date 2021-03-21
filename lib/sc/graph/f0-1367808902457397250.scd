// f0 <https://twitter.com/redFrik/status/1367808902457397250>
{var a = SinOsc
;var yu = Scale.new(#[0,3,5,7,10], 12, name: "Yu")
;var dgr = [6,6,5,4,1,7,0,9,2,3,8] // \fredaglunch.ascii%12
;var rat = [76,76,64,57,38,85,32,114,43,48,96] // {arg i; yu.degreeToRatio(dgr[i],5)} ! 11
;var f =
 {arg i
 ;var f0 = (rat[i]) * (ar(a,1/16)>0*2+6-(ar(a,ar(a,1/32,i))/20))
 ;var z = ar(a,f0)/9
 ;var dly = i+floor(ar(a,1/64)*6+6).varlag(0.1)%11/33+0.1+varlag(ar(a,ar(a,1/4,i/11*pi)<0*2)*0.1,0.01,ar(a,0.01,i))
 ;var dcy = ar(a,1/9)+1
 ;ar(CombC,z,0.5,dly,dcy)}
;rat.postln
;ar(Splay,f!11).tanh}
