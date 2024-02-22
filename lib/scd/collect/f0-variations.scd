// pkt 00 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/490 ; requires=keywords
var f0 = [100,200,300] + SinOsc.ar(freq: [0.11,0.22,0.33], phase: 0);
var ph0 = SinOsc.ar(freq: [0.1,0.2,0.3], phase: 0, mul: 2 * pi);
var a0 = 0.1 + SinOsc.ar(freq: [0.01,0.02,0.03], phase: 0, mul: 0.05);
var i = SinOsc.ar(freq: f0, phase: ph0, mul: a0);
var w = SinOsc.ar(freq: SinOsc.ar(freq: SinOsc.ar(freq: 0.13, phase: 0, mul: 5, add: 6), phase: 0, mul: 8, add: 50), phase: 0, mul: 1, add: 1);
var s = Splay.ar(inArray: i, spread: w, level: 0.7, center: SinOsc.ar(freq: 1.2, phase: 0, mul: 0.6), levelComp: true);
GVerb.ar(in: s, roomsize: 20, revtime: 5, damping: 1, inputbw: 0.5, spread: 25, drylevel: 0, earlyreflevel: 1, taillevel: 1, maxroomsize: 300)

// https://sccode.org/1-4Qy ; f0 ; 0335 ; requires=keywords
var o = GrainFM.ar(
	numChannels: 1,
	trigger: LFSaw.ar([0.5, 0.6], 0),
	dur: 16,
	carfreq: LFSaw.ar(5, 0) * LFSaw.ar(0.015, 0) + 1 * 98,
	modfreq: (2 ** LFSaw.ar(4, 0)).round(0.5) * 99,
	index: 2 ** LFSaw.ar(1 / [8, 9], 0) * 8,
	pan: 0,
	envbufnum: -1,
	maxGrains: 512
);
(o / 2).tanh

// https://twitter.com/redFrik/status/454598285861617665 ; requires=keywords
var b = (8 .. 0);
var c = LFTri.ar(freq: 3 ** LFTri.ar(freq: 1 / b, iphase: b / 9), iphase: 0);
var d = LFTri.ar(freq: 1 / b, iphase: 0) % 1 / 9 + 0.01;
var f = 2 ** LFTri.ar(freq: b / 99, iphase: 0).round * 99 * b;
var o = GrainSin.ar(numChannels: 2, trigger: c, dur: d, freq: f, pan: 0, envbufnum: -1, maxGrains: 512);
Splay.ar(o.tanh) / 2

// https://twitter.com/redFrik/status/456384156159574016
var a = 1 / [3,12,4,1,6,2];
var s = SinOsc.ar(freq: a, phase: 0).lag3(SinOsc.ar(freq: 2.67 ** a, phase: 0).abs) * 99;
var f = ((SinOsc.ar(freq: (1 / a) / 9, phase: a) > 0) * 20 + 99) / a;
Splay.ar(inArray: SinOsc.ar(freq: HPF.ar(in: Ringz.ar(in: s, freq: f, decaytime: 1), freq: 440), phase: 0)) * 0.25

// https://twitter.com/redFrik/status/839296011982024704
var t = LFSaw.ar(freq: [0.5,0.6], iphase: 0);
var f = LFSaw.ar(freq: 5, iphase: 0) * LFSaw.ar(freq: 0.015, iphase: 0) + 1 * 98;
var m = (2 ** LFSaw.ar(freq: 4, iphase: 0)).round(0.5) * 99;
var i = 2 ** LFSaw.ar(freq: 1 / [8,9], iphase: 0) * 8;
var g = GrainFM.ar(numChannels: 1, trigger: t, dur: 16, carfreq: f, modfreq: m, index: i, pan: 0, envbufnum: -1, maxGrains: 512);
(g/2).tanh * 0.25

// f0 ; https://twitter.com/redFrik/status/1105496695637454848
var b = (1 .. 15) / 151;
var w = VarSaw.kr(freq: b, iphase: b, width: 1 / 5.15, mul: 1, add: 1.5).ceil;
var s = Select.kr(which: VarSaw.kr(freq: 1/15, iphase: 1/5, width: b, mul: 5).ceil + 5 / 5, array: [51 * 1.5, 51, 151]);
var x = Lag.kr(in: s, lagTime: b);
var y = VarSaw.kr(freq: 5 + b, iphase: 0, width: 0.5);
var z = VarSaw.kr(freq: b, iphase: b, width: b, mul: b / 5, add: [1.5, 5, 1]);
var m = VarSaw.kr(freq: 5 - b, iphase: b, width: b, mul: 5, add: 5);
var o = VarSaw.ar(freq: w * x + y * z, iphase: b, width: VarSaw.kr(freq: b, iphase: 0, width: 0.5) + 5 / 15, mul: m > 1.515);
var f = 1515 ** (VarSaw.kr(freq: 1-b/5, iphase: 0, width: 0.5) / 15 + 1 + b);
var rq = 1.5 ** VarSaw.kr(freq: b, iphase: 0, width: 0.5) / 5;
Splay.ar(inArray: BLowPass.ar(in: o, freq: f, rq: rq) / 5)

// https://twitter.com/redFrik/status/1166129504747773954
var a=LFTri;
var b=PitchShift;
var c=LFPulse;
var f={|i|i+3.33+ar(a,3/3333)}!3%3*33*(3/3pi+kr(c,3e-3*3));
var q=ar(a,3*3**[3.3,3]+(ar(a,[3,pi])),3,ar(c,pi)/3*ar(a,3e-3));
var r=ar(Splay,(ar(a,f,3,_+3!3).reduce('*').tanh*[3,333*ar(a,3/3333),33])).sin+q/3;
r+sum({|i|ar(b,r,3/33,3/3+i*3,3/33,3/33)}!3)/6

// f0  https://twitter.com/redFrik/status/1210118661022867458 ; requires=keywords
var b = (2 .. 7).reciprocal;
var d = $0.ascii.reciprocal;
var g = 0.cos.cos;
var f = Duty.ar(dur: b, reset: 0, level: Dseq(list: "0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii, repeats: inf), doneAction: 0);
var o = SinOscFB.ar(freq: f, feedback: SinOsc.ar(freq: d, phase: 0).max(0) * 0.cos.sin);
var c = SinOsc.ar(freq: 0, phase: pi ** o);
var p = PitchShift.ar(in: c, windowSize: g, pitchRatio: b.reciprocal, pitchDispersion: d, timeDispersion: d, mul: b);
LeakDC.ar(in: Splay.ar(inArray: c + p), coef: 0.995) * g

// rd (edit) ; f0 <https://twitter.com/redFrik/status/1254441448327479299>
var b = #[1, 3, 5, 8, 10];
var e = [3, 2/3, 4, 3/2, 2];
var c = 0.021;
var d = LFTri.ar(b / 999, 0) % 1;
var m = LFTri.ar(b * c, 0);
var l = m * 7 + 20 + Dseq(b % m * 5 + 6, inf);
var j = Duty.ar(e / (12 ** m), 0, l);
var k = DegreeToKey.ar(LocalBuf.newFrom(b), j);
var o = SinOscFB.ar(k.midicps, LFTri.ar(c / b + 1 / 3, Decay2.ar(Impulse.ar(e.wrapAt(b), 0), c, d)) * d);
Out.kr(bus: 90, channelsArray: A2K.kr(k));
FreeVerb.ar(Splay.ar(o, 1, 1, 0, true), 0.1, 1, 0.5) * 0.2

// f0 ; https://twitter.com/redFrik/status/1374517800048291847
var b = (1 .. 9);
var f0 = Lag.ar(
	in: VarSaw.ar(
		freq: 0.003,
		iphase: b / 9,
		width: 0.5
	).round(
		1 / 3
	),
	lagTime: 1.9,
	mul: 91,
	add: 252
);
var w0 = VarSaw.ar(
	freq: b / 9 / 99,
	iphase: 0,
	width: 0.5
) % 1;
var f1 = 63 * b + VarSaw.ar(
	freq: 0.49,
	iphase: b / 9,
	width: 0.5
);
var w1 = VarSaw.ar(
	freq: VarSaw.ar(
		freq: b / 9 / 9,
		iphase: 0,
		width: b / 10,
		mul: 1/99,
		add: Lag.ar(
			in: VarSaw.ar(
				freq: 0.003,
				iphase: b / 9,
				width: 0.5
			).round(
				1 / 3
			),
			lagTime: 1.9,
			mul: 91,
			add: 252
		)
	) * b,
	iphase: 0,
	width: b / 9
) + 1 / 2;
Splay.ar(
	VarSaw.ar(
		freq: f0,
		iphase: b / 9,
		width: w0,
		mul: 1/3,
		add: VarSaw.ar(
			freq: f1,
			iphase: 0,
			width: w1,
			mul: VarSaw.ar(
				freq: 6,
				iphase: b / 9 / 3,
				width: 0
			).max(
				VarSaw.ar(
					freq: 0.2,
					iphase: b / 9,
					width: 0.5
				) / 9 + VarSaw.ar(
					freq: 0.009,
					iphase: 0,
					width: 0.5,
					mul: 0.3,
					add: 0.4
				)
			),
			add: VarSaw.ar(
				freq: 60,
				iphase: 0,
				width: 0.5
			) * VarSaw.ar(
				freq: 3,
				iphase: 0,
				width: 0
			).max(
				0
			) ** 3
		)
	) / 5
)

// https://twitter.com/redFrik/status/1374517800048291847
var b = (1 .. 9);
var a = VarSaw;
var c = b / 9;
var d = a.ar(0.003, c).round(1 / 3).lag(1.9) * 91 + 252;
var x = a.ar(63 * b + a.ar(0.49, c), 0, a.ar((d) + a.ar(c / 9, 0, b / (9 + 1), 1 / 99) * b, 0, c) + 1 / 2, a.ar(6, c / 3, 0).max(a.ar(0.2, c) / 9 + (a.ar(0.009) * 0.3 + 0.4)));
var y = a.ar(60, 0, 0.5, a.ar(3, 0, 0).max ** 3);
var z = a.ar(d, c, a.ar(c / 99) % 1, 1 / 3);
Splay.ar(x + y + z / 5)

// f0  https://twitter.com/redFrik/status/1395040511795372038;
var b = [2, 6, 3, 1];
var c = 500;
var l = Dseq(list: (SinOscFB.ar(freq: b / 24, feedback: 0).round + (0 .. 9) * 7 + 29.17).midicps, repeats: inf);
var f = Duty.ar(dur: b, reset: SinOscFB.ar(freq: b / 9, feedback: 0), level: l, doneAction: 0);
var o = SinOscFB.ar(freq: f, feedback: SinOscFB.ar(freq: b / 13, feedback: 0).max(0) / 3 * 2);
var p = AllpassN.ar(in: o / 8, maxdelaytime: 1, delaytime: 0.51, decaytime: 8);
var m = SinOscFB.ar(freq: b / c, feedback: 0).max(0) / c;
var h = Hasher.ar(in: SinOscFB.ar(freq: b / 12, feedback: 0).max(0), mul: m);
var q = BPF.ar(in: h, freq: 2 ** SinOscFB.ar(freq: b / c * 2, feedback: 0) * 10000, rq: 1 / 99);
HPF.ar(in: p + GVerb.ar(in: q, roomsize: 99, revtime: 9, damping: 0.2), freq: 50).clump(2) * 0.2

// f0 ; subset (rd) ; https://twitter.com/redFrik/status/1395519538008141835
var f = { arg x; SinOscFB.ar(freq: x, feedback: 0).max(0) };
var p = [250, 200] * Duty.ar(dur: 4.096, reset: 0, level: Dseq(list: [4, 6, 5, 5, 5, 5, 3] / 4, repeats: inf)).lag(0.1);
SinOscFB.ar(freq: p, feedback: f.value(0.08), mul: f.value(1 / [99, 60]) / 3) * 0.1

// f0 ; https://twitter.com/redFrik/status/1395519538008141835
var l = Dseries(start: 1, step: [1,2], length: inf) % Duty.ar(dur: 8.192, reset: 0, level: Dseq(list: (1 .. 6) * 75, repeats: inf));
var c = Duty.ar(dur: 0.004, reset: 0, level: l);
var d = HPF.ar(in: MantissaMask.ar(in: c, bits: 3), freq: 5);
var f = { arg x; SinOscFB.ar(freq: x, feedback: 0).max(0) };
var p = [250,200] * Duty.ar(dur: 4.096, reset: 0, level: Dseq(list: [4,6,5,5,5,5,3] / 4, repeats: inf)).lag(0.1);
var o = SinOscFB.ar(freq: p, feedback: f.value(0.08), mul: f.value(1 / [99,60]) / 3);
LPF.ar(in: (d.sin + SinOscFB.ar(freq: 63, feedback: f.value(0.8), mul: d) / 9 + o).tanh / 2, freq: 10000) * 0.1

// f0 ; https://sccode.org/1-5eN ; requires=GlitchRHPF
var s = GbmanN.ar(freq: [2300,1150], xi: 1.2, yi: 2.1);
var f0 = Pulse.ar(
	freq: 4,
	width: [1,2] / 8,
	mul: 1,
	add: LFPulse.ar(freq: 1/8, iphase: 0, width: 0.5) / 5 + 1
);
var f1 = LFSaw.ar(freq: f0, iphase: 0) + 2;
GlitchRHPF.ar(in: s, freq: f1, rq: 1) * 0.05
