{- https://scsynth.org/t/6452 -}
let o1 = Saw([2000 200 1000 4000]) * Perc(Impulse(5 * [2 0.5 0.25 0.125], 0), 0.01, 1, -4);
let o2 = SinOsc(128, 0) * Perc(Impulse(5 * 0.125, 0), 0.01, 1, -4);
(o1.Sum + o2) / 5
