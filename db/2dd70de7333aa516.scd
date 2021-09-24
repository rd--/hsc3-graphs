// nice buzzing effect
{var speed = 14
;var f = SinOsc.ar(1000, mul:150, add:300)
;var t = Impulse.kr(1/3)
;Mix.ar([
 SinOsc.ar(f * 1, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/1),
 SinOsc.ar(f * 2, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/2),
 SinOsc.ar(f * 3, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/3),
 SinOsc.ar(f * 4, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/4),
 SinOsc.ar(f * 5, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/5),
 SinOsc.ar(f * 6, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/6),
 SinOsc.ar(f * 7, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/7),
 SinOsc.ar(f * 8, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/8),
 SinOsc.ar(f * 9, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/9),
 SinOsc.ar(f * 10, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/10),
 SinOsc.ar(f * 11, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/11),
 SinOsc.ar(f * 12, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/12)]) * 0.1}
