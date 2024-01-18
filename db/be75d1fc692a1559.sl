{- DustRange ; velvet noise (approx.) -}
let iot = 20 / SampleRate();
let x = MouseX(1, 16, 1, 0.1);
let d = DustRange(iot / x, iot * x);
let s = TRand(-1, 1, d);
Trig(d, SampleDur()) * s.Sign * 0.1
