// https://sccode.org/1-4Qy ; f0 ; 0099
Pspawn(
	Pbind(
		\method,\par,
		\delta, 1 / 8,
		\pattern, {
			var a = Pseq(1.to(9).sputter, 1, 0);
			Pbind(
				\dur, a,
				\sustain, 1 / 8 / a,
				\degree, a,
				\detune, a
			)
		}
	),
	Event.default
).play

// https://sccode.org/1-4S6 ; f0 ; 'p'
SynthDef(\p, {
	arg out= 0, freq= 400, amp= 0.1, gate= 1, detune= 0;
	var env= EnvGen.ar(Env.perc(Rand(0.001, 0.01), LinRand(0.2, 0.4), amp, Rand(-9, -1)), doneAction:2);
	var snd= Mix(SinOsc.ar(freq+[0, detune*0.1], env*2pi));
	Out.ar(out, Pan2.ar(snd*env, Rand(-1, 1)));
}).add;
Pspawn(
	Pbind(
		\method,\par,
		\delta, 1 / 8,
		\pattern, {
			var a = Pseq(1.to(9).sputter, 1, 0);
			Pbind(
				\instrument, \p,
				\dur, a,
				\sustain, 1 / 8 / a,
				\degree, a,
				\detune, a
			)
		}
	),
	Event.default
).play

//----tweet0099
Pspawn(Pbind(\method,\par,\delta,1/8,\pattern,{Pbind(\dur,a=Pseq((1..9).sputter),\sustain,1/8/a,\degree,a,\detune,a)})).play
