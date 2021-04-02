// f0 <https://twitter.com/redFrik/status/1367808902457397250>
{var yu = Scale.new(#[0,3,5,7,10], 12, name: "Yu")
;var dgr = \fredaglunch.ascii%12
;var rat = {arg i; yu.degreeToRatio(dgr[i],5)} ! 11
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

// https://twitter.com/redFrik/status/1367808902457397250
{var a = SinOsc
;var f =
 {arg i
 ;var f0 = Scale.yu.degreeToFreq(\fredaglunch.ascii%12@i,ar(a,1/16)>0*2+6-(ar(a,ar(a,1/32,i))/20),5)
 ;var dt = i+floor(ar(a,1/64)*6+6).varlag(0.1)%11/33+0.1+varlag(ar(a,ar(a,1/4,i/11*pi)<0*2)*0.1,0.01,ar(a,0.01,i))
 ;f0.postln
 ;ar(CombC,ar(a,f0)/9,0.5,dt,ar(a,1/9)+1)}
;ar(Splay,f!11).tanh}

// https://twitter.com/redFrik/status/1367808902457397250
{ar(Splay,{|i|ar(CombC,ar(a=SinOsc,Scale.yu.degreeToFreq(\fredaglunch.ascii%12@i,ar(a,1/16)>0*2+6-(ar(a,ar(a,1/32,i))/20),5))/9,0.5,i+floor(ar(a,1/64)*6+6).varlag(0.1)%11/33+0.1+varlag(ar(a,ar(a,1/4,i/11*pi)<0*2)*0.1,0.01,ar(a,0.01,i)),ar(a,1/9)+1)}!1).tanh}.asSynthDef.writeDefFile("/tmp")

//---- scale degrees and frequency ratios
(\fredaglunch.ascii%12) == [6, 6, 5, 4, 1, 7, 0, 9, 2, 3, 8]
(\fredaglunch.ascii%12).collect({arg dgr; Scale.yu.degreeToRatio(dgr,5)})

//---- drawings ; Dot.useTables = false
