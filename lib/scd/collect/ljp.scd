// ascension ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #1
Mix(RLPF.ar(PinkNoise.ar(0.1), Line.kr(20, 2e4, 1/((1..8)/200)), 0.05)).dup

// nostalgic sci-fi music ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #2
CombC.ar(Mix(SinOsc.ar(LFNoise2.kr(1.dup(4)*0.1,440,[1,2]*440))*0.01),0.2,[0.13,0.2],15)

// busy forest ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #3
CombC.ar(Formant.ar(LFNoise0.kr([1,0.7],8,9),LFNoise0.kr([1,0.7],4e3,4e3),200,0.3))

// inverted saw ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #4
(Saw.ar(LFNoise1.kr(1,1e3,1200),0.3)*FSinOsc.ar(SampleRate.ir/2,1)).dup

// hedge trimmer ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #5
Mix(BPF.ar(PinkNoise.ar(0.6),(1..64)*LFNoise2.kr(4,30,100), 0.01)).dup

// spectral harp ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #6
var p=SinOsc.ar(1760,0,0.01.dup);p+CombC.ar(p,0.1,LFNoise1.ar(0.5,0.1,0.1),-10)

// FM curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7a
SinOsc.ar(1, SinOsc.ar(333, SinOsc.ar(143,0,LFNoise2.kr(0.2.dup,100,110))),0.1)

// FM curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7b
SinOsc.ar(1, SinOsc.ar(33, SinOsc.ar(1403,0,LFNoise1.kr(0.2.dup,10,11)),10),0.1)

// FM curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7c
SinOsc.ar(1, SinOsc.ar(14003,0,LFNoise1.kr(0.2.dup,100,101)),0.1)

// FM curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7d
SinOsc.ar(2, SinOsc.ar(6003,0,LFNoise1.kr(1.dup,200,201)),0.1)

// FM curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7e
SinOsc.ar(0, SinOsc.ar(9005,0,LFNoise2.kr(1.dup,100,101)),0.1)

// blizzard ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #8
var n=LFNoise1; var f=0.2.dup(8);Mix(BPF.ar(PinkNoise.ar(0.2),n.kr(f,1e3,1040),n.kr(f,0.3,0.31))).dup

// fey emissions ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #9
var d=Dust.ar(2.dup);CombN.ar(BPF.ar(d,LFNoise0.ar(10,3000,3040),0.001,200),0.2,0.2,5)

// sine slurps ;  ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #10
SinOsc.ar(0, BPF.ar(Dust.ar(10.dup)*20000, LFNoise1.kr(10.dup,4e3,4e3), 0.1),0.2)

// noise slurps ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #11
SinOsc.ar(0, BPF.ar(WhiteNoise.ar(1e3.dup), LFNoise1.kr(0.1.dup,2e3,4e3),1e-3),0.1)

// feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12a
var p=Saw.ar(440+[0,0.2],0.02);p+CombC.ar(p,0.1,LFNoise0.ar(10,0.08,0.08),-1e4)

// feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12b
var p=Saw.ar(440+[0,0.2],0.02);p+CombC.ar(p,0.1,LFNoise1.ar(10,0.08,0.08),-1e4)

// feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12c
var p=PinkNoise.ar(0.03.dup);p+CombC.ar(p,0.2,LFNoise0.ar(1,0.2,0.2),-1e4)

// feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12d
var p=WhiteNoise.ar(0.02.dup);p+CombC.ar(p,0.1,LFNoise1.ar(10,0.08,0.08),-1e4)

// feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12e
var p=Dust2.ar(200.dup,0.2);p+CombC.ar(p,0.4,LFNoise0.ar(2,0.4,0.4),-1e4);

// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13a
var p=[1,3,5];Mix(SinOsc.ar(800*Mix((SinOsc.ar(p*0.1)/p).round(1/6)))).dup*0.2

// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13b
var p=[1,2]+0.01;Mix(SinOsc.ar(1000*Mix(Lag.ar((LFSaw.ar(p*0.4)/p).round(1/6),2e-3)))).dup*0.2

// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13c
var p=[0.5,1,2];Mix(SinOsc.ar(1000*Mix(Lag.ar((LFSaw.ar(p*0.4)/p).round(1/8),2e-3)))).dup*0.2

// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13d
var p=[1,2]+0.04;Mix(SinOsc.ar(1400*Mix(Lag.ar((LFTri.ar(p*0.2)/p).round(1/8),2e-3)))).dup*0.2

// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13e
var p=[1,4]+0.01;Mix(SinOsc.ar(1400*Mix(Lag.ar((LFTri.ar(p*0.2)/p).round(1/8),2e-3)))).dup*0.2

// trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13f
var p=[-4,-2,-1,1.04,2.01,4.02];Mix(LFSaw.ar([1,2.01,5.03]*100*Mix(LFSaw.ar(p.abs*0.4,0,1/p).round(1/4)))).dup*0.2

// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14a
SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(80), 0, 1, 512, 84), 1e3) * 20, 0, 0.2).dup

// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14b
Mix(SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(10), 0, 1, 12, [3,4,10]), 1e3) * 100, 0, 0.2)).dup

// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14c
Mix(SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(10), 0, 1, 16, [4,7,10,12]), 1e3) * 70, 0, 0.2)).dup

// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14d
Mix(SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(10), 0, 1, 16, [3,7,10,11]), 1e3) * 90, 0, 0.2)).dup

// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14e
Mix(SinOsc.ar(RLPF.ar(Stepper.ar(Impulse.ar(8), 0, 1, 8, [1,2,3]), 1e3, 0.01) * 200, 0, 0.1)).dup

// saw scratching ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #15
CombC.ar(LFSaw.ar([0.49,1,1.51,1.89]*200, 0, 0.1), 1, RLPF.ar(LFNoise2.ar(0.1, 0.4, 0.6), 10, 1.1).clip(0.21,1), 15).dup

// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16a
CombC.ar(SinOsc.ar(100,0,0.1), 2, LFTri.ar(1.1389,0,0.5,1.4), 80).dup

// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16b
CombC.ar(SinOsc.ar(200,0,0.1), 2, LFNoise1.ar(13.8389*LFSaw.ar(0.1)+14,0.5,1.4), 20).dup

// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16c
CombC.ar(SinOsc.ar(100,0,0.1), 2, LFTri.ar(LFNoise0.ar(0.2)+1,0,0.6,1.4), 80).dup

// shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16d
CombC.ar(SinOsc.ar(200,0,0.1), 2, LFTri.ar(LFSaw.ar(pi/9)*9+9,0,0.1,1.9), 20).dup
