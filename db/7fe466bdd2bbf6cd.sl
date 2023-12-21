(* tutorial 3.4 *)
var trig = Impulse(3, 0);
var sound = LfPulse(110 * [1, 5 / 2], 0, 0.5).Sum * 0.2;
var env = Decay2(trig, 0.02, 0.2);
Pan2(sound * env, 0, 1)
