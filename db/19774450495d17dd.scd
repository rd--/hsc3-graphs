// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
var trig = Impulse.ar(3, 0);
var sound = Mix.ar(LFPulse.ar(110 * [1, 5/2], 0.0, 0.5) * 0.2);
var env = EnvGen.ar(Env.perc(0.02, 0.2), trig, 1, 0, 1, 0);
Pan2.ar(sound, 0.0, env)
