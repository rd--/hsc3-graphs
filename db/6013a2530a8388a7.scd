// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(400 * (1 + EnvGen.ar(Env([0, 1, 0, 0.5, -0.4], [0.1], ['step']), Impulse.kr(2.5, 0))), 0) * 0.1
