// hard sync sawtooth with lfo (jmcc) #6
{
	var f = (30 + 50.rand).midiCps;
	var z = SyncSaw.ar([f, f + 0.2], SinOsc.kr(0.2, [0, 2 * pi.rand]) * 2 * f + (3 * f)) * 0.05;
	CombN.ar(z, 0.3, 0.3, 4) + z.reverse
}.overlap(4, 4, 4)

// hard sync sawtooth with lfo (jmcc) #6 ; postprocess ; keyword
Texture.overlapRoutine(newEventFunc: {
	var f = (30 + 50.rand).midiCps;
	SyncSaw.ar(syncFreq: [f, f + 0.2], sawFreq: SinOsc.kr(freq: 0.2, phase: [0, 2 * pi.rand], mul: 2 * f, add: 3 * f), mul: 0.05)
}, sustainTime: 4, transitionTime: 4, overlap: 4, numChannels: 2, maxRepeats: inf, postProcess: {
	arg z;
	CombN.ar(in: z, maxdelaytime: 0.3, delaytime: 0.3, decaytime: 4, mul: 1, add: z.reverse)
}, bus: 0)
