;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; fm
var carfreq = 440;
var harmonicity = MouseX(0, 10, 0, 0.2).RoundTo(1);
var modindex = MouseY(0.0, 10.0, 0, 0.2);
var modfreq = carfreq * harmonicity;
SinOsc(carfreq + (SinOsc(modfreq, 0) * modfreq * modindex), 0.0) * 0.1
