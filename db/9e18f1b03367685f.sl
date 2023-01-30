;; nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 2.4 ; fm
var modfreq = MouseX(1, 440, 1, 0.2);
var modindex = MouseY(0.0, 10.0, 0, 0.2);
SinOsc(SinOsc(modfreq,0) * modfreq * modindex + 440, 0) * 0.25
