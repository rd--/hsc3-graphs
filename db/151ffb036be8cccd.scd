// https://scsynth.org/t/6264/4 ; pt
var n = 32;
var partials = 1.to(n).asArray;
var det = 0.2;
var voiceFunc = {
	arg e;
	var detunes = (LFNoise1.kr(0.2).dup(n) * det).midiRatio;
	var fenv = TXLine.kr(1 - e.y * 2, 1, partials.pow(0.7) / 10, e.w);
	var freq0 = e.p.unitCps;
	var freqs = freq0 * partials * detunes * fenv;
	var osc = SinOsc.ar(freqs, { TRand.kr(0, 2 * pi, e.w) }.dup(n));
	var dampen = 0.9 * (1 - e.z);
	var sig = osc / partials.pow(dampen.max(0.01));
	var atk = e.y + 0.1 * partials.pow(0.6) * { TRand.kr(0.5, 1.5, e.w) }.dup(n);
	var rel = e.y + 0.1 * 14 / (partials + 3).pow(0.9) * { TExpRand.kr(0.5, 2, e.w) }.dup(n);
	var envs = Env.perc(atk, rel, 1, -4).ar(0, e.w);
	Pan2((sig * envs).sum, e.o, 0.1)
};
Voicer(4, voiceFunc).sum
