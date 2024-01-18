{- LfSaw ; mixed with sin, then with distortions -}
let f = XLine(220, 440, 10);
let o1 = SinOsc(f + [0, 0.7], 0);
let o2 = LfSaw (f + [0, 0.7], 0) * 0.3;
let o3 = o1 + o2;
o3.Distort.Distort.Cubed * 0.5
