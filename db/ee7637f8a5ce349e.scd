// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(300 + (200 * Latch.ar(SinOsc.ar(13.3, 0), Impulse.ar(10, 0))), 0) * 0.2
