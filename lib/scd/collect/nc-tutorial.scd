// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html
var n = 11;
var f = {
	var freq = Rand(50, 560.3);
	var numcps = Rand(2, 20);
	var knum = MulAdd(SinOsc.kr(ExpRand(0.02, 0.2),  0), numcps / 2,  numcps / 2);
	Pan2.ar(
		Gendy1.ar(6.rand, 6.rand, 1.0.rand, 1.0.rand, freq , freq,  1.0.rand,  1.0.rand,  numcps,  knum),
		1.0.rand2,
		0.5 / n.sqrt
	)
};
Resonz.ar(Mix.ar(f.dup(n)), MouseX.kr(100,  2000, 0, 0.2), MouseY.kr(0.01,  1.0, 0, 0.2))

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; sawtooth
var n = 10;
var f = { |i|
	var mult = (-1 ** i) * (0.5 / (i + 1));
	SinOsc.ar(440 * (i + 1), 0) * mult
};
Pan2.ar(Mix.ar(f.dup(n)), 0, 1 / n)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; square
var n = 10;
var f = { |i|
	var harmonicnumber = 2 * i + 1;
	SinOsc.ar(440 * harmonicnumber, 0) / harmonicnumber
};
Pan2.ar(Mix.ar(f.dup(n)), 0, 1 / n)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; triangle
var n = 10;
var f = { |i|
	var harmonicnumber = 2 * i + 1;
	var mult = (-1 ** (harmonicnumber - 1 / 2)) * (1 / (harmonicnumber * harmonicnumber));
	SinOsc.ar(440 * harmonicnumber, 0) * mult
};
Pan2.ar(Mix.ar(f.dup(n)), 0, 1 / n)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; bell spectra
var freq = 500 * [0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 4.1];
var amp = [0.25, 1, 0.8, 0.5, 0.9, 0.4, 0.3, 0.6, 0.1];
Mix.ar(SinOsc.ar(freq, 0) * 0.1 * amp)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; fm
var modfreq = MouseX.kr(1, 440, 1, 0.2);
var modindex = MouseY.kr(0.0, 10.0, 0, 0.2);
SinOsc.ar(SinOsc.ar(modfreq,0) * modfreq * modindex + 440, 0) * 0.25

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; fm
var carfreq = 440;
var harmonicity = MouseX.kr(0, 10, 0, 0.2).round(1);
var modindex = MouseY.kr(0.0, 10.0, 0, 0.2);
var modfreq = carfreq * harmonicity;
SinOsc.ar(carfreq + (SinOsc.ar(modfreq, 0) * modfreq * modindex), 0.0) * 0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; pm
var modfreq = MouseX.kr(1,1000, 1, 0.2);
var modindex = MouseY.kr(0.0, 100.0, 0, 0.2);
var conversion = 2 * pi / SampleRate.ir;
SinOsc.ar(0, Phasor.ar(0, 440 * conversion, 0, 2 * pi, 0) + (modfreq * modindex * conversion * SinOsc.ar(modfreq, 0))) * 0.25

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; pm ; equivalent
var modfreq = MouseX.kr(1,1000, 1, 0.2);
var modindex = MouseY.kr(0.0, 100.0, 0, 0.2);
var conversion = 2 * pi / SampleRate.ir;
SinOsc.ar(440, (modfreq * modindex * conversion * SinOsc.ar(modfreq, 0))) * 0.25

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.5 ; chorus
Mix.ar(Saw.ar([440, 443 ,437]) * 0.1)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.5 ; am, fm, chorus
var src = Saw.ar([440, 443, 437] + (SinOsc.ar(100, 0) * 100));
var amp = LFSaw.kr(Line.kr(3, 17, 3),0) * 0.5 + 0.5 * Line.kr(1, 0, 10);
Mix.ar(Resonz.ar(src, XLine.kr(10000, 10, 10), Line.kr(1, 0.05, 10)) * amp)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.5 ; bell patch
var spectrum = [0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 4.1];
var amplitudes = [0.25, 1, 0.8, 0.5, 0.9, 0.4, 0.3, 0.6, 0.1];
var numpartials = spectrum.size;
var modfreqs1 = {Rand(1, 5)}.dup(numpartials);
var modfreqs2 = {Rand(0.1, 3)}.dup(numpartials);
var decaytimes = { |i| Rand(2.5, 2.5 + (5 * (1.0 - (i / numpartials))))}.dup(numpartials);
var partial = { |i|
	var freq = spectrum.at(i) + (SinOsc.kr(modfreqs1.at(i), 0) * 0.005) * 500;
	var amp = 0.1 * Line.kr(1, 0, decaytimes.at(i)) * (SinOsc.ar(modfreqs2.at(i), 0) * 0.1 + 0.9 * amplitudes.at(i));
	Pan2.ar(SinOsc.ar(freq, 0), Rand(-1, 1), amp)
};
Mix.ar(partial.dup(spectrum.size))

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(Stepper.ar(Impulse.ar(10, 0), 0, 1, 10, 1, 1) * 100, 0) * 0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
Saw.ar(Select.kr(Stepper.kr(Impulse.kr(4, 0.1),  0,  0,  7,  1,  0),  [72, 63, 67, 72, 55, 62, 63, 60].midicps)) *  0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
Saw.ar(Select.kr(Stepper.kr(Impulse.kr(MouseX.kr(1, 40, 0, 0.2), 0.1),  0,  0,  7,  1,  0),  [72, 63, 67, 72, 55, 62, 63, 60].midicps)) *  0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(300 + (200 * Latch.ar(SinOsc.ar(13.3, 0), Impulse.ar(10, 0))), 0) * 0.2

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(400 * (1 + EnvGen.ar(Env([0, 1, 0, 0.5, -0.4], [0.1], ['step']), Impulse.kr(2.5, 0))), 0) * 0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(EnvGen.ar(Env([63, 63, 60, 55, 60], [0.125], ['step']), Impulse.kr(2, 0)).midicps, 0) * 0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
var trig = Impulse.ar(3, 0);
var sound = Mix.ar(LFPulse.ar(110 * [1, 5/2], 0.0, 0.5) * 0.2);
var env = EnvGen.ar(Env.perc(0.02, 0.2), trig, 1, 0, 1, 0);
Pan2.ar(sound, 0.0, env)

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
var t = MouseY.kr(0, 1, 0, 0.2) * [0, 128, 256, 128] / SampleRate.ir;
var e = Env([0, 0, 1, -1, 0], t, ['lin'], nil, nil, 0);
EnvGen.ar(e, Impulse.ar(MouseX.kr(10, 300, 1, 0.2), 0), 1, 0, 1, 0) * 0.2

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4 ; portamento/glide
Saw.ar((Stepper.ar(Impulse.ar(10, 0), 0, 1, 10, 1, 1) * 200).lag(MouseX.kr(0.0, 0.2, 0, 0.2))) * 0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
Ringz.ar(Saw.ar(LFNoise0.kr(5).lag(0.1).exprange(100, 2000)) * 0.2, 1000, 0.01) * 0.1

// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
Ringz.ar(Saw.ar(LFNoise0.kr(5).lag(MouseX.kr(0.01, 0.3, 0, 0.2)).exprange(100, 2000).round(20)) * 0.2, 1000, 0.01) * 0.1
