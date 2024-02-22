// Coolant ; Jmcc #2 ; requires=keywords
var f = { |tr|
	Splay.ar(
		inArray: {
			Ringz.ar(
				in: OnePole.ar(
					in: { BrownNoise.ar(mul: 0.002, add: 0) } ! 2,
					coef: 0.95,
					mul: 1,
					add: 0
				),
				freq: TRand.kr(
					lo: 0,
					hi: 2040,
					trig: tr) * 1 + 40,
				decaytime: 1,
				mul: 0.5,
				add: 0
			)
		} ! 10,
	)
};
XFadeTexture(
	graphFunc: f,
	sustainTime: 4,
	transitionTime: 4,
)

// Coolant (Jmcc)
var p = 10;
var s1 = [Array.fill(p, {40 + 2000.0.rand}),nil,nil];
var s2 = [Array.fill(p, {40 + 2000.0.rand}),nil,nil];
Klank.ar([Ref(s1), Ref(s2)], OnePole.ar(BrownNoise.ar([0.002, 0.002]), 0.95), 1, 0, 1)

// Jmcc - Ostinoodles ; requires=keywords
var z = OverlapTexture({ |tr|
    var root = 81 + TRand.kr(lo: -6, hi: 6, trig: tr);
    var major = [0, 2, 4, 5, 7, 9, 11].as(LocalBuf);
    var offset = TRand.kr(lo: -16, hi: 16, trig: tr);
    var sequence = DegreeToKey.kr(
		bufnum: major,
		in: TScramble.kr(trigger: tr, inputs: [0, 1, 2, 3] + offset),
		octave: 12
	) + root;
    var f = TxLine.kr(
		start: TExpRand.kr(lo: 4.0, hi: 24.0, trig: tr),
		end: TExpRand.kr(lo: 4.0, hi: 24.0, trig: tr),
		dur: 12,
		trig: tr
	);
    var trig = Impulse.kr(freq: f);
    var freq = Sequencer.kr(inArray: sequence.midicps, trig: trig);
    var sig = LFTri.ar(freq: freq, iphase: 0, mul: Decay2.kr(in: trig, attackTime: 0.004, decayTime: 0.3, mul: 0.1));
    Pan2.ar(
		in: sig,
		pos: TRand.kr(lo: -1, hi: 1, trig: tr),
		level: 1)
}, 6, 3, 6);
6.do {
	z = AllpassN.ar(in: z, maxdelaytime: 0.040, delaytime: [Rand(lo: 0, hi: 0.040),Rand(lo: 0, hi: 0.040)], decaytime: 16)
};
z

// Pulsing bottles (Jmcc) #2 ; requires=keywords
var n = 6; // number of 'bottles'
var f = {
    var a = LFPulse.kr(
		freq: 4 + 10.0.rand,
		iphase: 0,
		width: 0.7.rand,
		mul: 0.8 / n
	);
    var l = SinOsc.kr(
		freq: 0.1 + 0.4.rand,
		phase: (2 * pi).rand
	);
    Pan2.ar(
		in: Resonz.ar(
			in: WhiteNoise.ar(mul: a),
			freq: 400 + 7000.0.linrand,
			bwr: 0.01
		),
		pos: l,
		level: 1
	)
};
Mix.fill(n,f)

// Sample and hold liquidities (Jmcc) #4 ; requires=keywords
var r = MouseX.kr(minval: 1, maxval: 200, warp: 'exponential', lag: 0.1);
var t = r.reciprocal;
var c = Impulse.kr(freq: r, phase: 0) * 0.4;
var cf = MouseY.kr(minval: 100, maxval: 8000, warp: 'exponential', lag: 0.1);
var f = Latch.kr(in: WhiteNoise.kr * cf * 0.5 + cf, trig: c);
var p = Latch.kr(in: WhiteNoise.kr, trig: c);
var i = Pan2.ar(in: SinOsc.ar(freq: f, phase: 0), pos: p, level: Decay2.kr(in: c, attackTime: 0.1 * t, decayTime: 0.9 * t));
CombN.ar(in: i, maxdelaytime: 0.3, delaytime: 0.3, decaytime: 2)
