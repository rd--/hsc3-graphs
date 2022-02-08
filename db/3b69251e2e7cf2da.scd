// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; fm
var modfreq = MouseX.kr(1, 440, 1, 0.2);
var modindex = MouseY.kr(0.0, 10.0, 0, 0.2);
SinOsc.ar(SinOsc.ar(modfreq,0) * modfreq * modindex + 440, 0) * 0.25
