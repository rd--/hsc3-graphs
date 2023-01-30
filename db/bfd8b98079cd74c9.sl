;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.1 ; bell spectra
var rat = [0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 4.1];
var amp = [0.25, 1, 0.8, 0.5, 0.9, 0.4, 0.3, 0.6, 0.1] * 0.1;
SinOsc(500 * rat, 0).sum * amp
