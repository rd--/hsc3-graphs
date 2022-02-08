// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.5 ; bell patch
var spectrum = #[0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 4.1];
var amplitudes = #[0.25, 1, 0.8, 0.5, 0.9, 0.4, 0.3, 0.6, 0.1];
var numpartials = spectrum.size;
var modfreqs1 = {Rand.ir(1, 5)}.dup(numpartials);
var modfreqs2 = {Rand.ir(0.1, 3)}.dup(numpartials);
var decaytimes = {arg i; Rand.ir(2.5, 2.5 + (5 * (1.0 - (i / numpartials))))}.dup(numpartials);
var partial = {
    arg i;
	var freq = spectrum.at(i) + (SinOsc.kr(modfreqs1.at(i), 0) * 0.005) * 500;
	var amp = 0.1 * Line.kr(1, 0, decaytimes.at(i)) * (SinOsc.ar(modfreqs2.at(i), 0) * 0.1 + 0.9 * amplitudes.at(i));
	Pan2.ar(SinOsc.ar(freq, 0), Rand.ir(-1, 1), amp)
};
Mix.ar(partial.dup(spectrum.size))
