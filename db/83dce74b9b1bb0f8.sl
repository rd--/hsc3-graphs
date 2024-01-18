{- SplayAz ; Octophonic ; 2->8 ; Formerly error, also at Sc -}
let osc = SinOsc([333, 555], 0) * 0.1;
let orientation = MouseX(0, 1, 0, 0.2);
SplayAz(8, osc, 1, 1, 2, 0, orientation, true)
