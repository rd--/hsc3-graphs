	// strummable pipes ; jmcc
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
		Pan2.ar(metal, i * 0.2 - 0.5);
	});
	LPF.ar(out, 12000);
	out = LeakDC.ar(out);
	6.do({ out = AllpassN.ar(out, 0.1, [0.05.rand,0.05.rand], 4) });
	out
