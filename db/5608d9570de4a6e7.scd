// Dx7 ; event control ; data at local buffer
var voiceData = [
    25, 21, 98, 38, 99,  0, 99,  0, 36, 17, 87,  2,  1, 0, 0, 0, 59,  0,  1, 1, 8,
    66, 69, 60, 35,  0,  0, 98,  0,  0,  0,  4,  0,  0, 0, 0, 1, 90,  0,  1, 0, 8,
    25, 21, 98, 38, 99,  0, 99,  2, 35, 15, 79,  3,  1, 1, 0, 0, 91,  1,  0, 0, 6,
    97, 69, 60, 35, 99, 91, 98,  0,  0,  0,  0,  0,  0, 0, 0, 1, 68,  0, 22, 0, 7,
    78, 63, 53, 28, 99, 52, 62,  3, 38, 11, 80,  3,  0, 0, 0, 0, 77,  0,  7, 0, 0,
    98, 56, 63, 23, 99, 89, 74,  2,  0,  4,  1,  0,  0, 0, 0, 0, 99,  0,  1, 0, 7,
    99, 99, 99, 99, 50, 50, 50, 50,  3,  2,  1, 29, 99, 1, 0, 0,  0,  1, 24
];
var buf = voiceData.asLocalBuf;
var voiceFunc = { | e |
	var x0 = Latch.kr(
		in: e.x,
		trig: e.w
	);
	var dx7 = Dx7.ar(
		bufnum: buf,
		on: e.w,
		off: 0,
		data: 0,
		vc: 0,
		mnn: e.p * 127,
		vel: e.z,
		pw: 0x2000 * (e.x - x0),
		mw: 0,
		bc: 0,
		fc: 0
	);
	Pan2.ar(
		in: dx7,
		pos: (e.i * 2 - 1),
		level: e.z
	)
};
Voicer.ar(
	part: 0,
	numVoices: 16,
	voiceFunc: voiceFunc
).sum
