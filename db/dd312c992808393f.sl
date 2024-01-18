{- HenonC ; as a frequency control -}
let x = MouseX(1, 1.4, 0, 0.1);
let y = MouseY(0, 0.3, 0, 0.1);
let f0 = 40;
let f = HenonC(f0, x, [y, y * 0.75], 0, 0) * 800 + 900;
SinOsc(f, 0) * 0.4
