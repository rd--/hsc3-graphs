;; https://scsynth.org/t/6452
var o1 = Saw([2000, 200, 1000, 4000]) * Perc(Impulse(5 * [2, 0.5, 0.25, 0.125], 0), 0.01, 1, -4);
var o2 = SinOsc(128, 0) * Perc(Impulse(5 * 0.125, 0), 0.01, 1, -4);
Pan2(o1.sum + o2, 0, 1 / 5)
