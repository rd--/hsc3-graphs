// strummable 12 string guitar ; use mouse to strum strings ; jmcc
{
	var pitch, mousex, out;
	// e a d g b e
	pitch = [ 52, 57, 62, 67, 71, 76 ];
	mousex = MouseX.kr;
	out = Mix.arFill(pitch.size, { arg i;
		var pos, trigger1, trigger2, pluck1, pluck2, period, string1, string2;
		// place trigger points from 0.25 to 0.75
		pos = 0.25 + (i * 0.1);
		period = pitch.at(i).midicps.reciprocal;
		trigger1 = HPZ1.kr(mousex > pos).abs;
		pluck1 = PinkNoise.ar(Decay.kr(trigger1, 0.05));
		string1 = CombL.ar(pluck1, period, period, 4);
		trigger2 = HPZ1.kr(mousex > (pos + 0.015)).abs;
		pluck2 = PinkNoise.ar(Decay.kr(trigger2, 0.05));
		string2 = CombL.ar(pluck2, period/2, period/2, 4);
		Pan2.ar(string1 + string2, i * 0.2 - 0.5);
	});
	LPF.ar(out, 12000);
	LeakDC.ar(out);
}
