// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
Saw.ar(Select.kr(Stepper.kr(Impulse.kr(4, 0.1),  0,  0,  7,  1,  0),  [72, 63, 67, 72, 55, 62, 63, 60].midicps)) *  0.1
