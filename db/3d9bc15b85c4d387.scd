// MiBraids ; kick
{var trig =  Impulse.kr(4);
 var pit = Latch.kr(PinkNoise.kr(), trig).range(30, 50).round;
 var timb = LFNoise1.kr(0.4,0.5,0.5);
 var color = LFNoise1.kr(0.3,0.5,0.5);
 MiBraids.ar(pit, timb, color, 34, trig, mul: 0.2) ! 2}
