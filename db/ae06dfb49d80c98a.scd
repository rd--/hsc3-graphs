// Formlet
var amp = LFPulse.kr(0.5, 0, 0.5);
var my = MouseY.kr(400, 3200, 0, 0.2);
Mix.ar({
	var x = Formlet.ar({ Dust.ar(12) }.dup(2) * 0.05 * amp, my * 0.5.exprand(2), 0.005, 0.1);
	AllpassN.ar(x, 0.05, 0.05.rand, 8);
}.dup(8))
