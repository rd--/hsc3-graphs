// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; fm
var carfreq = 440;
var harmonicity = MouseX.kr(0, 10, 0, 0.2).round(1);
var modindex = MouseY.kr(0.0, 10.0, 0, 0.2);
var modfreq = carfreq * harmonicity;
SinOsc.ar(carfreq + (SinOsc.ar(modfreq, 0) * modfreq * modindex), 0.0) * 0.1
