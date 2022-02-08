// additive saw
var f = 100;
var t = Impulse.kr(1 / 3);
Mix.ar([
 SinOsc.ar(f * 1, mul: EnvGen.kr(Env.perc(0, 1.4), t)/1),
 SinOsc.ar(f * 2, mul: EnvGen.kr(Env.perc(0, 1.1), t)/2),
 SinOsc.ar(f * 3, mul: EnvGen.kr(Env.perc(0, 2), t)/3),
 SinOsc.ar(f * 4, mul: EnvGen.kr(Env.perc(0, 1), t)/4),
 SinOsc.ar(f * 5, mul: EnvGen.kr(Env.perc(0, 1.8), t)/5),
 SinOsc.ar(f * 6, mul: EnvGen.kr(Env.perc(0, 2.9), t)/6),
 SinOsc.ar(f * 7, mul: EnvGen.kr(Env.perc(0, 4), t)/7),
 SinOsc.ar(f * 8, mul: EnvGen.kr(Env.perc(0, 0.3), t)/8),
 SinOsc.ar(f * 9, mul: EnvGen.kr(Env.perc(0, 1), t)/9),
 SinOsc.ar(f * 10, mul: EnvGen.kr(Env.perc(0, 3.6), t)/10),
 SinOsc.ar(f * 11, mul: EnvGen.kr(Env.perc(0, 2.3), t)/11),
 SinOsc.ar(f * 12, mul: EnvGen.kr(Env.perc(0, 1.1), t)/12)]) * 0.1
