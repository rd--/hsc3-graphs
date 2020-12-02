// MiBraids ; paraphonic
{var timb = LFNoise1.kr(0.03,0.5,0.5);
 var color = LFNoise1.kr(0.05,0.5,0.5);  // chord
 MiBraids.ar(38, timb, color, 40, resamp: 1, mul: 0.1) ! 2}
