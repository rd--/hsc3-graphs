// https://schollz.com/blog/phasedistortion/
Voicer(0, 16) { |e|
	var freq = (e.x * 36 + 48).midicps; // e.p.unitCps;
	var amp = e.z;
	var freqBase = freq;
	var freqRes = LinLin.ar(SinOsc.kr(Rand(0, 0.2), 0), -1, 1, freqBase / 2, freqBase * 2);
	var pdbase = Impulse.ar(freqBase, 0);
	var twoPi = 2 * pi;
	var pd = Phasor.ar(pdbase, twoPi * freqBase / SampleRate.ir, twoPi, 0);
	var pdres = Phasor.ar(pdbase, twoPi * freqRes / SampleRate.ir, twoPi, 0);
	var pdi = LinLin.ar((twoPi - pd).max(0), 0, twoPi, 0, 1);
	var snd = Lag.ar(SinOsc.ar(0, pdres) * pdi, 1 / freqBase);
	var env = Decay2.kr(Trig.kr(e.w, 0.001), 0.005, 10);
	Pan2.ar(snd, e.i * 2 - 1, env * amp)
}.sum
