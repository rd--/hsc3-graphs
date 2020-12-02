// MiBraids ; trigger (plugged)
{var trig = Dust.kr(0.6);
 var pit = TRand.kr(45,72,trig).round;
 var timb = 0.5;
 var color = LFNoise1.kr(0.3,0.5,0.5);
 MiBraids.ar(pit, timb, color, 28, trig, mul: 0.1) ! 2}
