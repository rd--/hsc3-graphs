{- tutorial 3.4 -}
let source = SinOsc(10, 0);
PinkNoise() * 0.1 * [source, Trig1(source, 0.001)]
