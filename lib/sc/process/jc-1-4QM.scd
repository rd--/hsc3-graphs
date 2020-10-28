// http://sccode.org/1-4QM - AY=external
{var s1 = [8,12,16,20]
;var s2 = 2 / s1.scramble
;var s3 = 2 * s1.scramble
;var rel = Pxrand([0,0,0,0,0,0,0,1],inf).asStream
;Routine
 {inf.do
  {var a = [0.125,0.25,0.5,0.5,0.25,0.125,1].choose
  ;play{var p = Env.perc(0.01,a + rel.next)
       ;var e = EnvGen.ar(p,doneAction:2)
       ;var x = [60,67,75,79,94].scramble
       ;var ta = x.midicps * a * s1.choose
       ;var tb = x * s2.choose.midicps
       ;var tc = a * s3.choose.midicps
       ;e * AY.ar(ta,tb,tc,0.25,3,15,10,7)}
  ;play{var p = Env.perc(0.01,a/2)
       ;var g = Duty.kr(Dseq([0.5,0.25],inf),0,Dxrand([0,1],inf))
       ;var e = EnvGen.ar(p,g,doneAction:2)
       ;e * BrownNoise.ar(0.6) ! 2}
  ;play{var p = Env.perc(0.01,a/4)
       ;var g = Duty.kr(Dseq([0.25,0.5],inf),0,Dseq([0,1],inf))
       ;var e = EnvGen.ar(p,g,doneAction:2)
       ;e * LFNoise0.kr(16) * WhiteNoise.ar(0.2) ! 2}
  ;a.wait}}}.value.play
