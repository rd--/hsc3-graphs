// f0 <https://twitter.com/redFrik/status/1367808902457397250>
{var yu = Scale.new(#[0,3,5,7,10], 12, name: "Yu")
;var dgr = \fredaglunch.ascii%12 // [6,6,5,4,1,7,0,9,2,3,8]
;var rat = {arg i; yu.degreeToRatio(dgr[i],5)} ! 11 // [76,76,64,57,38,85,32,114,43,48,96]
;var f =
 {arg i
 ;var f0 = rat[i] * (SinOsc.ar(1/16,0) > 0 * 2 + 6 - (SinOsc.ar(SinOsc.ar(1/32,i),0) / 20))
 ;var z = SinOsc.ar(f0,0) / 9
 ;var x = floor(SinOsc.ar(1/64,0) * 6 + 6).varlag(0.1,0,5)
 ;var y = varlag(SinOsc.ar(SinOsc.ar(1/4,i/11 * pi) < 0 * 2) * 0.1,0.01,SinOsc.ar(0.01,i),5)
 ;var dly = (i + x) % 11 / 33 + 0.1 + y
 ;var dcy = SinOsc.ar(1/9,0)+1
 ;ar(CombC,z,0.5,dly,dcy)}
;ar(Splay,f!11,1,1,0,true).tanh}

//---- drawings ; Dot.useTables = false
