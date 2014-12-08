Quarks.install("Feedback");

{var x = BPF.ar(PinkNoise.ar(0.2 ! 2),100,0.2) * Line.kr(1,0,1)
;Fb({arg fb; FreqShift.ar(fb + x, 5)})}.play

{var x = BPF.ar(PinkNoise.ar(0.2 ! 2),8000,0.2) * Line.kr(1,0,1)
;Fb({arg fb; FreqShift.ar(fb + x, -4)})}.play
