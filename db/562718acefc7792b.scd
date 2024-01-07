// bidirectional strummable guitar ; use mouse to strum strings ; jmcc
var pitch1, pitch2, mousex, out;
pitch1 = [ 52, 57, 62, 67, 71, 76 ]; // e a d g b e
pitch2 = pitch1 + 7;
mousex = MouseX.kr;
out = Mix.arFill(pitch1.size, { arg i;
	var trigger, pluck1, pluck2, period1, period2, string1, string2;
	// place trigger points from 0.25 to 0.75
	trigger = HPZ1.kr(mousex > (0.25 + (i * 0.1)));
	pluck1 = PinkNoise.ar(Decay.kr(trigger.max(0), 0.05));
	period1 = pitch1.at(i).midicps.reciprocal;
	string1 = CombL.ar(pluck1, period1, period1, 4);
	pluck2 = BrownNoise.ar(Decay.kr(trigger.neg.max(0), 0.05));
	period2 = pitch2.at(i).midicps.reciprocal;
	string2 = CombL.ar(pluck2, period2, period2, -4);
	Pan2.ar(string1 + string2, i * 0.2 - 0.5);
});
LPF.ar(out, 12000);
LeakDC.ar(out);
