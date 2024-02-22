// synched impulses ; https://github.com/cianoc/supercollider_fragments
var synch = 5;
[
	SinOsc.ar(100, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(3/synch))),
	SinOsc.ar(300, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(7/synch))),
	SinOsc.ar(500, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(5/synch))),
	SinOsc.ar(700, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(2/synch))),
	SinOsc.ar(900, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(9/synch))),
	SinOsc.ar(1100, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(6/synch))),
	SinOsc.ar(1300, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(1/synch)))
].sum * 0.1
