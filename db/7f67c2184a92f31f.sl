{- SinOsc ; https://scsynth.org/t/6256/5 ; bipolar version -}
let freq = 130;
let squeezeStretch = LfTri(0.1, 0) * 5;
let tri = LfTri(freq, 1) * 0.5 + 0.5;
let pulse = LfPulse(freq, 0, 0.5) * 2 - 1;
let outPhase = pulse * (tri ^ (2 ^ squeezeStretch));
SinOsc(0, outPhase * pi) * 0.1
