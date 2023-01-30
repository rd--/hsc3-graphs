;; SinOsc ; https://scsynth.org/t/6256/5 ; bipolar version
var freq = 130;
var squeezeStretch = LfTri(0.1, 0) * 5;
var tri = LfTri(freq, 1) * 0.5 + 0.5;
var pulse = LfPulse(freq, 0, 0.5) * 2 - 1;
var outPhase = pulse * (tri ** (2 ** squeezeStretch));
SinOsc(0, outPhase * pi) * 0.1
