{- MulAdd ; control rate -}
let ctl = (freq: 200, mul: 2, add: 40).localControls;
SinOsc([MulAdd(ctl::freq, ctl::mul, ctl::add), 440], 0) * 0.1
