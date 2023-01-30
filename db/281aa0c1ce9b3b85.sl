;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
var source = SinOsc(10, 0);
PinkNoise() * 0.1 * [source, Trig1(source, 0.001)]
