// https://tai-studio.org/index.php/2012/02/alarm-clock-sound/

(
SynthDef(\grain, {|out = 0, freq = 100, attack = 0, decay = 1, sustain = 0.1, distort = 0, fTime = 0.1, fFac = 1.2, amp = 1, delay = 0|
	var startFreq, endFreq, src, aEnv, fEnv;
	startFreq = fFac * freq;
	endFreq = freq;
	aEnv = EnvGen.ar(Env.perc(attack, decay), timeScale: sustain, doneAction: 2, levelScale: amp);
	fEnv = EnvGen.ar(Env([startFreq, endFreq], [fTime]));
	src = SinOsc.ar(fEnv, 1, mul: 1 + distort).wrap2(1);
	Out.ar(out, DelayN.ar(src * aEnv!2, 0.1, delay))
}).add
)

(
Pdef(\grainer, Pbind(
	\radiation, Pseq([
		Pseq([10] ++ (0.1 ) ++ [10] ++ (0.1!6), 1),
		Pseq([ 1] ++ (0.1!6) ++ [ 1], inf)
	]),
	\instrument, \grain,
	\freq, ([1200, 800, 600, 200]!12).flat.collect{|v| v * rrand(0.99, 1)} * Prand([4, 1, 2, 3, 4, 8], inf),
	\fTime, 0.0125,
	\fFac, 5,
	\sustain, 0.1,
	\attack, 0.0005,
	\decay, 2,
	//\distort, {Pwhite(0.1, 5.0)}!(12 * 4),
	\amp, 0.1,
	\delay, {Pwhite(0.01, 0.1)}!(12 * 4),
	\dur, Pkey(\radiation)
)).play
)
