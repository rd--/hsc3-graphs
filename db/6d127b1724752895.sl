{- Changed ; SinOsc is constantly changing -}
let s = SinOsc(440, 0);
let c = Changed(s, 0);
s * c * 0.1
