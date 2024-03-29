// https://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml)
var numChan = 2;
var totalInst = 50;
var partials = 40;
var baseFreq = 69.midicps;
var scale = Scale.major(\just);
var voiceFunc = {
	var sig = Decay.ar(Dust.ar(1 / totalInst) * 0.5, 0.001) * PinkNoise.ar;
	var freq = { baseFreq * scale.degreeToRatio(0.rrand(60)) }.dup(partials);
	var a = [freq, { 0.1.rrand(0.9) }.dup(partials), { 0.5.rrand(9.0) }.dup(partials)];
	Klank.ar(Ref.new(a), sig, 1, 0, 1)
};
SplayAz.arFill(numChan, totalInst, voiceFunc)

// event control ; https://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml)
var voiceFunc = { | e |
	var numPartials = 40;
	var baseFreq = (e.x * 25 + 48).midicps;
	var scale = Scale.major(\just);
	var sig = Decay.ar(K2A.ar(e.w) * 0.1, 0.001) * PinkNoise.ar;
	var freq = { baseFreq * scale.degreeToRatio(0.rrand(60)) }.dup(numPartials);
	var a = [freq, { 0.1.rrand(0.9) }.dup(numPartials), { 0.5.rrand(9.0) }.dup(numPartials)];
	var o = DynKlank.ar(
		Ref.new(a),
		sig,
		1,
		0,
		1
	);
	Pan2.ar(o, e.i * 2 - 1, LagUD.kr(e.w * e.z, 0, 8) * 0.1 * numPartials.reciprocal)
};
Mix.ar(Voicer.ar(0, 16, voiceFunc))

// ---- calculations
60.iota.collect({ arg x; Scale.major(\just).degreeToRatio(x) }).asCompileString // iota
