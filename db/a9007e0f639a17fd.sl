;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.5 ; bell patch ; requires=kr
var spectrum = [0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 4.1];
var amplitudes = [0.25, 1, 0.8, 0.5, 0.9, 0.4, 0.3, 0.6, 0.1];
var numpartials = spectrum.size;
var modfreqs1 = { Rand(1, 5) } ! numpartials;
var modfreqs2 = { Rand(0.1, 3) } ! numpartials;
var decaytimes = 1.to(numpartials).collect { :i | Rand(2.5, 2.5 + (5 * (1.0 - (i - 1 / numpartials)))) };
var partial = { :i |
	var freq = spectrum[i] + (SinOsc(modfreqs1[i], 0) * 0.005) * 500;
	var amp = 0.1 * Line(1, 0, decaytimes[i], 0) * (SinOsc(modfreqs2[i], 0) * 0.1 + 0.9 * amplitudes[i]);
	Pan2(SinOsc(freq.kr, 0), Rand(-1, 1), amp.kr)
};
1.to(numpartials).collect(partial).sum
