// sc-140 ; 01 ; Nathaniel Virgo
LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a//#supercollider

// sc-140 ; 02 ; LFSaw
Splay.ar(Ringz.ar(Impulse.ar([2, 1, 4], [0.1, 0.11, 0.12]), [0.1, 0.1, 0.5])) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2)

// sc-140 ; 03 ; Tim Walters
({|k|({|i|y=SinOsc;y.ar(i*k*k,y.ar(i*k**i/[4,5])*Decay.kr(Dust.kr(1/4**i),y.ar(0.1)+1*k+i,k*999))}!8).product}!16).sum//#supercollider

// sc-140 ; 05 ; Batuhan Bozkurt
f=LocalIn.ar(2).tanh;k=Latch.kr(f[0].abs,Impulse.kr(1/4));LocalOut.ar(f+CombC.ar(Blip.ar([4,6],100*k+50,0.9),1,k*0.3,50*f));f//44.1kHz

// sc-140 ; 07 ; Thor Magnusson
x=SinOsc;y=LFNoise0;a=y.ar(8);(x.ar(Pulse.ar(1)*24)+x.ar(90+(a*90))+MoogFF.ar(Saw.ar(y.ar(4,333,666)),a*XLine.ar(1,39,99,99,0,2)))!2/3

// sc-140 ; 09 ; MCLD
LocalOut.ar(a=DynKlank.ar(`[LocalIn.ar.clip2(LFPulse.kr([1,2,1/8]).sum/2)**100*100],Impulse.ar(10)));HPF.ar(a).clip2

// sc-140 ; 11 ; Micromoog
VarSaw.ar((Hasher.ar(Latch.ar(SinOsc.ar((1..4)!2),Impulse.ar([5/2,5])))*300+300).round(60),0,LFNoise2.ar(2,1/3,1/2))/5//#supercollider

// sc-140 ; 12 ; Jose Padovani
x=165;b=SinOsc;p=Trig.ar(Saw.ar(x),1);y=b.ar(p*x);z=b.ar(p);(GVerb.ar(GrainIn.ar(2,y,y/2,z,p*z,-1),9))/9//basso gettato #SuperCollider

// sc-140 ; 13 ; Batuhan Bozkurt
LeakDC.ar(BRF.ar(Saw.ar(8,Decay2.kr(x=Duty.kr(1/8,0,Drand([0,Drand((0.4,0.5..1))],inf)),0.01,0.3))**1.5,x*20+[45.1,45],0.1)).tanh//#sc

// sc-140 ; 15 ; Jason Dixon
x=Array.fill(5,{[0.00001,0.03].asSpec.map(LFNoise2.kr(3))});Splay.ar(Friction.ar(LFTri.ar(50),friction:x,mass:x*30000))

// sc-140 ; 16 ; Batuhan Bozkurt
AllpassC.ar(SinOsc.ar(55).tanh,0.4,TExpRand.ar(2e-4, 0.4,Impulse.ar(8)).round([2e-3,4e-3]),2)// #supercollider with bass please...

// sc-140 ; 17 ; redFrik
RHPF.ar(GbmanN.ar([2300,1150]),LFSaw.ar(Pulse.ar(4,[1,2]/8,1,LFPulse.ar(1/8)/5+1))+2) //punk (loud!)

// sc-140 ; 18 ; Nathaniel Virgo
p=PinkNoise.ar(1!2);BRF.ar(p+Blip.ar(p+2,400),150,2,0.1)+LPF.ar(FreeVerb2.ar(*LPF.ar(p+0.2*Dust.ar(0.1),60)++[1,1,0.2,1e4]).tanh,2000)

// sc-140 ; 19 ; MCLD
a=[0.02,0.1,1,2,3,4]; k=LFPar.kr(a+0.5).sum; f=Latch.kr(k,Impulse.kr(a)); Splay.ar(SinOsc.ar(f*100+300)/5) // #supercollider

// sc-140 ; 20 ; Sciss
2.collect{RecordBuf.ar(Limiter.ar(HPF.ar(Convolution2.ar(k=Crackle.ar(l=Line.kr(1,2,90)),b=LocalBuf(2048),Dust.kr(4)),8)+k)*(2-l),b)}

// sc-140 ; 22 ; MCLD
a=Duty.kr(0.1,0,Dseq(fib(32).wrap(20,55).midicps,inf));HPF.ar(LeakDC.ar(Splay.ar(LFCub.ar([-1,a,a/3,-2])))*9).clip2/9//#supercollider

//---- sc-140 ; 04 ; Nathaniel Virgo
b=Buffer.read(s,"sounds/a11wlk01.wav");play{t=Impulse.kr(5);PlayBuf.ar(1,b,1,t,Demand.kr(t,0,Dseq(1e3*[103,41,162,15,141,52,124,190],4)))!2}

//---- sc-140 ; 06 ; Batuhan Bozkurt (refactored by Charles Celeste Hutchins)
f={|t|Pbind(\note,Pseq([-1,1,6,8,9,1,-1,8,6,1,9,8]+5,319),\dur,t)};Ptpar([0,f.(1/6),12,f.(0.1672)],1).play//#supercollider reich RT @earslap

//---- sc-140 ; 08 ; Charlie Hoistman
Ptpar(({|i|[i*8,Pbind(\scale,[0,2,4,7,9],\degree,Pseq(32.fib.fold(0,10),4)+(2*i+i)-10,\dur,1+2**i%2/6)]}!4).flat).play // #supercollider

//---- sc-140 ; 10 ; Julian Rohrhuber
/*eclecticity*/ Ndef(\x, { SinOsc.ar(BrownNoise.ar(30!2, 200), Ndef(\x).ar * LFNoise1.kr(1!2,1,1)) }).play;

//---- sc-140 ; 14 ; Nathaniel Virgo
Ndef('x',{x=Ndef('x').ar+0.01;a=BPF.ar(x,6**Latch.ar(x,Dust.ar(x))*200,0.1).sin;9.do{a=AllpassN.ar(a,0.2,{0.2.rand}!2,9)};a+a.mean}).play;

//---- sc-140 ; 21 ; Andrea Valle
{13.do{|i|k="SuperCollider"[i].ascii;20.do{|u|{MoogFF.ar(Saw.ar((k/4).midicps)*EnvGen.ar(Env.perc),u+k*9,k/30)}.play;(k*0.001).wait}}}.fork

/*
s <- readFile "sc-140.txt"
l = lines s
import Data.List.Split
p = chunksOf 4 l
f [k, au, code, _] = [ concat ["// sc-140 ; ", k, " ; ", au], code, ""]
putStrLn $ unlines (concatMap f p)
*/
