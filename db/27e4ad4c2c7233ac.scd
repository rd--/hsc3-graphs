// strummable metals ; use mouse to strum strings ; jmcc
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
	Pan2.ar(metal, i * 0.2 - 0.5);
});
LPF.ar(out, 12000);
LeakDC.ar(out);
