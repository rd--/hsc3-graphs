// pentatonic pipes (jmcc) #9
var n = 5;
var env = Env.linen(0.2, 8, 1, 20, 'sine');
var mode = [0, 3, 5, 7, 10];
var root = 36 + 12.rand;
{
	arg i;
	var amp = EnvGen.kr(env, 1, 1, 0, 1, 0);
	var f = (20.rand.degreeToKey(mode, 12) + root).midiCps;
	var sig = (Resonz.ar(PinkNoise.ar * amp, f, 0.002) * 4).distort * 0.2;
	var z = Pan2.ar(sig, 1.0.rand2, 1) * LinXFade2.kr(1.0, SinOsc.kr(5).max(0), MouseX.kr > 0.5); // pulsing
	(i % 20 == 0).ifTrue({ root = 36 + 12.rand }); // maybe shift
	CombN.ar(z, 0.3, 0.3, 8, 1, z.reverse)
}.overlap(10, 0.01, n)

// pentatonic pipes (jmcc) #9 ; keywords ; postprocess
var n = 5;
var env = Env.linen(attackTime: 0.2, sustainTime: 8, releaseTime: 1, level: 20, curve: 'sine');
var mode = [0, 3, 5, 7, 10];
var root = 36 + 12.rand;
Texture.overlapRoutine(newEventFunc: {
	arg i;
	var amp = EnvGen.kr(envelope: env, gate: 1, levelScale: 1, levelBias: 0, timeScale: 1, doneAction: 0);
	var f = (20.rand.degreeToKey(mode, 12) + root).midiCps;
	var sig = Resonz.ar(in: PinkNoise.ar(mul: amp), freq: f, bwr: 0.002, mul: 4).distort * 0.2;
	(i % 20 == 0).ifTrue({ root = 36 + 12.rand }); // maybe shift
	Pan2.ar(in: sig, pos: 1.0.rand2, level: 1)
}, 10, 0.01, n, 2, postProcess: {
	arg z;
	z = z * LinXFade2.kr(inA: 1, inB: SinOsc.kr(freq: 5, phase: 0).max(0), pan: MouseX.kr(minval: 0, maxval: 1, warp: 0, lag: 0.2) > 0.5); // pulsing
	CombN.ar(in: z, maxdelaytime: 0.3, delaytime: 0.3, decaytime: 8, mul: 1, add: z.reverse)
})
