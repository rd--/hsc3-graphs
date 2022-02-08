// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(Stepper.ar(Impulse.ar(10, 0), 0, 1, 10, 1, 1) * 100, 0) * 0.1
