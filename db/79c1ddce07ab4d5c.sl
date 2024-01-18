{- ControlIn ; read from control bus -}
let writer = ControlOut(7, LfNoise2(1) * 0.5 + 0.5);
let reader = SinOsc(ControlIn(1, 7) * 100 + 200, 0) * 0.1;
reader <! writer
