// https://sccode.org/1-4Qy ; f0 ; 0335
var o = GrainFM.ar(
	numChannels: 1,
	trigger: LFSaw.ar([0.5, 0.6], 0),
	dur: 16,
	carfreq: LFSaw.ar(5, 0) * LFSaw.ar(0.015, 0) + 1 * 98,
	modfreq: (2 ** LFSaw.ar(4, 0)).roundTo(0.5) * 99,
	index: 2 ** LFSaw.ar(1 / [8, 9], 0) * 8,
	pan: 0,
	envbufnum: -1,
	maxGrains: 512
);
(o / 2).tanh

//--tweet0335
a=LFSaw;tanh(GrainFM.ar(1,a.ar([0.5,0.6]),16,a.ar(5)*a.ar(0.015)+1*98,round(2**a.ar(4),0.5)*99,2**a.ar(1/[8,9])*8)/2)