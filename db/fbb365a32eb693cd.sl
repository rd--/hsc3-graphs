{- DelayL -}
let osc = SinOsc(MouseX(110, 440, 1, 0.2), 0) * 0.1;
[osc, DelayL(osc, 4, MouseY(0.5, 4, 0, 2))]
