{- 20061017 ; rd -}
let o = SinOsc(LfNoise0([0.5, 1.5]), 0);
let t = Impulse(Slope(o).Abs * [2, 3], 0);
let x = MouseX(960, 3620, 1, 0.2);
let y = MouseY(0.5, 2.0, 0, 0.2);
Ringz(Decay2(t, 0.1, 0.2), TRand(x, 3940, t), TRand(0.005, 0.275, t) * y)
