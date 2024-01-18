// https://scsynth.org/t/6264/4 ; pt
var numPartials = 32;
var numVoices = 16;
var partials = (1 .. numPartials).asArray;
var det = 0.2;
var voiceFunc = { |e|
	var detunes = (LFNoise1.kr(0.2).dup(numPartials) * det).midiratio;
	var fenv = TxLine.kr(1 - e.y * 2, 1, partials.pow(0.7) / 10, e.w);
	var freq0 = e.p.unitCps;
	var freqs = freq0 * partials * detunes * fenv;
	var osc = SinOsc.ar(freqs, { TRand.kr(0, 2 * pi, e.w) }.dup(numPartials));
	var dampen = 0.9 * (1 - e.z);
	var sig = osc / partials.pow(dampen.max(0.01));
	var atk = e.y + 0.1 * partials.pow(0.6) * { TRand.kr(0.5, 1.5, e.w) }.dup(numPartials);
	var rel = e.y + 0.1 * 14 / (partials + 3).pow(0.9) * { TExpRand.kr(0.5, 2, e.w) }.dup(numPartials);
	var envs = Env.perc(atk, rel, 1, -4).ar(0, e.w);
	Pan2.ar((sig * envs).sum, e.i, 0.1)
};
Voicer(0, 16, voiceFunc).sum
