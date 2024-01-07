// harmonic zither ; use mouse to strum strings ; jmcc
var pitch, mousex, mousey, out, triggerSpacing, panSpacing;
pitch = [ 50, 53.86, 57.02, 59.69, 62, 64.04, 65.86, 67.51, 69.02, 71.69, 72.88, 74 ]; // harmonic series
mousex = MouseX.kr;
mousey = MouseY.kr;
triggerSpacing = 0.5 / (pitch.size - 1);
panSpacing = 1.5 / (pitch.size - 1);
out = Mix.arFill(pitch.size, { arg i;
	var trigger, pluck, period, string;
	// place trigger points from 0.25 to 0.75
	trigger = HPZ1.kr(mousex > (0.25 + (i * triggerSpacing))).abs;
	pluck = PinkNoise.ar(Decay.kr(trigger, 0.05));
	period = pitch.at(i).midicps.reciprocal;
	string = CombL.ar(pluck, period, period, 8);
	Pan2.ar(string, i * panSpacing - 0.75);
});
LPF.ar(out, 12000);
LeakDC.ar(out);
