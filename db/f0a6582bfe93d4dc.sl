{- BlockSize (default=64) -}
let x = MouseX(2, 8, 0, 0.2);
SinOsc([BlockSize (), ControlDur () * SampleRate ()] * x, 0) * 0.05
