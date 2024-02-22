// strummable metals ; use mouse to strum strings ; jmcc
var mousex = MouseX.kr(0, 1, 0, 0.2);
var strFunc = {
	arg i;
	var trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs;
	var pluck = PinkNoise.ar * Decay.kr(trigger, 0.05) * 0.04;
	var n = 15;
	var z = [{ 300 * i + LinRand(0, 8000, 0) }.dup(n), nil, { Rand(1, 4) }.dup(n)].asRef;
	Pan2.ar(Klank.ar(z, pluck, 1, 0, 1), i * 0.2 - 0.5, 1);
};
LeakDC.ar(LPF.ar(Mix.arFill(8, strFunc), 12000), 0.995)
