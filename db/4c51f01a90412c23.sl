{- Vibrato -}
let n = LfNoise1(1) * 3 + 7;
let x = MouseX(0, 1, 0, 0.2);
let y = MouseY(0, 1, 0, 0.2);
let v = Vibrato(Dc(400), n, x, 1, 1, y, 0.1, 0, 0);
SinOsc(v, 0) * 0.1
