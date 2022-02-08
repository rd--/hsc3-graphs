// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; pm
var modfreq = MouseX.kr(1,1000, 1, 0.2);
var modindex = MouseY.kr(0.0, 100.0, 0, 0.2);
var conversion = 2 * pi / SampleRate.ir;
SinOsc.ar(0, Phasor.ar(0, 440 * conversion, 0, 2 * pi, 0) + (modfreq * modindex * conversion * SinOsc.ar(modfreq, 0))) * 0.25
