// pulsing bottles (jmcc) #2 ; keywords
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
