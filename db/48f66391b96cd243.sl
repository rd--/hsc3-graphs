{- SoftClip -}
let e = XLine(0.1, 10, 10);
let o = SinOsc(500, 0);
(o * e).SoftClip * 0.25
