// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
SinOsc.ar(EnvGen.ar(Env(#[63, 63, 60, 55, 60], #[0.125], #[\step]), Impulse.kr(2, 0)).midicps, 0) * 0.1
