;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; pm
var modfreq = MouseX(1,1000, 1, 0.2);
var modindex = MouseY(0.0, 100.0, 0, 0.2);
var conversion = 2 * pi / SampleRate();
SinOsc(0, Phasor(0, 440 * conversion, 0, 2 * pi, 0) + (modfreq * modindex * conversion * SinOsc(modfreq, 0))) * 0.25
