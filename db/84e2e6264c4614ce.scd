// https://scsynth.org/t/6452
var o1 = Saw.ar([2000, 200, 1000, 4000]) * Perc.ar(Impulse.ar(5 * [2, 0.5, 0.25, 0.125], 0), 0.01, 1, -4);
var o2 = SinOsc.ar(128, 0) * Perc.ar(Impulse.ar(5 * 0.125, 0), 0.01, 1, -4);
Pan2.ar(o1.sum + o2, 0, 1 / 5)
