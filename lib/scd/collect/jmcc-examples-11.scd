
//////////////////////////////////////////////////////////////////////

(
    // strummable guitar
    // use mouse to strum strings
{
	var pitch, mousex, out;
	// e a d g b e
	pitch = [ 52, 57, 62, 67, 71, 76 ];
	mousex = MouseX.kr;
	out = Mix.arFill(pitch.size, { arg i;
		var trigger, pluck, period, string;
		// place trigger points from 0.25 to 0.75
		trigger = HPZ1.kr(mousex > (0.25 + (i * 0.1))).abs;
		pluck = PinkNoise.ar(Decay.kr(trigger, 0.05));
		period = pitch.at(i).midicps.reciprocal;
		string = CombL.ar(pluck, period, period, 4);
		Pan2.ar(string, i * 0.2 - 0.5);
	});
	LPF.ar(out, 12000);
	LeakDC.ar(out);
}.play;
)

//////////////////////////////////////////////////////////////////////

(
    // strummable 12 string guitar
    // use mouse to strum strings
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
}.play;
)

//////////////////////////////////////////////////////////////////////

(
    // bidirectional strummable guitar
    // use mouse to strum strings
{
	var pitch1, pitch2, mousex, out;
	// e a d g b e
	pitch1 = [ 52, 57, 62, 67, 71, 76 ];
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
}.play;
)

//////////////////////////////////////////////////////////////////////

(
    // harmonic zither
    // use mouse to strum strings
{
	var pitch, mousex, mousey, out, triggerSpacing, panSpacing;
	// harmonic series
	pitch = [ 50, 53.86, 57.02, 59.69, 62, 64.04, 65.86, 67.51, 69.02, 71.69, 72.88, 74 ];
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
}.play;
)

//////////////////////////////////////////////////////////////////////

(
    // strummable metals
    // use mouse to strum strings
{
	var mousex, out;
	mousex = MouseX.kr;
	out = Mix.arFill(8, { arg i;
		var trigger, pluck, period, metal, z, n=15;
		// place trigger points from 0.25 to 0.75
		trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs;
		pluck = PinkNoise.ar(Decay.kr(trigger, 0.05, 0.04));
		z = `[	// filter bank specification :
				y = Array.fill(n, { (300 * i) + 8000.0.linrand} ), // frequencies
				nil, 							// amplitudes default to 1.0
				Array.fill(n, { 1.0 + 4.0.rand })	// ring times
			];
		metal = Klank.ar(z, pluck);
		//metal = SinOsc.ar(800, 0, 0.1);
		Pan2.ar(metal, i * 0.2 - 0.5);
	});
	LPF.ar(out, 12000);
	LeakDC.ar(out);
}.play;
)

//////////////////////////////////////////////////////////////////////

(
    // strummable pipes
{
	var mousex, out;
	mousex = MouseX.kr;
	out = Mix.arFill(8, { arg i;
		var trigger, pluck, period, metal, z, n=15, freq;
		// place trigger points from 0.25 to 0.75
		trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs;
		pluck = PinkNoise.ar(Lag.kr(Trig.kr(trigger, 1), 0.2, 0.01));
		freq = (#[0, 3, 5, 7, 10, 12, 15, 17].at(i) + 60).midicps;
		z = `[	// filter bank specification :
				y = Array.fill(n, { arg j; (j+1) * freq } ), // frequencies
				nil, 							// amplitudes default to 1.0
				Array.fill(n, { 0.2.rand })	// ring times
			];
		metal = Klank.ar(z, pluck);
		//metal = SinOsc.ar(800, 0, 0.1);
		Pan2.ar(metal, i * 0.2 - 0.5);
	});
	LPF.ar(out, 12000);
	out = LeakDC.ar(out);
	6.do({ out = AllpassN.ar(out, 0.1, [0.05.rand,0.05.rand], 4) });
	out
}.play;
)

//////////////////////////////////////////////////////////////////////

(
    // strummable silk
{
	var mousex, out;
	mousex = MouseX.kr;
	out = Mix.arFill(8, { arg i;
		var trigger, pluck, period, metal, z, n=15, freq;
		// place trigger points from 0.25 to 0.75
		trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs;
		pluck = PinkNoise.ar(Decay.ar(Impulse.ar(14, 0, Lag.kr(Trig.kr(trigger, 1), 0.2, 0.01)), 0.04));
		freq = (#[-2,0, 3, 5, 7, 10, 12, 15].at(i) + 60).midicps;
		z = `[	// filter bank specification :
				y = Array.fill(n, { arg j; (j+1) * freq } ), // frequencies
				nil, 							// amplitudes default to 1.0
				Array.fill(n, { rrand(0.3,1.0) })	// ring times
			];
		metal = Klank.ar(z, pluck);
		//metal = SinOsc.ar(800, 0, 0.1);
		Pan2.ar(metal, i * 0.2 - 0.5);
	});
	LPF.ar(out, 12000);
	out = LeakDC.ar(out);
	6.do({ out = AllpassN.ar(out, 0.1, [0.05.rand,0.05.rand], 4) });
	out
}.play;
)


//////////////////////////////////////////////////////////////////////
