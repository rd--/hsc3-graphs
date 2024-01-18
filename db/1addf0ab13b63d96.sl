{- 20070423 ; rd ; requires=kr -}
let eggcrate = { :x :y | (x * pi).Cos * (y * pi).Sin };
let p = [64 72 96 128 256 6400 7200 8400 9600];
let x = BrownNoise();
let y = BrownNoise();
let t = Dust(2.4);
let f = LinLin(eggcrate(x, y), -1, 1, TChoose(t, p), TChoose(t, p));
let a = LinLin(x, -1, 1, 0, 0.1);
EqPan(SinOsc(f.kr, 0), y.kr) * a.kr
