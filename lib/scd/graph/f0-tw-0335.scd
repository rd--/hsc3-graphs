// https://sccode.org/1-4Qy ; f0 ; 0335
var o = GrainFM.ar(
	1,
	LFSaw.ar([0.5, 0.6], 0),
	16,
	LFSaw.ar(5, 0) * LFSaw.ar(0.015, 0) + 1 * 98,
	(2 ** LFSaw.ar(4, 0)).round(0.5) * 99,
	2 ** LFSaw.ar(1 / [8, 9], 0) * 8,
	0,
	-1,
	512
);
(o / 2).tanh

// ---- tweet0335
a=LFSaw;tanh(GrainFM.ar(1,a.ar([0.5,0.6]),16,a.ar(5)*a.ar(0.015)+1*98,round(2**a.ar(4),0.5)*99,2**a.ar(1/[8,9])*8)/2)
