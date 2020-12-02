// MiBraids ; vosim
{var pit = LFNoise0.kr(4).range(33, 66).round;
 var timb = LFNoise1.kr(0.3,0.5,0.5);
 var color = LFNoise1.kr(0.3,0.5,0.5);
 MiBraids.ar(pit, timb, color, 21, mul: 0.1) ! 2}
