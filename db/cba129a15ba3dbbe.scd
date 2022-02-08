// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4 ; portamento/glide
Saw.ar((Stepper.ar(Impulse.ar(10, 0), 0, 1, 10, 1, 1) * 200).lag(MouseX.kr(0.0, 0.2, 0, 0.2))) * 0.1
