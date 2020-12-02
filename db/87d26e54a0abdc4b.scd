// MiBraids ; scanning
{var timb = LFNoise1.kr(0.3,0.5,0.5);
 var color = LFNoise1.kr(0.3,0.5,0.5);
 var pit = MouseY.kr(33,72);
 var model = MouseX.kr(0, 47);
 MiBraids.ar(pit, timb, color, model, mul: 0.1) ! 2}
